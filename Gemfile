source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.8'

gem "ar-uuid"
gem 'bcrypt', '~> 3.1.7'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
gem "jwt_sessions"
gem 'rails', '~> 6.0.3', '>= 6.0.3.6'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
# Use Active Model has_secure_password
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'pry'
  gem 'pry-nav'
  gem 'faker', '~> 1.8', '>= 1.8.4'
  gem 'rspec-rails', '~> 3.7'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
