module ApplicationHelper

  def get_assignment_notes(assignment_id)
		return AssignmentNote.where(assignment_id: assignment_id)
	end

  def get_assignment_contact(assignment_id)
    return AssignmentContact.where(assignment_id: assignment_id)
  end

end
