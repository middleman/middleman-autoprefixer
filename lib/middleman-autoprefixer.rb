require 'middleman-core'

require_relative 'middleman-autoprefixer/version'
require_relative 'middleman-autoprefixer/extension'

::Middleman::Extensions.register(:autoprefixer) do
  ::Middleman::Autoprefixer::Extension
end
