# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'rake', '~> 13.0', '>= 13.0.1'

group :development do
  gem 'reek', '~> 5.4', require: false
  gem 'rubocop', '~> 0.76.0', require: false
  gem 'rubocop-rspec', '~> 1.36', require: false
end

group :test do
  gem 'rspec', '~> 3.9'
end
