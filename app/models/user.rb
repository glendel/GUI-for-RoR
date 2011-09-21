class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :database_authenticatable, :recoverable,
             :rememberable, :trackable, :validatable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :created_by, :updated_by
  
  # Associations
  has_and_belongs_to_many :roles, :join_table => 'user_roles'
  
  #----------------------------------------------------------------------------------------------------
  # is?
  #----------------------------------------------------------------------------------------------------
  def is?( role )
    if ( role.instance_of?( Symbol ) || role.instance_of?( String ) )
      return( self.roles.find_by_name( role.to_s.humanize ).instance_of?( Role ) )
    elsif( role.instance_of?( Fixnum ) )
      return( self.roles.find_by_id( role ).instance_of?( Role ) )
    elsif( role.instance_of?( Role ) )
      return( self.roles.include?( role ) )
    else
      raise "#{role.inspect} is not supported."
    end
  end
end
