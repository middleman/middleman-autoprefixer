# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman/autoprefixer/version'

Gem::Specification.new do |spec|
  spec.name          = 'middleman-autoprefixer'
  spec.version       = Middleman::Autoprefixer::VERSION
  spec.authors       = ['Dominik Porada']
  spec.email         = ['dominik@porada.co']
  spec.summary       = 'Autoprefixer integration with Middleman'
  spec.description   = 'Automatically add vendor prefixes to CSS rules in the stylesheets ' +
                       'served in your Middleman project using values from Can I Use.'
  spec.homepage      = 'https://github.com/porada/middleman-autoprefixer'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ['lib']

  spec.add_dependency 'middleman-core'
  spec.add_dependency 'autoprefixer-rails', '~> 0.6'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
