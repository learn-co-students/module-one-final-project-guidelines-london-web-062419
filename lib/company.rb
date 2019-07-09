class Company < ActiveRecord::Base 
    has_many :trips
    has_many :customers, through: :trips

    def self.selectable_options
        self.all.map {|company| "#{company.name}, £#{rand(250..1000)}"}
    end 

end 