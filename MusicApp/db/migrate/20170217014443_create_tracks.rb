class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.string :release, null: false
      t.string :lyrics

      t.timestamps
    end
    add_index :tracks, :name
  end
end
