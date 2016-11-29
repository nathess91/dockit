class AddContactNameToAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :contact_name, :string
  end
end
