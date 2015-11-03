class RenameTableRoleUser < ActiveRecord::Migration
  def change
  	rename_table 'roles_users', 'role_users'
  end
end
