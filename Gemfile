source "http://rubygems.org"
ruby '1.9.3', engine: 'jruby', engine_version: '1.7.3'


# Declare your gem's dependencies in atom_smasher.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'

gem 'simple-rss'
gem "ruby-readability", :require => 'readability'
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyrhino'

  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation', '~> 4'
end

group :test, :development do
  gem "rspec-rails"
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'database_cleaner'
end

gem 'jquery-rails'
gem "haml", ">= 4"
gem "haml-rails", :group => :development
gem 'quiet_assets', :group => :development