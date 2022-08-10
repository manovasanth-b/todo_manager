class AddFirstnameToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :first_name, :string
  end
end
