Feature: Submissions

Scenario: Call for submissions
  Given an organizer
  And a conference
  When they call for submissions
  Then topics can be submitted to the conference

Scenario: Submit a topic
  Given a speaker
  And they have opted to submit a topic
  And provided a title, overview and conference
  When they submit the topic
  Then the topic is submitted to the conference

Scenario: Conference not accepting submissions
  Given a speaker
  And they have opted to submit a topic
  But the conference is not accepting submissions
  When they submit the topic
  Then the topic is not submitted to the conference