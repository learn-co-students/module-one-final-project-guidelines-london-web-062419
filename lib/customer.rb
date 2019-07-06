class Customer < ActiveRecord::Base 
    has_many :trips

    def search_customer 
        @current_customer = Customer.find_by(date_of_birth: customer_info[:date_of_birth], id: customer_info[:id])
        if @current_customer.empty?
        raise "Invalid account info!"
        end 
    end 
end 