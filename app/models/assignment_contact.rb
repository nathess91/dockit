class AssignmentContact < ApplicationRecord
  belongs_to :assignment

  enum role: [:homeowner, :project_manager, :adjuster, :reconstruction_pm, :tenant]
  enum company_category: [:mitigation, :abatement, :insurance, :contents, :cleaning, :mold_remediation, :referred_by]
end
