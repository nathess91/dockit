class AddContactEmailToAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :contact_email, :string
  end
end
