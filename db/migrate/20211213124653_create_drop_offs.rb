class CreateDropOffs < ActiveRecord::Migration[6.0]
  def change
    create_table :drop_offs do |t|
      t.references :location, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
