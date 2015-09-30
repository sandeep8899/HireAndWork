class AddColumnsDetailsToProjects < ActiveRecord::Migration
  def change
  	add_column :projects , :details , :text , :null=> :false
  end
end
