class DropBookings < ActiveRecord::Migration[7.0]
  def up
    drop_table :bookings
  end

  def down
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.references :flat, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
