module Middleman
  module Autoprefixer
    class Extension < ::Middleman::Extension
      option :browsers, nil, 'Supported browsers'
      option :cascade, nil, 'Should it cascade'
      option :inline, false, 'Whether to prefix CSS inline within HTML files'
      option :ignore, [], 'Patterns to avoid prefixing'

      def initialize(app, options = {}, &block)
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
        def initialize(app, options = {})
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

          type = headers['Content-Type'].split(';').first
          path = env['PATH_INFO']

          prefixed = process(response, type, path)

          if prefixed.is_a?(String)
            headers['Content-Length'] = ::Rack::Utils.bytesize(prefixed).to_s
            response = [prefixed]
          end

          [status, headers, response]
        end

        private

        def process(response, type, path)
          if standalone_css_content?(type, path)
            prefix(extract_styles(response))
          elsif inline_html_content?(type, path)
            prefix_inline_styles(extract_styles(response))
          else
            nil
          end
        end

        def prefix(content)
          config = {}
          config[:browsers] = Array(@browsers) unless @browsers.nil?
          config[:cascade]  = @cascade unless @cascade.nil?

          ::AutoprefixerRails.process(content, config).css
        end

        def prefix_inline_styles(content)
          content = content.dup
          content.gsub!(INLINE_CSS_REGEX) { $1 << prefix($2) << $3 }
          content
        end

        def extract_styles(response)
          ::Middleman::Util.extract_response_text(response)
        end

        def inline_html_content?(type, path)
          (type == 'text/html' || path.end_with?('.php')) && @inline
        end

        def standalone_css_content?(type, path)
          type == 'text/css' && @ignore.none? { |ignore| ::Middleman::Util.path_match(ignore, path) }
        end
      end
    end
  end
end
