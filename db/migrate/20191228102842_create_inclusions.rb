class CreateInclusions < ActiveRecord::Migration[5.2]
  def change
    create_table :inclusions do |t|
      t.string :service
      t.belongs_to :tour, foreign_key: true
      t.timestamps
    end
  end
end
