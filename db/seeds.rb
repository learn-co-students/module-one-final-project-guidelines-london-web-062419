require_relative '../lib/constants'


customer1 = Customer.create(first_name: "Anne Marie", last_name: "O'Sullivan", email_address: "annemarie.os@gmail.com")
customer2 = Customer.create(first_name: "Harry", last_name: "Potter", email_address: "harry.potter@gmail.com")
customer3 = Customer.create(first_name: "Ronald", last_name: "Weasley", email_address: "ronald.weasly@gmail.com")


go_explore = Company.create(name: "Go Explore")
travel_buddy = Company.create(name: "Travel Buddy")
world_traveller = Company.create(name: "World Traveller")

# trip1 = Trip.create(name: "Toph's big trip", start_date: 24/9/19, end_date: 25/9/19, price: 450, destination: DESTINATIONS.sample,customer_id: customer1.id.to_i, company_id: travel_buddy.id.to_i)






