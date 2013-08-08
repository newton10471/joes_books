source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '3.2.7'
gem 'bootstrap-sass', '2.0.4'
gem 'faker', '1.0.1'
gem 'cancan', '1.6.8'
gem 'vacuum', '0.3.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'devise'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'simplecov', require: false
  gem 'rspec-rails'
  gem 'jasmine'
  gem 'factory_girl_rails'
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
  gem 'pry-debugger'
  gem 'capybara', '2.0.0'
  gem 'zeus'
end


group :development do
  gem 'sqlite3'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'awesome_print'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
