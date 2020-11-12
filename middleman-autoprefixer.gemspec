# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman-autoprefixer/version'

Gem::Specification.new do |spec|
  spec.name          = 'middleman-autoprefixer'
  spec.version       = Middleman::Autoprefixer::VERSION
  spec.authors       = ['Dominik Porada', 'Thomas Reynolds']
  spec.email         = ['dominik@porada.co', 'me@tdreyno.com']
  spec.summary       = 'Automatically vendor-prefix stylesheets served by Middleman.'
  spec.homepage      = 'https://github.com/middleman/middleman-autoprefixer'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = `git ls-files -- {features,fixtures}/*`.split($/)
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.2.0'

  spec.add_runtime_dependency 'middleman-core',     '>= 4.0.0'
  spec.add_runtime_dependency 'autoprefixer-rails', '~> 10.0'
end
