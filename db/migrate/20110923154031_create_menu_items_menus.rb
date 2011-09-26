class CreateMenuItemsMenus < ActiveRecord::Migration
  def self.up
    create_table( :menu_items_menus, :id => false, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' ) do |t|
      t.column :foreign_table_id, :int, :null => false
      t.references :menu_item
      t.column :foreign_table_type, :string, :limit => 10, :null => false, :default => 'menu', :comment => 'Just supported Menu or MenuItem as foreign tables'
      t.column :created_by, :int, :null => false
      t.column :updated_by, :int, :null => false

      t.timestamps
    end
    
    add_index :menu_items_menus, :foreign_table_id
    
    # Add the foreign keys
    execute <<-SQL
      SET FOREIGN_KEY_CHECKS = 0;
    SQL
    execute <<-SQL
      ALTER TABLE `menu_items_menus`
        ADD CONSTRAINT `fk_menu_items_menus_on_menu_item_id`
        FOREIGN KEY ( `menu_item_id` )
        REFERENCES `menu_items`( `id` ),
	ADD CONSTRAINT `index_menu_items_menus_on_unique_key`
	UNIQUE KEY ( `foreign_table_id`, `menu_item_id`, `foreign_table_type` ),
        ADD CONSTRAINT `fk_menu_items_menus_on_created_by`
        FOREIGN KEY ( `created_by` )
        REFERENCES `users`( `id` ),
        ADD CONSTRAINT `fk_menu_items_menus_on_updated_by`
        FOREIGN KEY ( `updated_by` )
        REFERENCES `users`( id );
    SQL
    execute <<-SQL
      SET FOREIGN_KEY_CHECKS = 1;
    SQL
  end
  
  def self.down
    drop_table :menu_items_menus
  end
end
