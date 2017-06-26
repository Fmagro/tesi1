class CreatePerformers < ActiveRecord::Migration[5.0]
  def change
    create_table :performers do |t|
      t.string :type
      t.string :pname
      t.string :bio

      t.timestamps
    end
  end
end
