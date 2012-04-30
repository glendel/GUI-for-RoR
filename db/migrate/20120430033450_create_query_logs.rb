class CreateQueryLogs < ActiveRecord::Migration
  def self.up
    create_table( :query_logs ) do |t|
      t.integer :user_id
      t.string :name
      t.text :sql
      t.timestamps
    end
  end
  
  def self.down
    drop_table :query_logs
  end
end
