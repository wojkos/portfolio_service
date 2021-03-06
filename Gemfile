source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'rubocop', require: false
gem 'haml', '~> 5.0', '>= 5.0.4'
gem 'friendly_id', '~> 5.2.0'
gem 'devise'
gem 'bootstrap', '~> 4.1.3'
gem 'jquery-rails'
gem 'wojtek_view_tool', git: 'https://github.com/wojkos/wojtek_view_tool'
gem 'petergate', '~> 1.6', '>= 1.6.3'
gem "font-awesome-rails"
gem 'kaminari'
gem 'bootstrap4-kaminari-views'
gem 'jquery-ui-rails', '~> 5.0', '>= 5.0.5'
# images upload
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'
gem 'carrierwave-aws'
gem 'dotenv-rails'
gem 'cocoon'
gem 'gritter', '~> 1.2'
gem 'twitter', '~> 6.2'
gem 'redis', '~> 3.3', '>= 3.3.1'
gem 'redcarpet', '~> 3.3', '>= 3.3.4'
gem 'coderay', '~> 1.1', '>= 1.1.2'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.8'
end

group :test do
  gem 'capybara', '~> 2.7', '>= 2.7.1'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-cucumber'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
