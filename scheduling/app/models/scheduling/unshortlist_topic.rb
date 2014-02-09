module Scheduling
  class UnshortlistTopic < Command
    field :topic_id, :integer

    attr_accessible :topic_id
  
    def do_submit
      topic = topic_repository.find_by(topic_id)
      topic.unshortlist
      topic_repository.update(topic)
    end
  end
end
