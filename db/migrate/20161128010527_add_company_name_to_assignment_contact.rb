class AddCompanyNameToAssignmentContact < ActiveRecord::Migration[5.0]
  def change
    add_column :assignment_contacts, :company_name, :string
  end
end
