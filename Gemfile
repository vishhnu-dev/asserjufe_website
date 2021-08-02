source 'https://rubygems.org'

ruby '2.5.8'
gem 'rails', '= 5.2.3'

# Native gems #
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Server #
gem 'puma', '~> 4.3', '>= 4.3.8'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Custom gems #
# Sass-rails
gem 'sassc-rails', '>= 2.1.0'
# FontAwesome
gem "font-awesome-rails"
# Wice_grid
gem 'wice_grid'
# Pundit
gem 'pundit'
# Devise
gem 'devise'
# Devise i18n
gem 'devise-i18n'
# jquery-rails
gem 'jquery-rails'
# recaptcha
gem 'recaptcha'
# uploads
gem 'carrierwave', '~> 2.0'
# datetime
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'
# text_area
gem 'bootstrap-wysihtml5-rails'
# data-confirm-moda-b3
gem 'data-confirm-modal'

gem 'rails_same_site_cookie'

# ED25519 Supoport #
gem 'ed25519', '>= 1.2', '<= 1.2.4'
gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]