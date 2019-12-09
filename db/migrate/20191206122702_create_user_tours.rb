class CreateUserTours < ActiveRecord::Migration[5.1]
  def change
    create_table :user_tours do |t|
      t.integer :user_id
      t.integer :duration
      t.string :destination
      t.string :title
      t.integer :budget
      t.text :full_plan
      t.date :departure_date
    end
  end
end
