source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'therubyracer'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'acts_as_list'

gem 'mini_magick'
gem 'carrierwave'
gem 'fog'

gem 'devise'
gem "cancan", :git => "git://github.com/ryanb/cancan.git", :branch => "2.0"

gem 'kaminari'

gem 'texticle', '~> 2.0', :require => 'texticle/rails'

gem 'newrelic_rpm'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development, :test do
  gem 'factory_girl_rails'
  gem 'ffaker'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'rspec-rails'
  gem 'steak'
  gem 'launchy'
end

group :production do
  gem 'pg'
end
