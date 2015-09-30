class IncreaseLimitOfContactNumberInUserDetails < ActiveRecord::Migration
  def change
  	change_column :user_details , :contact_number , :integer , limit: 8
  end
end
