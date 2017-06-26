class AddGroupIdToBands < ActiveRecord::Migration[5.0]
  def change
    change_table :bands do |t|
  t.references :group, :foreign_key => { :to_table => :artists }
    end
  end
end
