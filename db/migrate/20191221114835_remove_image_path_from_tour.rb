class RemoveImagePathFromTour < ActiveRecord::Migration[5.2]
  def change
    remove_column :tours, :image_path, :string
  end
end
