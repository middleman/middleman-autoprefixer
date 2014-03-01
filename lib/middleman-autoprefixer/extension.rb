require_relative 'options'
require_relative 'processor'

module Middleman
  module Autoprefixer
    class << self
      def registered(app, options_hash = {}, &block)
        @@options = Options.new(options_hash)
        yield @@options if block_given?

        app.after_configuration do
          Processor.new(@@options.browsers).configure(sprockets)
        end
      end
      alias :included :registered
    end
  end
end
