module Scheduling
  class SubmitTopic < Command
    field :id, :integer
    field :title, :string
    field :overview, :text
    field :conference_id, :integer
  
    attr_accessible :id, :title, :overview, :conference_id
  
    def do_submit
      speaker = Domain::Speaker.new(123, 'Joe Speaker')
      conference = conference_repository.find_by(conference_id)

      topic = Domain::Topic.new(
        topic_repository.next_id,
        speaker,
        title,
        overview,
        conference
      )

      topic_repository.add(topic)
    end

    def conferences
      Scheduling::Conference.where(status: 'accepting_submissions').map { |conf| [ conf.name, conf.id ] }
    end
  end
end
