source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.8", ">= 7.0.8.1"
gem "mysql2", "~> 0.5"
gem "puma", "~> 5.0"

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", require: false

group :development, :test do
  gem "pry-byebug"
  gem "pry-doc"
  gem "pry-rails"
  gem "rspec-rails"
  gem "standard", require: false
end
