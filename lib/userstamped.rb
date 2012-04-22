# http://oldwiki.rubyonrails.org/rails/pages/ExtendingActiveRecordExample
module Userstamped
  def self.append_features( parent )
    parent.before_save do | model |
      model.updated_by = User.current.id if ( model.respond_to?( :updated_by ) )
    end
    parent.before_create do | model |
      model.created_by ||= User.current.id if ( model.respond_to?( :created_by ) )
    end
  end
=begin
  def self.append_features( parent )
    parent.before_save :before_save_handler
    parent.before_create :before_create_handler
    parent.send( 'define_method', :before_save_handler ) do
      self.updated_by = User.current.id
    end
    parent.send( 'define_method', :before_create_handler ) do
      self.created_by = User.current.id
    end
  end
=end
end
