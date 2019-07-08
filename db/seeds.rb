require_relative '../lib/constants'

company1 = Company.create(name: "Go Explore")
company2 = Company.create(name: "Travel Buddy")
company3 = Company.create(name: "World Traveller")

customer1 = Customer.create(first_name: "Laura", last_name: "O'Sullivan", email_address: "laura.dent@gmail.com")
customer2 = Customer.create(first_name: "Moose", last_name: "Loser", email_address: "loser@gmail.com")


puts "----------------------------------------"
puts "----------------------------------------"
puts "------------- SEEDS RAN  ---------------"
puts "----------------------------------------"
puts "----------------------------------------"

trip1 = Trip.create(name: "Toph's big trip", start_date: 24/9/19, end_date: 25/9/19, price: 450, destination: DESTINATIONS.sample, customer_id: customer1.id.to_i, company_id: company1.id.to_i)
trip2 = Trip.create(name: "Lads Trip", start_date: 29/9/19, end_date: 31/10/19, price: 780, destination: DESTINATIONS.sample, customer_id: customer2.id.to_i, company_id: company2.id.to_i)





