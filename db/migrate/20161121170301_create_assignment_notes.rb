class CreateAssignmentNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :assignment_notes do |t|
      t.string :text
      t.belongs_to :user, foreign_key: true
      t.belongs_to :assignment, foreign_key: true

      t.timestamps
    end
  end
end
