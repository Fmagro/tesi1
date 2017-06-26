class AddIndividualIdToEnsembles < ActiveRecord::Migration[5.0]
  def change
    change_table :ensembles do |t|
      t.references :individual, :foreign_key => { :to_table => :performers }
    end
  end
end
