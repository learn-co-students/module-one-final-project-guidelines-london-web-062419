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
    selection = prompt.select("What would you like to do today?", %w(Search_Trips  View_Trip(s) Edit_Existing_Trips Delete_Account Exit))
    if selection == "Search_Trips"
      search_trips
    end
  end 

  def search_trips
    dest_selection = prompt.select("Select a company: ", %w(AA_Ski AA_Eats AA_Sails))
      if dest_selection == "AA_Ski"
        travel_dates = prompt.collect do
          key(:start_date).ask("Select a start date: ", required: true)
          key(:end_date).ask("Select an end date: ", required: true) 
      elsif 
        dest_selection == "AA_Eats"
        travel_dates 
      elsif 
        dest_selection == "AA_Sails"
        travel_dates
      end 
    end 
  end 

  def run 
    greet 
  end 


end 
