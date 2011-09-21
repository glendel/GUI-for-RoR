class UserAbility
  include CanCan::Ability
  
  def initialize( user )
    if ( user.is?( :Admin ) )
      can :manage, :all
    end
  end
end