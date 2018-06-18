class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :status
      t.date :date
      t.string :type
      t.references :user, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
