require 'pry'
class Customer < ActiveRecord::Base 
    has_many :trips

    def view_customers_trips
       if Trip.all.select {|trip| trip.customer_id == nil}
        puts "You have no trips!"
       else 
        trips =  Trip.all.select {|trip| trip.customer_id == self.id}
        trips.map {|trip| "
         Trip Name: #{trip.name},
         Start Date: #{trip.start_date},
         End Date: #{trip.end_date}, 
         Price: #{trip.price}, 
         Destination: #{trip.destination}"}
        end 
    end 

end 