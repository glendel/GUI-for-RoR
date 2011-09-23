class CreateUserRoles < ActiveRecord::Migration
  def self.up
    create_table( :user_roles, :id => false, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' ) do |t|
      t.references :user
      t.references :role
      t.column :created_by, :int, :null => false
      t.column :updated_by, :int, :null => false

      t.timestamps
    end
    
    # Add the foreign keys
    execute <<-SQL
      SET FOREIGN_KEY_CHECKS = 0;
    SQL
    execute <<-SQL
      ALTER TABLE `user_roles`
        ADD CONSTRAINT `fk_user_roles_on_user_id`
        FOREIGN KEY ( `user_id` )
        REFERENCES `users`( `id` ),
        ADD CONSTRAINT `fk_user_roles_on_role_id`
        FOREIGN KEY ( `role_id` )
        REFERENCES `roles`( `id` ),
        ADD CONSTRAINT `fk_user_roles_on_created_by`
        FOREIGN KEY ( `created_by` )
        REFERENCES `users`( `id` ),
        ADD CONSTRAINT `fk_user_roles_on_updated_by`
        FOREIGN KEY ( `updated_by` )
        REFERENCES `users`( id );
    SQL
    execute <<-SQL
      SET FOREIGN_KEY_CHECKS = 1;
    SQL
  end

  def self.down
    drop_table :user_roles
  end
end
