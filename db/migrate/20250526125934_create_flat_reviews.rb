class CreateFlatReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :flat_reviews do |t|
      t.string :comment
      t.integer :rating
      t.references :flat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
