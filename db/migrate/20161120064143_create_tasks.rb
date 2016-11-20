class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :text
      t.boolean :is_high_priority
      t.datetime :date_due
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
