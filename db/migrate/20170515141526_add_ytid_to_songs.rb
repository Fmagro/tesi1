class AddYtidToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :ytid, :string
  end
end
