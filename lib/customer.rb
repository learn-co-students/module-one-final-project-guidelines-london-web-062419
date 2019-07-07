class Customer < ActiveRecord::Base 
    has_many :trips
    has_many :companies

    def search_customer 
        @current_customer = Customer.find_by(last_name: customer_info[:last_name], id: customer_info[:id])
        if @current_customer.empty?
        raise "Invalid account info!"
        end 
    end 
end 