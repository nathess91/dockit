class AddContactPhoneToAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :contact_phone, :string
  end
end
