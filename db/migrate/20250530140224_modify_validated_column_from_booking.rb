class ModifyValidatedColumnFromBooking < ActiveRecord::Migration[7.1]
  def change
    change_column_default :bookings, :status, "en_attente"
  end
end
