class ChangeSessionToText < ActiveRecord::Migration
  def self.up
    change_column :sessions, :session_id, :text
  end

  def self.down
    change_column :sessions, :session_id, :text
  end
end
