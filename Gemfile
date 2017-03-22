source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.0.1"
gem "geocoder"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "devise"
gem "omniauth"
gem "omniauth-facebook"
gem "cancancan"
gem "bootstrap-sass"
gem "font-awesome-rails"
gem "ffaker"
gem "awesome_print"
gem "retinajs-rails", "~> 2.1.1"
gem "jquery-turbolinks"
gem 'simple_form'
gem "carrierwave", github:"carrierwaveuploader/carrierwave"

group :development, :test do
  gem "byebug", platform: :mri
end

group :development do
  gem "meta_request"
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "sqlite3"
end

group :production do
  gem "pg"
end

gem "tzinfo-data"
