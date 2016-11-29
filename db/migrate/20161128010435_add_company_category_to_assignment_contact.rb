class AddCompanyCategoryToAssignmentContact < ActiveRecord::Migration[5.0]
  def change
    add_column :assignment_contacts, :company_category, :integer
  end
end
