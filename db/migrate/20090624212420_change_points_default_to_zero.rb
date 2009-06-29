class ChangePointsDefaultToZero < ActiveRecord::Migration
  def self.up
    change_column :answers, :points, :integer, :default => 0
  end

  def self.down
    change_column :answers, :points, :integer
  end
end
