module Scheduling

  class TopicDenormalizer < Puree::EventListener
    
    on_event :topic_submitted do |args|
      Topic.create(
        id: args[:topic_id],
        title: args[:title],
        overview: args[:overview],
        status: 'pending',
        conference_id: args[:conference_id]
      )
    end

    on_event :topic_shortlisted do |args|
      Topic.find(args[:topic_id]).update_attributes(status: 'shortlisted')
    end

    on_event :topic_unshortlisted do |args|
      Topic.find(args[:topic_id]).update_attributes(status: 'pending')
    end
  end

end