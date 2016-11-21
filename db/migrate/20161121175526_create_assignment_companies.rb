class CreateAssignmentCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :assignment_companies do |t|
      t.integer :category
      t.string :name
      t.belongs_to :assignment, foreign_key: true

      t.timestamps
    end
  end
end
