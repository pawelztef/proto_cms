source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.0"
gem "rails", "~> 5.2.3"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "puma", "~> 3.11"
gem "webpacker"
gem "jbuilder", "~> 2.5"
gem "bootsnap", ">= 1.1.0", require: false
gem 'jquery-rails'

gem "simple_form"
gem "devise"
gem "gon"
gem "image_processing", "~> 1.2"
gem "mini_magick"
gem "cancancan"
gem 'ancestry'


group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  gem 'awesome_print'
  gem 'meta_request'
  gem "better_errors"
  gem "pry-rails"
  gem 'pry-byebug'
  gem "binding_of_caller"
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end


