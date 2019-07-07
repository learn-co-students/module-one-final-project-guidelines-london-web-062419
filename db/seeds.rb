require_relative '../lib/constants'


customer1 = Customer.new(first_name: "Anne Marie", last_name: "O'Sullivan", date_of_birth: 10/8/93)
customer2 = Customer.new(first_name: "Harry", last_name: "Potter", date_of_birth: 11/14/90)
customer3 = Customer.new(first_name: "Ronald", last_name: "Weasley", date_of_birth: 01/2/88)


company1 = Company.new(name: "AA Ski")
company2 = Company.new(name: "AA Eats")
company3 = Company.new(name: "AA Sails")

trip1 = Trip.new(name: "Toph's big trip", start_date: 24/9/19, end_date: 25/9/19, price: 450, destination: DESTS_A.sample,customer_id: customer1.id.to_i, company_id: company2.id.to_i)






