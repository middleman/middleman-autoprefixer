module Middleman
  module Autoprefixer
    class Options
      attr_writer :browsers
      attr_reader :config

      def initialize(options_hash = {})
        @browsers = options_hash[:browsers]
        @config   = options_hash.slice(:cascade)
      end

      def browsers
        Array(@browsers)
      end

      def cascade=(value)
        @config.merge!(cascade: value)
      end

      def params
        [browsers, config]
      end
    end
  end
end
