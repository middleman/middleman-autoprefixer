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

  spec.add_dependency 'middleman', '~> 3.2'
  spec.add_dependency 'autoprefixer-rails', '~> 1.1.20140302'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 10.1'

  spec.add_development_dependency 'cucumber', '~> 1.3.14'
  spec.add_development_dependency 'aruba', '~> 0.5.4'
end
