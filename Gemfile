source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'


gem 'rails', '~> 5.2.0'                                       # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

gem 'pg', '>= 0.18', '< 2.0'                                  # Use postgresql as the database for Active Record

gem 'puma', '~> 3.11'                                        # Use Puma as the app server

gem 'sass-rails', '~> 5.0'                                  # Use SCSS for stylesheets

gem 'uglifier', '>= 1.3.0'                                  # Use Uglifier as compressor for JavaScript assets

gem 'coffee-rails', '~> 4.2'                                 # Use CoffeeScript for .coffee assets and views

gem 'turbolinks', '~> 5'                                    # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks

gem 'jbuilder', '~> 2.5'                                    # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

gem 'devise'                                                #Use authentication solution for Rails based on Warden. It

gem 'bootsnap', '>= 1.1.0', require: false                   # Reduces boot times through caching; required in config/boot.rb

#gem 'bootstrap'                                             #style gem

gem 'bootstrap-sass'                                         #style gem

gem 'jquery-rails'                                           #This gem provides jQuery and the jQuery-ujs driver for your Rails 4+ application.

gem 'rails_admin'                                            #RailsAdmin is a Rails engine that provides an easy-to-use interface for managing your data.

gem 'kaminari'                                               #A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for modern web app frameworks and ORMs

gem "pundit"                                                #Pundit provides a set of helpers which guide you in leveraging regular Ruby classes and object oriented design patterns to build a simple, robust and scaleable authorization system.

gem 'acts_as_votable'                                        #Acts As Votable is a Ruby Gem specifically written for Rails/ActiveRecord models

gem 'carrierwave'                                           #This gem provides a simple and extremely flexible way to upload files from Ruby applications. It works well with Rack based web applications, such as Ruby on Rails.

gem "mini_magick"                                           #A ruby wrapper for ImageMagick or GraphicsMagick command line.

gem 'file_validators'                                     #File Validators gem adds file size and content type validations to ActiveModel. Any module that uses ActiveModel, for example ActiveRecord, can use these file validators.

group :development, :test do

  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]          # Call 'byebug' anywhere in the code to stop execution and get a debugger console
end

group :development do

  gem 'web-console', '>= 3.3.0'                                 # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'

  gem 'spring'                                                   # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'awesome_print'                                            # Pretty print your Ruby objects with style -- in full color and with proper indentation.

end

group :test do

  gem 'capybara', '>= 2.15', '< 4.0'                          # Adds support for Capybara system testing and selenium driver
  gem 'selenium-webdriver'

  gem 'chromedriver-helper'                                   # Easy installation and use of chromedriver to run system tests with Chrome
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]      # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
