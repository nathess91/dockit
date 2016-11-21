class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.datetime :date_assigned
      t.datetime :original_insp_date
      t.datetime :return_insp_date
      t.string :job_number
      t.integer :loss_category
      t.string :loss_description
      t.string :mitigation_status
      t.string :abatement_status
      t.string :claim_number
      t.string :estimate_status
      t.datetime :target_start_date
      t.datetime :target_end_date
      t.datetime :actual_start_date
      t.datetime :actual_end_date
      t.boolean :is_on_xa
      t.integer :estimator_experience
      t.float :estimate_total
      t.integer :assignment_stage
      t.integer :lost_sales_related
      t.integer :lost_other
      t.boolean :is_contract_signed
      t.string :address
      t.float :latitude
      t.float :longitude
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
