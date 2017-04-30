class CreateJoinTableArtistConcert < ActiveRecord::Migration[5.0]
  def change
    create_join_table :artists, :concerts do |t|
      # t.index [:artist_id, :concert_id]
      # t.index [:concert_id, :artist_id]
    end
  end
end
