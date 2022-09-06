@counter
Feature: Counter
  As a user
  I want to be able to increment the counter.
  So I can see how many times I have tapped on it

  Scenario: Increment
    When the user taps on the increment button 2 time
    Then the user sees the general text
    And the user should see the increment amount increase by 2
