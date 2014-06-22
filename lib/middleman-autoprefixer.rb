require 'middleman-autoprefixer/version'
require 'middleman-autoprefixer/extension'

::Middleman::Extensions.register(:autoprefixer) do
  ::Middleman::Autoprefixer::Extension
end
