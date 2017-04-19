class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :bio
      t.boolean :isgroup
      def
        self.isgroup =false if self.isgroup.nil?
      end 
      t.timestamps
    end
  end
end
