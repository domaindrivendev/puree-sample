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
  And provided a topic, start time and end time
  When they add the session
  Then the session is added to the track

Scenario: Add a session but topic not shortlisted
  Given an organizer
  And a conference track
  And they have opted to add a session to the track
  But the topic is not shortlisted
  When they add the session
  Then the session is not added to the track

Scenario: Add a session but start time later than end time
  Given an organizer
  And a conference track
  And they have opted to add a session to the track
  But the start time is later than the end time
  When they add the session
  Then the session is not added to the track

Scenario: Add a session but time conflicts with existing session
  Given an organizer
  And a conference track with a session added
  And they have opted to add a session to the track
  But the time conflicts with the existing session
  When they add the session
  Then the session is not added to the track

Scenario: Remove a session from a track
  Given an organizer
  And a conference track with a session added
  When they remove the session
  Then the session is removed from the track
