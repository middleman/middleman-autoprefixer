require 'autoprefixer-rails'

module Middleman
  module Autoprefixer
    class Processor < AutoprefixerRails::Processor
      def configure(sprockets_environment)
        sprockets_environment.register_postprocessor 'text/css', :autoprefixer do |_, data|
          process(data).css rescue data
        end
      end
    end
  end
end
