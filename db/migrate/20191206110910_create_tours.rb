class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.integer :agency_id
      t.string :image_path
      t.integer :duration
      t.string :destination
      t.string :title
      t.integer :budget
      t.text :full_plan
      t.date :departure_date
    end
  end
end
