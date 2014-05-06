module Planning
  
  class NewSubmissionForm < TransientForm
    field :title, :string
    field :overview, :text
    field :conference_id, :integer
  
    attr_accessible :title, :overview, :conference_id
  
    def on_submit
      speaker = Domain::Speaker.new(123, 'Joe Organizer')
      conference = conference_repository.find_by(conference_id)

      submission = Domain::Submission.new(
        submission_repository.next_id,
        title,
        overview,
        speaker,
        conference
      )
      
      submission_repository.add(submission)
    end

    def conferences
      @conferences ||= Planning::Conference.all.map { |conf| [ conf.name, conf.id ] }
    end
  end
  
end
