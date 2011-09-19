class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table( :users, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' ) do |t|
      t.column :username, :string, :null => false, :default => ''
      t.database_authenticatable :null => false
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      # t.lockable
      t.column :created_by, :int, :null => false
      t.column :updated_by, :int, :null => false

      t.timestamps
    end

    # Add the index
    add_index :users, :username,      :unique => true
    add_index :users, :email,                :unique => true
    add_index :users, :confirmation_token,   :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :unlock_token,         :unique => true
    
    # Add the foreign keys
    execute <<-SQL
      ALTER TABLE `users`
        ADD CONSTRAINT `fk_users_on_created_by`
        FOREIGN KEY ( `created_by` )
        REFERENCES `users`( `id` ),
        ADD CONSTRAINT `fk_users_on_updated_by`
        FOREIGN KEY ( `updated_by` )
        REFERENCES `users`( id )
    SQL
  end

  def self.down
    drop_table :users
  end
end
