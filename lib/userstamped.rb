# http://oldwiki.rubyonrails.org/rails/pages/ExtendingActiveRecordExample
module Userstamped
  def self.append_features( parent )
    parent.before_save do | the_object |
      if ( the_object.respond_to?( :updated_by ) )
        if ( User.current.instance_of?( User ) )
          the_object.updated_by = User.current.id
        elsif ( the_object.instance_of?( User ) )
          the_object.updated_by = the_object.id
        end
      end
    end
    parent.before_create do | the_object |
      the_object.created_by ||= User.current.id if ( the_object.respond_to?( :created_by ) )
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
