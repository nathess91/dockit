module ApplicationHelper

  def get_assignment_notes(assignment_id)
		return AssignmentNote.where(assignment_id: assignment_id)
	end

end
