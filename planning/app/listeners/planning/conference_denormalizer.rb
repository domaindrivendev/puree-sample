module Planning
  
  class ConferenceDenormalizer < Puree::EventListener
    on_event :conference_created do |args|
      Conference.create(
        id: args[:id],
        name: args[:name],
        description: args[:description],
        date: args[:date],
        location: args[:location],
        status: 'draft'
      )
    end
  end
  
end
