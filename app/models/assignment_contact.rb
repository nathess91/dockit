class AssignmentContact < ApplicationRecord
  belongs_to :assignment

  enum role: [:location_contact, :project_manager, :adjuster, :reconstruction_pm]
end
