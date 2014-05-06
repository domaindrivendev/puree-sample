module Planning
  
  class ShortlistSubmissionForm < TransientForm
    field :submission_id, :integer
  
    attr_accessible :submission_id
  
    def self.for(submission_id)
      new(submission_id: submission_id)
    end

    def on_submit
      submission = submission_repository.find_by(submission_id)
      submission.shortlist
      submission_repository.update(submission)
    end
  end
  
end
