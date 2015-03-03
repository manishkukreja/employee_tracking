class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :user_id
      t.boolean :is_valid

      t.timestamps
    end
  end
end
