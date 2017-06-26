class RemoveGroupIdFromEnsembles < ActiveRecord::Migration[5.0]
  def change
    remove_column :ensembles, :groups_id
  end
end
