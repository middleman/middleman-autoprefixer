require 'autoprefixer-rails'

module Middleman
  module Autoprefixer
    class << self
      def registered(app, options_hash={}, &block)
        app.after_configuration do
          AutoprefixerRails.install(sprockets)
        end
      end
      alias :included :registered
    end
  end
end
