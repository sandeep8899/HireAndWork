class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
    	t.integer :amount ,  null: false
    	t.integer :user_id , null: false
    	t.integer :project_id , null: false
    	t.text :message
      t.timestamps null: false
    end
  end
end
