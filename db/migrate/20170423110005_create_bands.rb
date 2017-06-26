class CreateBands < ActiveRecord::Migration[5.0]
  def change
    create_table :bands do |t|
      t.date :joining
      t.date :leaving

      t.timestamps
    end
  end
end
