Feature: Conference Setup

Scenario: Create a conference
  Given an organizer
  And they have opted to add a new conference
  And provided a name, description, date and location
  When they create the conference
  Then a conference is created in draft mode