[![Gem version](https://badge.fury.io/rb/middleman-autoprefixer.png)](http://badge.fury.io/rb/middleman-autoprefixer) [![Dependency status](https://gemnasium.com/porada/middleman-autoprefixer.png)](https://gemnasium.com/porada/middleman-autoprefixer) [![Build status](https://travis-ci.org/porada/middleman-autoprefixer.png?branch=master)](https://travis-ci.org/porada/middleman-autoprefixer)

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

The extension has 2 optionally configurable fields:

```ruby
activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 9']
  config.cascade  = false
end
```

Both fields take values (and use defaults) accordingly to [Autoprefixer’s](https://github.com/ai/autoprefixer#browsers) [documentation](https://github.com/ai/autoprefixer#visual-cascade).

## License

Middleman Autoprefixer was created by [Dominik Porada](http://github.com/porada) is distributed under the [MIT](http://porada.mit-license.org/) license.
