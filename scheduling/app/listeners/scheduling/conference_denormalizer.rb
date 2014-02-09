module Scheduling

  class ConferenceDenormalizer < Puree::EventListener
    
    on_event :conference_created do |args|
      Conference.create(
        id: args[:id],
        name: args[:name],
        description: args[:description],
        date: args[:date],
        location: args[:location],
        status: args[:status].to_s
      )
    end

    on_event :called_for_submissions do |args|
      Conference.find(args[:conference_id]).update_attributes(status: 'accepting_submissions')
    end
  end

end
