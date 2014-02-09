Given(/^a speaker$/) do
  @speaker = Speaker.new(456, "Joe Speaker")
end

Given(/^they have opted to submit a topic$/) do
  # Noop
end

Given(/^provided a title, overview and conference$/) do
  @title = 'Test Topic'
  @overview = 'A test topic'
  step 'a conference accepting submissions'
end

Given(/^the conference is not accepting submissions$/) do
  @title = 'Test Topic'
  @overview = 'A test topic'
  step 'a conference'
end

Given(/^a topic submitted to a conference$/) do
  step 'a speaker'
  step 'provided a title, overview and conference'
  @topic = Topic.allocate
  @topic.replay(Event.new(:topic_submitted,
    topic_id: 345,
    speaker: @speaker,
    title: @title,
    overview: @overview,
    conference_id: @conference.id))
end

Given(/^a topic shortlisted for a conference$/) do
  step 'a topic submitted to a conference'
  @topic.replay(Event.new(:topic_shortlisted, topic_id: 345))
end

When(/^they submit the topic$/) do
  attempt { @topic = Topic.new(345, @speaker, @title, @overview, @conference) }
end

When(/^they shortlist the topic$/) do
  @topic.shortlist
end

When(/^they unshortlist the topic$/) do
  @topic.unshortlist
end

Then(/^the topic is submitted to the conference$/) do
  event = @topic.pending_events.first
  event.name.should == :topic_submitted
  event.args[:topic_id].should == 345
  event.args[:speaker].should == @speaker
  event.args[:title].should == @title
  event.args[:overview].should == @overview
  event.args[:conference_id].should == 123
end

Then(/^the topic is not submitted to the conference$/) do
  @exception.should_not be_nil
  @exception.should be_instance_of ConferenceNotAcceptingSubmissions 
end

Then(/^the topic can be assigned to a track$/) do
  event = @topic.pending_events.first
  event.name.should == :topic_shortlisted
  event.args[:topic_id].should == 345
end

Then(/^the topic can not be assigned to a track$/) do
  event = @topic.pending_events.first
  event.name.should == :topic_unshortlisted
  event.args[:topic_id].should == 345
end