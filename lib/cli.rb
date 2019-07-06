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
    end 
  end 

  def user_login
    customer_info = prompt.collect do
         key(:id).ask('Date of birth:')
         key(:last_name).ask('Customer ID:')
    end 
       search_customer
  end 

  def create_user
    customer_attrs = prompt.collect do
         key(:first_name).ask('First name:', required: true)
         key(:last_name).ask('Surname:', required: true)
         key(:date_of_birth).ask('Date of birth (MM/DD/YYYY):', required: true)
    end 
        c = Customer.new(**customer_attrs)
        c.save
        c
  end 




  def run 
    greet 
  end 


end 


