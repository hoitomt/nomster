class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :place_id
      t.text :caption
      t.string :picture

      t.timestamps null: false
    end
  end
end
