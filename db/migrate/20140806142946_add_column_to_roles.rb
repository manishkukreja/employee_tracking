class AddColumnToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :role_name, :string
  end
end
