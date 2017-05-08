class AddVenueRefToConcert < ActiveRecord::Migration[5.0]
  def change
    add_reference :concerts, :venue, foreign_key: true
  end
end
