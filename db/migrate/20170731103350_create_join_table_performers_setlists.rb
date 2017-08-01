class CreateJoinTablePerformersSetlists < ActiveRecord::Migration[5.0]
  def change
    create_join_table :performers, :setlists do |t|
      # t.index [:performer_id, :setlist_id]
      # t.index [:setlist_id, :performer_id]
    end
  end
end
