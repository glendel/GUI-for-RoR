class Menu < ActiveRecord::Base
  has_many :menu_items_menus, :as => :foreign_table
  has_many :menu_items, :through => :menu_items_menus
  
  #----------------------------------------------------------------------------------------------------
  # get_url
  #----------------------------------------------------------------------------------------------------
  def get_url
    url = ''
    
    if ( self.menu_items.count( 'id' ) > 0 )
      url = "/menu_items?menu_id=#{self.id}"
    else
      url = "/#{self.controller}"
      url += "/#{self.action}" unless ( self.action.blank? )
      url += "?#{self.parameters}" unless ( self.parameters.blank? )
    end
    
    return( url )
  end
end
