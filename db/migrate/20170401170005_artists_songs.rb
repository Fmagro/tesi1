class ArtistsSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :artists_songs, id: false do |t|
      t.integer :artist_id
      t.integer :song_id
    end
 
    add_index :artists_songs, :artist_id
    add_index :artists_songs, :song_id
  end
end
