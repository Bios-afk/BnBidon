class ModifyColumnLattitudeToFlats < ActiveRecord::Migration[7.1]
  def change
    # Change the column name from 'lattitude' to 'latitude'
    rename_column :flats, :lattitude, :latitude

    # Change the data type from integer to float
    change_column :flats, :latitude, :float
  end
end
