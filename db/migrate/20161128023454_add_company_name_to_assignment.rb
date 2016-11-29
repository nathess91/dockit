class AddCompanyNameToAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :company_name, :string
  end
end
