class CreateErrors < ActiveRecord::Migration
  def self.up
    create_table( :errors ) do |t|
      t.string :name
      t.string :message
      t.string :url
      t.string :ip_address
      t.text :parameters
      t.string :rails_root
      t.integer :user_id
      t.text :backtrace
      t.string :session_id
      t.text :session_data
      t.text :filtered_env
      t.string :process
      t.string :server
      t.timestamps
    end
  end

  def self.down
    drop_table :errors
  end
end
