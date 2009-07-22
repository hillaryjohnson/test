class CreateAhas < ActiveRecord::Migration
  def self.up
    create_table :ahas do |t|
      t.text :body
      t.string :page_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :ahas
  end
end
