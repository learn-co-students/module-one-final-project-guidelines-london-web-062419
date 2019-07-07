require_relative '../lib/constants'


customer1 = Customer.create(first_name: "Anne Marie", last_name: "O'Sullivan", email_address: "annemarie.os@gmail.com")
customer2 = Customer.create(first_name: "Harry", last_name: "Potter", email_address: "harry.potter@gmail.com")
customer3 = Customer.create(first_name: "Ronald", last_name: "Weasley", email_address: "ronald.weasly@gmail.com")


aa_ski = Company.create(name: "AA Ski")
aa_eats = Company.create(name: "AA Eats")
aa_sails = Company.create(name: "AA Sails")

trip1 = Trip.create(name: "Toph's big trip", start_date: 24/9/19, end_date: 25/9/19, price: 450, destination: DESTS_A.sample,customer_id: customer1.id.to_i, company_id: aa_eats.id.to_i)






