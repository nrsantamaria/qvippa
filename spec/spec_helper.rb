ENV["RACK_ENV"] = "test"

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

# require "rspec"
# require "pg"
# require "pry"
# require "sinatra/activerecord"
# require "user"
# require "feed"
# require "qvipp"
# require "shoulda/matchers"

RSpec.configure do |config|
  config.after(:each) do
    User.all.each do |u|
      u.destroy
    end
    Feed.all.each do |f|
      f.destroy
    end
    Qvipp.all.each do |q|
      q.destroy
    end
  end
end
