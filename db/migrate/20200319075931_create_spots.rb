class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.references :prefecture,     null: false
      t.string :name,               null: false
      t.string :place,              null: false
      t.text   :text,               null: false
      t.string :station
      t.timestamps
    end
  end
end
