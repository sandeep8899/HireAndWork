class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
    	t.integer :user_id , null: false
    	t.string :name , null: false
    	t.string :qualification , null: false
    	t.string :skills , null: false
    	t.integer :experience , null: false , default: 0
    	t.integer :contact_number , null: false , length: 10
    	t.string :specialist_in
      t.timestamps null: false
    end
  end
end
