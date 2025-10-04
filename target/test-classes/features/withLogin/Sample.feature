Feature: Scorecraze API

  #Common URI will be fetched from here and appended to path and params (after '?' in URI)
  Background: 
    * url 'https://dev.scorecraze.app/api/'
    * header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2ODkyZjQ2Y2IyNTBhNGY2YjFiZWRjZTciLCJ1c2VyTmFtZSI6ImNoYSIsImVtYWlsIjoiY2hhbmRyb29zMzBAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOjAsInJvbGUiOiJBZG1pbiIsImlzVmVyaWZpZWQiOnRydWUsIl9fdiI6MCwidXBkYXRlZEF0IjoiMjAyNS0wOS0yMVQwOToyODoxNS45NjlaIiwiaXNBY3RpdmUiOnRydWUsImxhc3RMb2dpbkF0IjoiMjAyNS0wOS0wNFQxMzowMToxOS44MzRaIiwiaWF0IjoxNzU4NDQ2OTE5LCJleHAiOjE3NjExMjUzMTl9.r8-gS-LRd1RhZcaXPeCguep4NatcNJuQI8Et_qlgTII'
    * header Content-Type = 'application/json'

  Scenario: Fetch User Teams
    Given path 'team/cricket'
    When method GET
    Then status 200
    Then print response
    And print responseStatus

  Scenario: Fetch User Players
    Given path 'team/cricket/players'
    When method GET
    Then status 200
    And print response
    And print responseStatus

  Scenario: Create a Player
    * def requestBody =
      """
      {
        "playerImg": "",
        "playerName": "Dummy",
        "playerDisplayName": "Dum",
        "player_value": "0",
        "mobileNumber": "9174963102",
        "player_type": "wk"
      }
      """
    Given path 'team/cricket/addplayer'
    And request requestBody
    And method POST
    Then status 200
    Then print response

  @tag1
  Scenario: Fetch Upcoming matches
    * def requestBody = read('requestData.json')
    Given path 'fixture/cricket'
    And request requestBody
    And set requestBody.filter.fixtureStatus = "Upcoming"
    And method POST
    Then status 200
    Then print response

  @tag1
  Scenario: Fetch Completed matches
    * def requestBody = read('requestData.json')
    Given path 'fixture/cricket'
    And request requestBody
    And set requestBody.filter.fixtureStatus = "Completed"
    And method POST
    Then status 200
    Then print response

  @tag1
  Scenario: Fetch Live matches
    * def requestBody = read('requestData.json')
    Given path 'fixture/cricket'
    And request requestBody
    And method POST
    Then status 200
    Then print response
