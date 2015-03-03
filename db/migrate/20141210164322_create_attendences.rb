class CreateAttendences < ActiveRecord::Migration
  def change
    create_table :attendences do |t|
      t.string :email
      t.datetime :time_in
      t.datetime :time_out

      t.timestamps
    end
  end
end
