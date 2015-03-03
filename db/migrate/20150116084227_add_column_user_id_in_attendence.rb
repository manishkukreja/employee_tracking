class AddColumnUserIdInAttendence < ActiveRecord::Migration
  def change
  	add_column :attendences ,:user_id ,:int
  	remove_column :attendences , :email
  end
end
