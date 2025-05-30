class AddValidatedToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :validated, :boolean
  end
end
