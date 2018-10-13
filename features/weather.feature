Feature: Weather
  Scenario: weather in mocsow
    When I run `weather moscow`
    Then the output should contain "woeid:"
