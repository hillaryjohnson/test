class RenameFieldsInQuestions < ActiveRecord::Migration
  def self.up
    rename_column :questions, :image_url, :image_link
    rename_column :questions, :qbody, :body
    rename_column :answers, :abody, :body
  end

  def self.down
    rename_column :questions, :image_url, :image_link
    rename_column :questions, :qbody, :body
    rename_column :answers, :abody, :body
  end
end
