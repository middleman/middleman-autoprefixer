require 'autoprefixer-rails'

module Middleman
  module Autoprefixer
    class Processor < AutoprefixerRails::Processor
      def initialize(options)
        super *to_processor_arguments(options)
      end

      def postprocess(context, content)
        begin
          process(content).css
        rescue ExecJS::ProgramError => error
          if error.message =~ /Can't parse CSS/
            content
          else
            raise error
          end
        end
      end

      def configure(sprockets_env)
        sprockets_env.register_postprocessor 'text/css', :autoprefixer, &method(:postprocess)
      end

      private

      def to_processor_arguments(options)
        [
          Array(options.browsers),
          options.to_h.except(:browsers).reject { |_, value| value.nil? }
        ]
      end
    end
  end
end
