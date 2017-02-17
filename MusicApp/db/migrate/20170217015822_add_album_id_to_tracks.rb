class AddAlbumIdToTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :album_id, :integer, null: false
  end
end
