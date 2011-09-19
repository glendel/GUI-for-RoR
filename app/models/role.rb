class Role < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :users, :join_table => 'user_roles'
end
