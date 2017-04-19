class CreateConcertSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :concert_songs do |t|
      t.integer :position

      t.timestamps
    end
  end
end
