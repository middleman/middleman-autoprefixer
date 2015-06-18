[![Gem version](http://img.shields.io/gem/v/middleman-autoprefixer.svg?style=flat)](http://badge.fury.io/rb/middleman-autoprefixer) [![Build status](http://img.shields.io/travis/middleman/middleman-autoprefixer.svg?style=flat)](https://travis-ci.org/middleman/middleman-autoprefixer) [![Coveralls](http://img.shields.io/coveralls/middleman/middleman-autoprefixer.svg?style=flat)](https://coveralls.io/r/middleman/middleman-autoprefixer) [![Dependency status](http://img.shields.io/gemnasium/middleman/middleman-autoprefixer.svg?style=flat)](https://gemnasium.com/middleman/middleman-autoprefixer) [![Code Climate](http://img.shields.io/codeclimate/github/middleman/middleman-autoprefixer.svg?style=flat)](https://codeclimate.com/github/middleman/middleman-autoprefixer)

# Middleman::Autoprefixer

> Automatically add vendor prefixes to CSS rules in stylesheets served by Middleman.

## Usage

Add the following line to `Gemfile`, then run `bundle install`:

```ruby
gem 'middleman-autoprefixer'
```

After installation, activate the extension in `config.rb`:

```ruby
activate :autoprefixer
```

## Configuration

The extension has 5 optionally configurable fields:

```ruby
activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 9']
  config.remove   = false
  config.cascade  = false
  config.inline   = true
  config.ignore   = ['hacks.css']
end
```

### browsers

The list of targeted browsers. Takes values and uses defaults accordingly to [Autoprefixer’s documentation](https://github.com/postcss/autoprefixer#browsers).

### remove

Whether to remove outdated prefixes: `true` or `false`. Enabled by default.

### cascade

The visual cascade of prefixed properties: `true` or `false`.  Uses the default value accordingly to [Autoprefixer’s documentation](https://github.com/postcss/autoprefixer#visual-cascade).

### inline

Whether to prefix inline styles within HTML files: `true` or `false`. Disabled by default.

### ignore

The array of patterns or paths to exclude from prefixing. Empty by default.

## License

Middleman Autoprefixer was created by [Dominik Porada](http://github.com/porada) is distributed under the [MIT](http://porada.mit-license.org/) license.
