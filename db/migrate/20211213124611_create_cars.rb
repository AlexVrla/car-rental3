class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :price_per_day
      t.string :rental_status

      t.timestamps
    end
  end
end
