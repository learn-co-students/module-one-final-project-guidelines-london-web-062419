class Customer < ActiveRecord::Base 
    has_many :trips
    has_many :companies


end 