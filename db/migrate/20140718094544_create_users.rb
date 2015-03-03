class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.date :dob
      t.integer :dependent

      t.timestamps
    end
  end
end
