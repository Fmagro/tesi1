class AddGroupIdToEnsembles < ActiveRecord::Migration[5.0]
  def change
    change_table :ensembles do |t|
      t.references :group, :foreign_key => { :to_table => :performers }
    end
  end
end
