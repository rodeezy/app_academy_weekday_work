class AddBandIdToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :band_id, :integer, null: false
  end
end
