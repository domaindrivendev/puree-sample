module Scheduling
  class CallForSubmissions < Command
    field :conference_id, :integer

    attr_accessible :conference_id
  
    def do_submit
      conference = conference_repository.find_by(conference_id)
      conference.call_for_submissions
      conference_repository.update(conference)
    end
  end
end