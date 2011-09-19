class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table( :roles, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' ) do |t|
      t.column :name, :string, :null => false, :default => ''
      t.column :description, :string
      t.column :created_by, :int, :null => false
      t.column :updated_by, :int, :null => false

      t.timestamps
    end
    
    add_index :roles, :name, :unique => true
    
    # Add the foreign keys
    execute <<-SQL
      ALTER TABLE `roles`
        ADD CONSTRAINT `fk_roles_on_created_by`
        FOREIGN KEY ( `created_by` )
        REFERENCES `users`( `id` ),
        ADD CONSTRAINT `fk_roles_on_updated_by`
        FOREIGN KEY ( `updated_by` )
        REFERENCES `users`( id )
    SQL
  end

  def self.down
    drop_table :roles
  end
end
