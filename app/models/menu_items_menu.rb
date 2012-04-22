class MenuItemsMenu < ActiveRecord::Base
  belongs_to :foreign_table, :polymorphic => true
  belongs_to :menu_item
end
