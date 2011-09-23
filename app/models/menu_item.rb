class MenuItem < ActiveRecord::Base
  has_and_belongs_to_many :menus, :association_foreign_key => 'foreign_table_id', :conditions => '`menu_items_menus`.`foreign_table_type` = "menu"'
  has_and_belongs_to_many :menu_items, :join_table => 'menu_items_menus', :foreign_key => 'foreign_table_id', :conditions => '`menu_items_menus`.`foreign_table_type` = "menu_item"'
end
