class ChangeDataForQueue < ActiveRecord::Migration
  def self.up
    change_table :delayed_jobs do |t|
      t.change :queue, :integer
    end
  end

  def self.down
    change_table :delayed_jobs do |t|
      t.change :queue, :integer
    end
  end
end
