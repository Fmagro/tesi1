class CreateSetlists < ActiveRecord::Migration[5.0]
  def change
    create_table :setlists do |t|
      t.integer :position
      t.references :concert, foreign_key: true
      t.references :song, foreign_key: true

      t.timestamps
    end
  end
end
