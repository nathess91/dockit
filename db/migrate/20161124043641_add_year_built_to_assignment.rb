class AddYearBuiltToAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :year_built, :integer
  end
end
