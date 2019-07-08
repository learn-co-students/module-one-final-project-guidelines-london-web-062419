require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  company1 = Company.create(name: "Go Explore")
company2 = Company.create(name: "Travel Buddy")
company3 = Company.create(name: "World Traveller")

  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end
