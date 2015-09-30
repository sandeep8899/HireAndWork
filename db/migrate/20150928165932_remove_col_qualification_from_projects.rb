class RemoveColQualificationFromProjects < ActiveRecord::Migration
  def change
  	remove_column :projects , :qualification
  end
end
