class Company < ActiveRecord::Base 
    has_many :trips
    has_many :customers, through: :trips

    # def company_destination_price(selected_dest)
    #     DESTINATIONS["#{selected_dest}".to_sym]
    # end 

end 