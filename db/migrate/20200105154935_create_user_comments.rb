class CreateUserComments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :agency_id
      t.belongs_to :user_tour
      t.timestamps
    end
  end
end
