class AddRoleToUserRemoveFromProjectUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer, null: false, default: 1
    remove_column :project_users, :role
  end
end
