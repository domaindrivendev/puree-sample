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

Given(/^provided a start time, end time and topic$/) do
  @start_time = TimeOfDay.new(10, 0)
  @end_time = TimeOfDay.new(11, 0)
  step 'a topic shortlisted for a conference'
end

Given(/^the topic is not shortlisted$/) do
  @start_time = TimeOfDay.new(10, 0)
  @end_time = TimeOfDay.new(11, 0)
  step 'a topic submitted to a conference'

  @expected_exception = TopicNotShortlisted
end

Given(/^the start time is later than the end time$/) do
  @start_time = TimeOfDay.new(10, 0)
  @end_time = TimeOfDay.new(9, 0)
  step 'a topic shortlisted for a conference'

  @expected_exception = InvalidSessionTime
end

When(/^they create the track$/) do
  @track = Track.new(678, @track_name, @conference)
end

When(/^they add the session$/) do
  attempt { @track.add_session(@start_time, @end_time, @topic) }
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
  event.args[:start_time].should == TimeOfDay.new(10, 0)
  event.args[:end_time].should == TimeOfDay.new(11, 0)
  event.args[:topic_id].should == 345
  event.args[:topic_title].should == 'Test Topic'
end

Then(/^the session is not added to the track$/) do
  @exception.should_not be_nil
  @exception.should be_instance_of @expected_exception 
end