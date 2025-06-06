class CreateFlats < ActiveRecord::Migration[7.1]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :description
      t.string :address
      t.integer :price
      t.integer :longitude
      t.integer :lattitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
