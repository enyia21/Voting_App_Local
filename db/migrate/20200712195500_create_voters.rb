class CreateVoters < ActiveRecord::Migration[5.2]
  def change
    create_table :voters do |t|
      #login information
      t.string :user_name
      t.string :password_digest

      #voter information
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :drivers_license

      #voter location inforation
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode   
    end
  end
end
