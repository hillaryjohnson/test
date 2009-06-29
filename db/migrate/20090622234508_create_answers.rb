class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.text :abody
      t.integer :question_id
      t.boolean :truthiness
      t.integer :points
      t.text :feedback
      t.timestamps
    end
  end
  
  def self.down
    drop_table :answers
  end
end
