class ChangeLongitudeToFloat < ActiveRecord::Migration[7.1]
  def change
    # Change the data type of the 'longitude' column from integer to float
    change_column :flats, :longitude, :float

    # If you need to rename the column, uncomment the line below
    # rename_column :flats, :longitude, :new_longitude_name
  end
end
