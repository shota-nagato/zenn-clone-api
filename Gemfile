source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.1.3"
gem "mysql2", "~> 0.5"
gem "puma", "~> 6.4"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", require: false

gem "active_model_serializers"
gem "config"
gem "devise"
gem "devise-i18n"
gem "devise_token_auth", ">= 1.2.0", git: "https://github.com/lynndylanhurley/devise_token_auth"
gem "rack-cors"

group :development, :test do
  gem "factory_bot_rails"
  gem "faker"
  gem "letter_opener_web"
  gem "pry-byebug"
  gem "pry-doc"
  gem "pry-rails"
  gem "rspec-rails"
  gem "standard", require: false
end
