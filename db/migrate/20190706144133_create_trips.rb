class CreateTrips < ActiveRecord::Migration[5.0]
 
  def change
    create_table :trips do |t| 
      t.string :name 
      t.date :start_date
      t.date :end_date 
      t.integer :price 
      t.string :destination
      t.integer :customer_id
      t.integer :company_id
    end 
  end
end
