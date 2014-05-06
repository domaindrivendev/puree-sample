module Scheduling

  class ConferenceDenormalizer < Puree::EventListener
    
    on_event :conference_created do |args|
      ConferenceView.create(
        id: args[:id],
        name: args[:name],
        description: args[:description],
        date: args[:date],
        location: args[:location],
        status: args[:status].to_s
      )

      ConferenceForm.create(
        id: args[:id],
        name: args[:name],
        description: args[:description],
        date: args[:date],
        location: args[:location]
      )  
    end

    on_event :called_for_submissions do |args|
      Conference.find(args[:conference_id]).update_attributes(status: 'accepting_submissions')
    end
  end

end
