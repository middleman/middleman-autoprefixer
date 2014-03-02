activate :autoprefixer do |config|
  config.browsers = ['Safari 5', 'Firefox 15']
  config.cascade  = true
end

compass_config do |config|
  config.output_style = :expanded
end
