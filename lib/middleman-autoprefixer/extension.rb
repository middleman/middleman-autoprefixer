require_relative 'processor'

module Middleman
  module Autoprefixer
    class Extension < ::Middleman::Extension
      option :browsers
      option :cascade

      def initialize(app, options_hash = {}, &block)
        super
      end

      def after_configuration
        Processor.new(options).configure(app.sprockets)
      end
    end
  end
end
