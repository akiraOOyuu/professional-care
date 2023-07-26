class AdminUsers < ActiveRecord::Migration[6.0]
  def change 
    create_table :admin_users do |t|
      t.string :name
      t.string :name_reading
      t.string :email
     
      t.timestamps
    end
  end
end
