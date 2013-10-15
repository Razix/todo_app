class AddUsernameAndPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :phone, :integer
  end
end
