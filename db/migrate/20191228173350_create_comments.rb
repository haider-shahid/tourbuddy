class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :agency_id
      t.belongs_to :tour
      t.timestamps
    end
  end
end
