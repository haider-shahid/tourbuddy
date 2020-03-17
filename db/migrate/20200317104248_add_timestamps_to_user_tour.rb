class AddTimestampsToUserTour < ActiveRecord::Migration[5.2]
  def change
    add_column :user_tours, :created_at, :datetime
    add_column :user_tours, :updated_at, :datetime
  end
end
