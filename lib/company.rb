class Company < ActiveRecord::Base 
    has_many :customers, through: :trips
end 