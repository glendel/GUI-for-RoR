# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

puts 'Seeding the database with its default values :'

# Create Admin User
ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS = 0')
puts 'Creating the Admin User.'
admin_user = User.create!( {
  :username => 'admin',
  :email => 'admin@change.me',
  :password => 'changeme',
  :created_by => 1,
  :updated_by => 1
} )
ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS = 1')

# Create Admin Role
puts 'Creating the Admin Role.'
admin_role = Role.create!( {
  :name => 'Admin',
  :description => 'Application Administrator',
  :created_by => admin_user.id,
  :updated_by => admin_user.id
} )

# Create the relationship between the Admin User and the Admin Role
puts 'Creating the relationship between the Admin User and the Admin Role.'
admin_user.roles << admin_role

# Create Admin Menu
puts 'Creating the Admin Menu.'
admin_menu = Menu.create!( {
  :name => 'Admin',
  :created_by => admin_user.id,
  :updated_by => admin_user.id
} )

# Create Users Menu Item
puts 'Creating the Users Menu Item.'
users_menu_item = MenuItem.create!( {
  :name => 'Users',
  :controller => 'users',
  :created_by => admin_user.id,
  :updated_by => admin_user.id
} )

# Create Roles Menu Item
puts 'Creating the Roles Menu Item.'
roles_menu_item = MenuItem.create!( {
  :name => 'Roles',
  :controller => 'roles',
  :created_by => admin_user.id,
  :updated_by => admin_user.id
} )

# Create Menus Menu Item
puts 'Creating the Menus Menu Item.'
menus_menu_item = MenuItem.create!( {
  :name => 'Menus',
  :controller => 'menus',
  :created_by => admin_user.id,
  :updated_by => admin_user.id
} )

# Create Menu Items Menu Item
puts 'Creating the Menu Items Menu Item.'
menu_items_menu_item = MenuItem.create!( {
  :name => 'Menu Items',
  :controller => 'menu_items',
  :created_by => admin_user.id,
  :updated_by => admin_user.id
} )

# Create the relationship between the Admin Menu and the Users Menu Item
puts 'Creating the relationship between the Admin Menu and the Users Menu Item.'
admin_menu.menu_items << users_menu_item

# Create the relationship between the Admin Menu and the Roles Menu Item
puts 'Creating the relationship between the Admin Menu and the Roles Menu Item.'
admin_menu.menu_items << roles_menu_item

# Create the relationship between the Admin Menu and the Menus Menu Item
puts 'Creating the relationship between the Admin Menu and the Menus Menu Item.'
admin_menu.menu_items << menus_menu_item

# Create the relationship between the Admin Menu and the Menu Items Menu Item
puts 'Creating the relationship between the Admin Menu and the Menu Items Menu Item.'
admin_menu.menu_items << menu_items_menu_item
