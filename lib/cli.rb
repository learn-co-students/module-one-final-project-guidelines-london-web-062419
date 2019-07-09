class CommandLineInterface 

    attr_reader :prompt, :current_customer

  def initialize
    @prompt = TTY::Prompt.new
  end

  def greet 
    puts "Welcome to Holibopper!"
    existing_user = prompt.select("Do you have an account with us?", %w(Yes No))
    if existing_user == "Yes"
        user_login
        sleep 2
        user_display
    elsif existing_user == "No"
        @current_customer = create_user 
        puts "Congratulations on creating your new account, #{@current_customer.first_name}! Your unique Customer ID is #{current_customer.id}."
        sleep 2
        user_display
    end 
  end 

  def user_login
    customer_info = prompt.collect do
      key(:id).ask('Customer ID:', require: true)
      key(:email_address).ask('Email Address:', require: true)
    end 
    customer = Customer.where(id: customer_info[:id], email_address: customer_info[:email_address]).last
    if customer.nil?
      puts "Invalid credentials! Please try again"
      sleep 2
      clear_screen
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
    selection = prompt.select("What would you like to do today?", ["Create New Trip", "View Trips", "Edit Trip", "Delete Account", "Exit"])
    if selection == "Create New Trip"
      create_new_trip
    elsif selection == "View Trips"
       view_trips
    elsif selection == "Edit Trip"
      selected_trip = select_trip_to_edit
      puts selected_trip.attributes
      update_trip_details(selected_trip)

      puts "Your trip has been successfully updated!"
      # TODO: Show updated values for trip
      sleep 2
      user_display
    elsif selection == "Delete Account"
      current_customer.delete_account
      puts "Your account has been closed :(" 
      sleep 1
      greet 
    elsif selection == "Exit"
      puts "Goodbye :-("
      sleep 2
    end
  end

  def create_new_trip
    # 1. Select dates & destination
    trip_details = configure_trip_details

    # 2. Choose company (with prices)
    company_details = select_company

    # 3. Confirm and book trip 
    book_trip(trip_details, company_details)
  end

  def configure_trip_details
    # Write prompt for date and destination 
    trip_details = prompt.collect do 
      key(:name).ask("Name Your Trip: ", required: true)
      key(:start_date).ask("Start Date (DD-MM-YYYY): ", required: true)
      key(:end_date).ask("End Date (DD-MM-YYYY): ", required: true)
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
    company_options = Company.selectable_options
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
      destination: trip_details[:destination],
      company_id: Company.where(name: company_details[:name]).last.id,
      customer_id: current_customer.id
    )
    puts "Trip successfully created. Your reference number is #{new_trip.id}"
    user_display
    end

    # def select_trip
    #   trip_options = Customer.view_my_trips
    #   selection = prompt.select("Select your trip: ", trip_options)
    #   parsed_selection = selection.split(',')
    #   {name: parsed_selection[0]}
    # end 

  def view_trips 
    puts @current_customer.view_customers_trips
     user_display
  end 

  def select_trip_to_edit
    trip_names = current_customer.trips.map {|trip| trip.name}
    selected_trip_name = prompt.select("Select a trip to edit:", trip_names)
    Trip.where(name: selected_trip_name).last
  end 

  def update_trip_details(trip)
    trip_details = prompt.collect do 
      key(:name).ask("Name Your Trip: ")
      key(:start_date).ask("Start Date (DD-MM-YYYY): ")
      key(:end_date).ask("End Date (DD-MM-YYYY): ")
    end

    trip.name = trip_details[:name] unless trip_details[:name].nil?
    trip.start_date = trip_details[:start_date] unless trip_details[:start_date].nil?
    trip.end_date = trip_details[:end_date] unless trip_details[:end_date].nil?
    trip.save
  end 


  def run 
    greet 
  end 


end 



