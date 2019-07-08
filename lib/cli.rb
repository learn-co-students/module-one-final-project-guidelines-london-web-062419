class CommandLineInterface 

    attr_reader :prompt, :current_customer

  def initialize
    @prompt = TTY::Prompt.new
  end

  def greet 
    puts "Welcome to Flatironpedia"
    existing_user = prompt.select("Do you have an account with us?", %w(Yes No))
    if existing_user == "Yes"
        user_login
        user_display
    elsif existing_user == "No"
        @current_customer = create_user 
        puts "Welcome to Flatironpedia, #{@current_customer.first_name}! Your unique Customer ID is #{current_customer.id}."
        user_display
    end 
  end 

  def user_login
    customer_info = prompt.collect do
      key(:id).ask('Customer ID:', require: true)
      key(:email_address).ask('Email Address:', require: true)
      #TODO: authenticate email address
    end 
    customer = Customer.where(id: customer_info[:id], email_address: customer_info[:email_address]).last
    if customer.nil?
      puts "Invalid credentials! Please try again"
      user_login
    else 
      puts "Login successful"
      @current_customer = customer
    end 
  end 

  def create_user
    customer_attrs = prompt.collect do
      key(:first_name).ask('First name:', required: true)
      key(:last_name).ask('Surname:', required: true)
      key(:email_address).ask('Email Address:', required: true)
    end 
    c = Customer.create(**customer_attrs)
    c
  end 

  def user_display
    selection = prompt.select("What would you like to do today?", ["Create New Trip", "View Existing Trips", "Delete Account", "Exit"])
    if selection == "Create New Trip"
      create_new_trip
      # TODO: Complete remainder of selections - view trip, edit trip, delete account.
    end
  end

  def create_new_trip
    # 1. Select dates & destination
    trip_details = configure_trip_details

    # 2. Choose company (with prices)
    company_details = select_company

    # 3. Confirm and book trip (and name trip)
    book_trip(trip_details, company_details)
  end

  def configure_trip_details
    # Write prompt for date and destination 
    trip_details = prompt.collect do 
      key(:name).ask("Name Your Trip: ", required: true)
      key(:start_date).ask("Start Date: ", required: true)
      key(:end_date).ask("End Date: ", required: true)
    end 

    selected_destination = prompt.select("Where would you like to go?", DESTINATIONS)

    {    
      name: trip_details[:name],
      start_date: trip_details[:start_date],
      end_date: trip_details[:end_date],
      destination: selected_destination 
    }
  end

  def select_company
    # Display company options with random prices and have user select one, returning hash of company name and price
    # {company_name: "...", price: 100}
    company_options = Company.all.map {|company| "#{company.name}, £#{rand(250..1000)}"}
    selection = prompt.select("Select a company to travel with: ", company_options)
    parsed_selection = selection.split(', £')
    {name: parsed_selection[0], price: parsed_selection[1].to_i}
  end

  def book_trip(trip_details, company_details)
    new_trip = Trip.create(
      name: trip_details[:name],
      start_date: trip_details[:start_date],
      end_date: trip_details[:end_date],
      price: company_details[:price],
      # TODO: randomise price and associate it to each company
      destination: trip_details[:destination],
      company_id: Company.where(name: company_details[:name]).last.id,
      customer_id: current_customer.id
    )
    puts "Trip successfully created. Your reference number is #{new_trip.id}"
  end

  def run 
    greet 
  end 


end 



