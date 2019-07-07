class CommandLineInterface 

    attr_reader :prompt
    attr_accessor :current_customer

  def initialize
    @prompt = TTY::Prompt.new
    @current_customer = nil
  end

  def greet 
    puts "Welcome to AA Adventures"
    user = prompt.select("Do you have an account with us?", %w(Yes No))
    if user == "Yes"
        user_login
    elsif user == "No"
        create_user 
        @current_customer = create_user
        puts "Welcome to AA Adventures, #{@current_customer.first_name}! Your unique Customer ID is #{current_customer.id}."
    end 
  end 

  def user_login
    customer_info = prompt.collect do
      key(:id).ask('Customer ID:')
      key(:email_address).ask('Email Address:')
      #TODO: authenticate email address
    end 
      user_display
  end 

  def create_user
    customer_attrs = prompt.collect do
      key(:first_name).ask('First name:', required: true)
      key(:last_name).ask('Surname:', required: true)
      key(:email_address).ask('Email Address:', required: true)
    end 
    c = Customer.new(**customer_attrs)
    c.save
    c
  end 

  def user_display
    selection = prompt.select("What would you like to do today?", ["Create New Trip", "View Existing Trips", "Delete Account", "Exit"])
    if selection == "Create New Trip"
      create_new_trip
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
    # Write prompt for date and destination (make it return a hash of name, start_date, end_date, and destination)
    # {name: "...", start_date: "...", end_date: "...", destination: "Thailand"}
    prompt.collect do 
      key(:name).ask("Name Your Trip:", required: true)
      key(:start_date).ask("Start Date: ", required: true)
      key(:end_date).ask("End Date: ", required: true)
    end 
    prompt.select("Where would you like to go?", [DESTINATIONS])
  end

  def select_company
    # Display company options with random prices and have user select one, returning hash of company name and price
    # {company_name: "...", price: 100}
    prompt.select("Select a company to travel with: ", ["Go Explore", "Travel Buddy", "World Traveller"])
  end

  def book_trip(trip_details, company_details)
    new_trip = Trip.create(
      name: trip_details[:name],
      start_date: trip_details[:start_date],
      end_date: trip_details[:end_date],
      price: 100,
      company_id: Company.where(name: company_details[:name]).id,
      customer_id: current_customer.id
    )
    puts "Trip successfully created. Your reference number is #{new_trip.id}"
  end

  def run 
    greet 
  end 


end 

