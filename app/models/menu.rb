class Menu < ActiveRecord::Base
  has_many :menu_items_menus, :as => :foreign_table
  has_many :menu_items, :through => :menu_items_menus
end
