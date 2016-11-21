class Assignment < ApplicationRecord
  belongs_to :user
  has_many :assignment_contacts
  has_many :assignment_notes
  has_many :assignment_companies

  enum loss_category: [:water, :burglary_theft, :vandalism, :small_fire, :large_fire, :impact, :remodel, :hail, :vehicle]
  enum estimator_experience: [:good, :bad, :questionable]
  enum assignment_stage: [:assigned, :approved, :in_progress, :not_sold, :completed, :closed]
  enum lost_sales_related: [:cashed_out, :declined, :own_contractor]
  enum lost_other: [:below_deductible, :not_covered, :other]
end
