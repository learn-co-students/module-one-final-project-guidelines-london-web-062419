require_relative '../lib/constants'

# 20.times {Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, date_of_birth: Faker::Date.birthday(18, 65))}
customer1 = Customer.new(first_name: "Anne Marie", last_name: "O'Sullivan", date_of_birth: "10/08/1993")

company1 = Company.new(name: "AA Ski")
company2 = Company.new(name: "AA Eats")
company3 = Company.new(name: "AA Sails")

2.times {Trip.create(name: Faker::Name.name, start_date: Faker::Date.between(12.days.ago, Date.today)), end_date: Faker:Date.forward(7), price: rand(100..1000), destination: DESTS_A.sample, company_id: company1.id.to_i, customer_id: customer1.id.to_i}



# destination1 = Destination.new(name: "Le Deux Alpes, France", company: company1, type: "Economy")
# destination2 = Destination.new(name: "Saalbach Hinterglemm, Austria", company: company1, type: "Economy Plus")
# destination3 = Destination.new(name: "Val Thorens, France", company: company1, type: "Premium")
# destination4 = Destination.new(name: "St. Anton, Austria",  company: company1, type: "Economy")
# destination5 = Destination.new(name: "Soldeu, Andorra", company: company1, type: "Economy Plus")
# destination6 = Destination.new(name: "Yuzawa, Japan", company: company1, type: "Premium")
# destination7 = Destination.new(name: "Livigno, Italy", company: company1, type: "Economy")
# destination8 = Destination.new(name: "Kronplatz, Italy", company: company1, type: "Economy Plus")
# destination9 = Destination.new(name: "Hakuba, Japan", company: company1, type: "Premium")
# destination10 = Destination.new(name: "Bangkok, Thailand", company: company2, type: "Economy")
# destination11 = Destination.new(name: "Bologna, Italy", company: company2, type: "Economy Plus")
# destination12 = Destination.new(name: "New York, USA", company: company2, type: "Premium")
# destination13 = Destination.new(name: "Manila, Philippines", company: company2, type: "Economy")
# destination14 = Destination.new(name: "Lisbon, Portugal", company: company2, type: "Economy Plus")
# destination15 = Destination.new(name: "Paris, France", company: company2, type: "Premium")
# destination16 = Destination.new(name: "Bordeaux, France", company: company2, type: "Economy")
# destination17 = Destination.new(name: "San Sebastian, Spain", company: company2, type: "Economy Plus")
# destination18 = Destination.new(name: "Mendoza, Argentina", company: company2, type: "Premium")
# destination19 = Destination.new(name: "Nairobi, Kenya", company: company3, type: "Economy")
# destination20 = Destination.new(name: "Kimanjo, Kenya", company: company3, type: "Economy Plus")
# destination21 = Destination.new(name: "Batan, Costa Rica", company: company3, type: "Premium")
# destination22 = Destination.new(name: "Mendoza, Argentina", company: company3, type: "Economy")
# destination23 = Destination.new(name: "Kahawa, Kenya", company: company3, type: "Economy Plus")
# destination24 = Destination.new(name: "Ulaan Baatar, Mongolia", company: company3, type: "Premium")
# destination25 = Destination.new(name: "Antananarivo, Madagascar", company: company3, type: "Economy")
# destination26 = Destination.new(name: "Chiang Mai, Thailand", company: company3, type: "Economy Plus")
# destination27 = Destination.new(name: "Fairbanks, Alaska", company: company3, type: "Premium")
# destination28 = Destination.new(name: "Sardinia, Italy", company: company4, type: "Economy")
# destination29 = Destination.new(name: "Hvar Island, Croatia", company: company4, type: "Economy Plus")
# destination30 = Destination.new(name: "Krugar National Park, South Africa", company: company4)
# destination31 = Destination.new(name: "Nanyuki, Kenya", company: company4, type: "Economy", type: "Premium")
# destination32 = Destination.new(name: "Bay of Islands, New Zealand", company: company4, type: "Economy Plus")
# destination33 = Destination.new(name: "Azores, Portugal", company: company4, type: "Premium")
# destination34 = Destination.new(name: "Norwegian Fjords, Norway", company: company4, type: "Economy")
# destination35 = Destination.new(name: "Tahiti", company: company4, type: "Economy Plus")
# destination36 = Destination.new(name: "Greek Islands", company: company4, type: "Premium")




