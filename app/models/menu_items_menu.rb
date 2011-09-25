class MenuItemsMenu < ActiveRecord::Base
  belongs_to :foreign_table, :polymorphic => true
  belongs_to :menu_item
  before_save :before_save_handler
  before_save :before_create_handler
  
  #----------------------------------------------------------------------------------------------------
  # before_save_handler
  #----------------------------------------------------------------------------------------------------
  def before_save_handler
    self.updated_by = 1
  end
  
  #----------------------------------------------------------------------------------------------------
  # before_create_handler
  #----------------------------------------------------------------------------------------------------
  def before_create_handler
    self.created_by = 1
  end
end
