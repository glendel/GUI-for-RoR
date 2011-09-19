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