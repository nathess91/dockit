class AddCompanyCategoryToAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :company_category, :integer
  end
end
