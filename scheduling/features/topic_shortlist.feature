Feature: Topic Shortlist

Scenario: Shortlist a topic
  Given an organizer
  And a topic submitted to a conference
  When they shortlist the topic
  Then the topic can be assigned to a track

Scenario: Unshortlist a topic
  Given an organizer
  And a topic shortlisted for a conference
  When they unshortlist the topic
  Then the topic can not be assigned to a track