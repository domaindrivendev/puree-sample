Feature: Track Management

Scenario: Add a track
  Given an organizer
  And a conference
  And they have opted to add a new track
  And provided a track name
  When they create the track
  Then the track is created with no sessions

Scenario: Add a session to a track
  Given an organizer
  And a conference track
  And they have opted to add a session to the track
  And provided a start time, end time and topic
  When they add the session
  Then the session is added to the track

Scenario: Add a session but topic not shortlisted
  Given an organizer
  And a conference track
  And they have opted to add a session to the track
  But the topic is not shortlisted
  When they add the session
  Then the session is not added to the track

Scenario: Add a session but start time later end time
  Given an organizer
  And a conference track
  And they have opted to add a session to the track
  But the start time is later than the end time
  When they add the session
  Then the session is not added to the track