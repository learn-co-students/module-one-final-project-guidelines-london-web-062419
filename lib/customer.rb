require 'pry'
class Customer < ActiveRecord::Base 
    has_many :trips

    def view_customers_trips
       if self.trips.empty?
        puts "You have no trips!"
       else
        self.trips.map {|trip| "
         Trip Name: #{trip.name},
         Start Date: #{trip.start_date},
         End Date: #{trip.end_date}, 
         Price: #{trip.price}, 
         Destination: #{trip.destination}
         "}
        end 
    end 

    def delete_account
      self.destroy
    end 

end 