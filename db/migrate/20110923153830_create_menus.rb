class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table( :menus, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' ) do |t|
      t.column :name, :string, :null => false, :default => ''
      t.column :controller, :string
      t.column :action, :string
      t.column :parameters, :string
      t.column :created_by, :int, :null => false
      t.column :updated_by, :int, :null => false

      t.timestamps
    end
    
    add_index :menus, :name, :unique => true
    
    # Add the foreign keys
    execute <<-SQL
      ALTER TABLE `menus`
        ADD CONSTRAINT `fk_menus_on_created_by`
        FOREIGN KEY ( `created_by` )
        REFERENCES `users`( `id` ),
        ADD CONSTRAINT `fk_menus_on_updated_by`
        FOREIGN KEY ( `updated_by` )
        REFERENCES `users`( id )
    SQL
  end

  def self.down
    drop_table :menus
  end
end
