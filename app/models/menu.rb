class Menu < ActiveRecord::Base
  has_and_belongs_to_many :menu_items, :foreign_key => 'foreign_table_id', :conditions => '`menu_items_menus`.`foreign_table_type` = "menu"'
end
