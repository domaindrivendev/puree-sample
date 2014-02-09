Given(/^an organizer$/) do
  @organizer = Organizer.new(123, 'Joe Organizer')
end

Given(/^they have opted to add a new conference$/) do
  # Noop
end

Given(/^provided a name, description, date and location$/) do
  @name = 'Test Conf'
  @description = 'A test conf'
  @date = Time.now.utc + (60 * 60 * 24)
  @location = 'Test Location'
end

Given(/^a conference$/) do
  step 'provided a name, description, date and location'

  @conference = Conference.allocate
  @conference.replay(Event.new(:conference_created,
    id: 123,
    name: @name,
    description: @description,
    date: @date,
    location: @location,
    organizer: @organizer))
end

Given(/^a conference accepting submissions$/) do
  step 'a conference'
  @conference.replay(Event.new(:called_for_submissions, conference_id: 123))
end

Given(/^a conference with a topic submitted$/) do
  step 'a conference accepting submissions'
  step 
end

When(/^they create the conference$/) do
  @conference = Conference.new(123, @organizer, @name, @description, @date, @location)
end

When(/^they call for submissions$/) do
  @conference.call_for_submissions
end

Then(/^a conference is created in draft mode$/) do
  event = @conference.pending_events.first
  event.name.should == :conference_created
  event.args[:id].should == 123
  event.args[:name].should == @name
  event.args[:description].should == @description
  event.args[:date].should == @date
  event.args[:location].should == @location
end

Then(/^topics can be submitted to the conference$/) do
  event = @conference.pending_events.first
  event.name.should == :called_for_submissions
  event.args[:conference_id].should == 123
end