class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.string :acoustic, null: false

      t.timestamps
    end
    add_index :albums, :name
  end
end
