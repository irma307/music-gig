class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :location
      t.references :user, foreign_key: true
      t.integer :price
      t.string :genre

      t.timestamps
    end
  end
end
