class AddFieldsToAgency < ActiveRecord::Migration[5.1]
  def change
    add_column :agencies,:title,:string
    add_column :agencies,:phone_num,:string
    add_column :agencies,:address,:text
    add_column :agencies,:about,:text
  end
end
