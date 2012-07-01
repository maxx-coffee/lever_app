class ChangeDataForQueue < ActiveRecord::Migration
  def self.up

    remove_column :delayed_jobs, :queue
    add_column :delayed_jobs, :queue, :integer
  end

  def self.down
    remove_column :delayed_jobs, :queue
    add_column :delayed_jobs, :queue, :string
  end
end
