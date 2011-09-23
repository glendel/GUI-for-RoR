class CreateMenuItems < ActiveRecord::Migration
  def self.up
    create_table( :menu_items, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' ) do |t|
      t.column :name, :string, :null => false, :default => ''
      t.column :created_by, :int, :null => false
      t.column :updated_by, :int, :null => false

      t.timestamps
    end
    
    add_index :menu_items, :name, :unique => true
    
    # Add the foreign keys
    execute <<-SQL
      ALTER TABLE `menu_items`
        ADD CONSTRAINT `fk_menu_items_on_created_by`
        FOREIGN KEY ( `created_by` )
        REFERENCES `users`( `id` ),
        ADD CONSTRAINT `fk_menu_items_on_updated_by`
        FOREIGN KEY ( `updated_by` )
        REFERENCES `users`( id )
    SQL
  end

  def self.down
    drop_table :menu_items
  end
end
