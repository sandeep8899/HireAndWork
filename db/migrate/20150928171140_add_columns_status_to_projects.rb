class AddColumnsStatusToProjects < ActiveRecord::Migration
  def change
  	add_column :projects , :status ,:string , :default=> "Pending" , :null=>false
  end
end
