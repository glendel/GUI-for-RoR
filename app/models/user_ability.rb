class UserAbility
  include CanCan::Ability
  
  def initialize( user )
    if ( user.instance_of?( User ) )
      if ( user.is?( :Admin ) )
        can :manage, :all
      end
    end
  end
end