source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'
# Use mysql2 as the database for Active Record for Production
gem 'mysql2'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Dynamic addition of elements in dropdown
gem "select2-rails"
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use jQuery-Rails to add jQuery to the Asset Pipeline
gem 'jquery-rails'
# Devise for user authentication
gem 'devise'
# Forms made easy
gem 'simple_form'
# Semantic-UI as front-end framework
gem 'semantic-ui-sass', '~> 2.2', '>= 2.2.12.0'
# Will Paginate for paging models
gem 'will_paginate'
gem 'will_paginate_semantic_ui'
# Cocoon gem for dynamic and nested forms
gem 'cocoon'
# Chartkick for Graphs
gem 'chartkick'
# Groupdate for grouping the graph data
gem 'groupdate'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # Automatic behavior driven testing
  gem 'rspec-rails'
# Use mysql2 as the database for Active Record for Development and Test
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Generate an ERD using the command `rails erd`
  gem 'rails-erd'
  # Router Visualizer
  gem 'router-visualizer'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
