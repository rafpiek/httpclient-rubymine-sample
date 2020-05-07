class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :car_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
