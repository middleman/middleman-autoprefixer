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
activate :autoprefixer, browsers: ['last 2 versions', 'ie 8', 'ie 9']
```

The optional `browsers` field takes a string or array of strings accordingly to [Autoprefixer’s documentation](https://github.com/ai/autoprefixer#browsers).

## License

Middleman Autoprefixer was created by [Dominik Porada](http://github.com/porada) is distributed under the [MIT](http://porada.mit-license.org/) license.
