class CreateAssignmentContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :assignment_contacts do |t|
      t.integer :role
      t.string :name
      t.string :phone
      t.string :email
      t.belongs_to :assignment, foreign_key: true

      t.timestamps
    end
  end
end
