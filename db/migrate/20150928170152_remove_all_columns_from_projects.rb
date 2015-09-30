class RemoveAllColumnsFromProjects < ActiveRecord::Migration
  def change
  	remove_column :projects , :user_id
  	remove_column :projects , :contact_number
  	remove_column :projects , :specialist_in 
  	remove_column :projects , :experience
  end
end
