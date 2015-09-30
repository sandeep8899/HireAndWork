class AddColumnsFromProjects < ActiveRecord::Migration
  def change
  	add_column :projects , :time_period , :string , null: :false
  	add_column :projects , :user_id , :integer
  end
end
