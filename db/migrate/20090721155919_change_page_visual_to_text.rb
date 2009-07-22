class ChangePageVisualToText < ActiveRecord::Migration
  def self.up
    change_column :pages, :visual, :text
  end

  def self.down
    change_column :pages, :visual, :text
  end
end
