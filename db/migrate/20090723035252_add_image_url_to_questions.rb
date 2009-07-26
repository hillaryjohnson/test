class AddImageUrlToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :image_url, :string
  end

  def self.down
    remove_column :questions, :image_url
  end
end
