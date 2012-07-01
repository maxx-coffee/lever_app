class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :twitter_token
      t.string :twitter_secret
      t.timestamps
    end
  end
end
