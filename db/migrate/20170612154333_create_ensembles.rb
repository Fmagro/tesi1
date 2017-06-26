class CreateEnsembles < ActiveRecord::Migration[5.0]
  def change
    create_table :ensembles do |t|
      t.date :joining
      t.date :leaving
      t.timestamps
    end
  end
  
end
