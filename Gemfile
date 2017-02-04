source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 3.0', '>= 3.0.3'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2', '>= 4.2.1'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.6'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1', '>= 3.1.11'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'annotate', '~> 2.7', '>= 2.7.1'
  gem 'factory_girl_rails', '~> 4.7'
  gem 'faker', '~> 1.6', '>= 1.6.3'
  gem 'rails-controller-testing', git: 'https://github.com/rails/rails-controller-testing'
  gem 'rspec-rails', '~> 3.5'
  gem 'spring'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.1', '>= 3.1.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
end

group :test do
    gem 'capybara'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'cocoon'
gem 'ancestry', '~> 2.2', '>= 2.2.2'
gem 'bootstrap', '~> 4.0.0.alpha5'
gem 'font-awesome-sass', '~> 4.7'
gem 'paperclip', '~> 5.1'
gem 'validates_timeliness', '~> 4.0', '>= 4.0.2'
gem 'will_paginate', '~> 3.1', '>= 3.1.5'
gem 'sprockets-rails', :require => 'sprockets/railtie'

# Bootstrap tooltips and popovers depend on tether for positioning
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end