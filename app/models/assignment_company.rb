class AssignmentCompany < ApplicationRecord
  belongs_to :assignment

  enum category: [:mitigation, :abatement, :insurance, :contents, :cleaning, :mold_remediation, :referred_by]
end
