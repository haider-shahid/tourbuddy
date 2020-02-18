class AddEmailToAgencies < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :confirmation_token, :string
    add_column :agencies, :unconfirmed_email, :string
    add_column :agencies, :confirmed_at, :datetime
    add_column :agencies, :confirmation_sent_at, :datetime
  end
end
