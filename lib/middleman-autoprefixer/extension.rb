module Middleman
  module Autoprefixer
    class Extension < ::Middleman::Extension
      option :browsers, nil, 'Supported browsers'
      option :cascade, nil, 'Should it cascade'
      option :inline, false, 'Whether to prefix CSS inline within HTML files'
      option :ignore, [], 'Patterns to avoid prefixing'

      def initialize(app, options={}, &block)
        super

        require 'middleman-core/util'
        require 'autoprefixer-rails'
      end

      def after_configuration
        # Setup Rack middleware to apply prefixes
        app.use Rack, browsers: options[:browsers],
                      cascade: options[:cascade],
                      inline: options[:inline],
                      ignore: options[:ignore]
      end

      # Rack middleware to look for CSS and apply prefixes.
      class Rack
        INLINE_CSS_REGEX = /(<style[^>]*>\s*(?:\/\*<!\[CDATA\[\*\/\n)?)(.*?)((?:(?:\n\s*)?\/\*\]\]>\*\/)?\s*<\/style>)/m

        # Init
        # @param [Class] app
        # @param [Hash] options
        def initialize(app, options={})
          @app = app
          @browsers = options[:browsers]
          @cascade = options[:cascade]
          @inline = options[:inline]
          @ignore = options[:ignore]
        end

        # Rack interface
        # @param [Rack::Environmemt] env
        # @return [Array]
        def call(env)
          status, headers, response = @app.call(env)

          if inline_html_content?(env['PATH_INFO'])
            prefixed = ::Middleman::Util.extract_response_text(response)

            prefixed.gsub!(INLINE_CSS_REGEX) do
              $1 << process($2) << $3
            end

            headers['Content-Length'] = ::Rack::Utils.bytesize(prefixed).to_s
            response = [prefixed]
          elsif standalone_css_content?(env['PATH_INFO'])
            prefixed_css = process(::Middleman::Util.extract_response_text(response))

            headers['Content-Length'] = ::Rack::Utils.bytesize(prefixed_css).to_s
            response = [prefixed_css]
          end

          [status, headers, response]
        end

        private

        def process(css)
          config = {}
          config[:browsers] = Array(@browsers)
          config[:cascade] = @cascade unless @cascade.nil?

          ::AutoprefixerRails.process(css, config).css
        end

        def inline_html_content?(path)
          (path.end_with?('.html') || path.end_with?('.php')) && @inline
        end

        def standalone_css_content?(path)
          path.end_with?('.css') && @ignore.none? { |ignore| ::Middleman::Util.path_match(ignore, path) }
        end
      end
    end
  end
end
