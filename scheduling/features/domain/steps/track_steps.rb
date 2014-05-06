Given(/^they have opted to add a new track$/) do
  # noop
end

Given(/^provided a track name$/) do
  @track_name = "Test Track1"  
end

Given(/^a conference track$/) do
  @track = Track.allocate
  @track.replay(Event.new(:track_created, id: 678, name: 'Test Track', conference_id: 123))
end

Given(/^they have opted to add a session to the track$/) do
  # noop
end

Given(/^provided a topic, start time and end time$/) do
  step 'a topic shortlisted for a conference'
  @start_time = TimeOfDay.new(10, 0)
  @end_time = TimeOfDay.new(11, 0)
end

Given(/^the topic is not shortlisted$/) do
  step 'a topic submitted to a conference'
  @start_time = TimeOfDay.new(10, 0)
  @end_time = TimeOfDay.new(11, 0)

  @expected_exception = TopicNotShortlisted
end

Given(/^the start time is later than the end time$/) do
  step 'a topic shortlisted for a conference'
  @start_time = TimeOfDay.new(10, 0)
  @end_time = TimeOfDay.new(9, 0)

  @expected_exception = InvalidSessionTime
end

Given(/^a conference track with a session added$/) do
  step 'a conference track'
  @track.replay(Event.new(:track_session_added,
    track_id: 678,
    session: Session.new(345, TimeOfDay.new(10, 0), TimeOfDay.new(11, 0))))
end

Given(/^the time conflicts with the existing session$/) do
  step 'a topic shortlisted for a conference'
  @start_time = TimeOfDay.new(10, 30)
  @end_time = TimeOfDay.new(11, 30)

  @expected_exception = ConflictingSessionTime
end

When(/^they create the track$/) do
  @track = Track.new(678, @track_name, @conference)
end

When(/^they add the session$/) do
  attempt { @track.add_session(@topic, @start_time, @end_time) }
end

When(/^they remove the session$/) do
  @track.remove_session() 
end

Then(/^the session is removed from the track$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the track is created with no sessions$/) do
  event = @track.pending_events.first
  event.name.should == :track_created
  event.args[:id].should == 678
  event.args[:name].should == @track_name
  event.args[:conference_id].should == 123
end

Then(/^the session is added to the track$/) do
  event = @track.pending_events.first
  event.name.should == :track_session_added
  event.args[:track_id].should == 678
  event.args[:session].start_time.should == TimeOfDay.new(10, 0)
  event.args[:session].end_time.should == TimeOfDay.new(11, 0)
  event.args[:session].topic_id.should == 345
end

Then(/^the session is not added to the track$/) do
  @exception.should_not be_nil
  @exception.should be_instance_of @expected_exception 
end