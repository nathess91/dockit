class AddContactRoleToAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :contact_role, :integer
  end
end
