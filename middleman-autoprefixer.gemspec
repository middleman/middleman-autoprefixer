# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman-autoprefixer/version'

Gem::Specification.new do |spec|
  spec.name          = 'middleman-autoprefixer'
  spec.version       = Middleman::Autoprefixer::VERSION
  spec.authors       = ['Dominik Porada']
  spec.email         = ['dominik@porada.co']
  spec.summary       = 'Autoprefixer integration with Middleman'
  spec.homepage      = 'https://github.com/porada/middleman-autoprefixer'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = `git ls-files -- {features,fixtures}/*`.split($/)
  spec.require_paths = ['lib']

  spec.add_dependency 'middleman'
  spec.add_dependency 'autoprefixer-rails', '~> 1.1.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

  spec.add_development_dependency 'cucumber', '~> 1.3.10'
  spec.add_development_dependency 'aruba', '~> 0.5.4'

  spec.post_install_message = <<-TEXT


    If you’re updating middleman-autoprefixer from the version ≤ 0.2,
    please note that Autoprefixer’s `browsers` option now defaults to:

        > 1%, last 2 versions, Firefox 17, Opera 12.1

    If you prefer the previous configuration, don’t lock the version
    of this gem because it might not help. Edit your config.rb instead:

        activate :autoprefixer do |config|
          config.browsers = 'last 2 versions'
        end

    You can read more here: github.com/ai/autoprefixer#browsers


  TEXT
end
