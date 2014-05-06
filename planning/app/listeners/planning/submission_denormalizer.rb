module Planning
  
  class SubmissionDenormalizer < Puree::EventListener
    on_event :submission_created do |args|
      Submission.create(
        id: args[:id],
        title: args[:title],
        overview: args[:overview],
        status: 'pending',
        conference_id: args[:conference_id]
      )
    end

    on_event :submission_shortlisted do |args|
      Submission.find(args[:submission_id]).update_attributes(
        status: 'shortlisted'
      )
    end

    on_event :submission_unshortlisted do |args|
      Submission.find(args[:submission_id]).update_attributes(
        status: 'pending'
      )
    end
  end
  
end
