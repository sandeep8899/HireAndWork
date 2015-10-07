class CreateAppliedProjects < ActiveRecord::Migration
  def change
    create_table :applied_projects do |t|
    	t.integer :user_id , null: false
    	t.integer :project_id , null: false
      t.timestamps null: false
    end
  end
end
