module Scheduling
  class ShortlistTopic < Command
    field :conference_id, :integer
    field :topic_id, :integer

    attr_accessible :conference_id, :topic_id

    def self.for(topic_id)
      topic = Topic.find(topic_id)
      new(conference_id: topic.conference_id, topic_id: topic_id)
    end

    def do_submit
      topic = topic_repository.find_by(topic_id)
      topic.shortlist
      topic_repository.update(topic)
    end
  end
end
