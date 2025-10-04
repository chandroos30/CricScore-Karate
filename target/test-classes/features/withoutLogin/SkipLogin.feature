Feature: To fetch All matches & Tournaments without Login

  @Reg
  Scenario: Fetch All Live matches without login
    * def requestBody = read('classpath:payloads/withoutLogin.json')
    Given url 'https://dev.scorecraze.app/cricket/fixtures'
    And param page = 1
    And header Content-Type = 'application/json'
    And request requestBody
    And method POST
    Then status 200
    * print response
