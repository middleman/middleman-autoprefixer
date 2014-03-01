module Middleman
  module Autoprefixer
    class Options
      attr_writer :browsers

      def initialize(options_hash = {})
        @browsers = options_hash[:browsers]
      end

      def browsers
        Array(@browsers)
      end
    end
  end
end
