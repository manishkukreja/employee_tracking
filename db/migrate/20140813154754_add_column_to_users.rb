class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :role_id, :integer
    remove_column :users, :user_name
    remove_column :users, :dob
    remove_column :users, :dependent
  end
end
