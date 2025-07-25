source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.1'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'jbuilder'
gem 'redis', '~> 4.0'
gem 'sidekiq', '~> 6'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false
gem 'ffaker'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'web-console'
  gem 'sorbet'
  gem 'tapioca'
  gem 'pry'
  gem 'pry-rails'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'dotenv', groups: %i[development test]
gem 'annotate'
gem 'jsbundling-rails', '~> 1.3'
gem 'http'
gem 'prettier_print', '~> 1.2'
gem 'syntax_tree-rbs', '~> 1.0'
gem 'syntax_tree', '~> 6.2'

gem 'activerecord-enhancedsqlite3-adapter', '~> 0.6.0'
