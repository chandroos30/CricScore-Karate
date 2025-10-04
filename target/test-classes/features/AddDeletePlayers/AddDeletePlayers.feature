Feature: To Add and delete the match result

  Background: 
    * url 'https://dev.scorecraze.app/api/'
    * header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2ODkyZjQ2Y2IyNTBhNGY2YjFiZWRjZTciLCJ1c2VyTmFtZSI6IkNIQU5EUkFTRUtBUiBTQU5LQVIiLCJlbWFpbCI6ImNoYW5kcm9vczMwQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiJDJiJDEwJEc1VmEvUFRTckQ0dUZaVXMwWjluTS5VMmhERVZvcVFuaTFseU1jb3ZzMzZjWUpCaU1oODEyIiwicGhvbmVOdW1iZXIiOjAsInJvbGUiOiJBZG1pbiIsImF1dGhUb2tlbiI6ImV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUpmYVdRaU9pSTJPRGt5WmpRMlkySXlOVEJoTkdZMllqRmlaV1JqWlRjaUxDSjFjMlZ5VG1GdFpTSTZJbU5vWVNJc0ltVnRZV2xzSWpvaVkyaGhibVJ5YjI5ek16QkFaMjFoYVd3dVkyOXRJaXdpY0dodmJtVk9kVzFpWlhJaU9qQXNJbkp2YkdVaU9pSkJaRzFwYmlJc0ltbHpWbVZ5YVdacFpXUWlPblJ5ZFdVc0lsOWZkaUk2TUN3aWRYQmtZWFJsWkVGMElqb2lNakF5TlMwd09TMHlNbFF3T1RvME1qb3lNaTQ0TURoYUlpd2lhWE5CWTNScGRtVWlPblJ5ZFdVc0lteGhjM1JNYjJkcGJrRjBJam9pTWpBeU5TMHdPUzB3TkZReE16b3dNVG94T1M0NE16UmFJaXdpYVdGMElqb3hOelU0TlRVd09UZzJMQ0psZUhBaU9qRTNOakV5TWprek9EWjkubmtWOG5JOGU3YlROZkZSS0ZRYjFrZFJVdmpLLUw1cVFhYkp5UHEwT3JpYyIsImlzVmVyaWZpZWQiOnRydWUsIl9fdiI6MCwidXBkYXRlZEF0IjoiMjAyNS0xMC0wMVQxODozNDozMC45OTRaIiwiaXNBY3RpdmUiOnRydWUsImxhc3RMb2dpbkF0IjoiMjAyNS0xMC0wMVQxODozNDozMC45OTRaIiwiaXNTb2NpYWxMb2dpbiI6dHJ1ZSwiaWF0IjoxNzU5NjAwNTU2LCJleHAiOjE3NjIyNzg5NTZ9.pGybB6efZuTFj_jWDfEhnRu_Sd7CB2-qD5-kys-J1u8'
    * header Content-Type = 'application/json'

  @Reg
  Scenario: Add team player
    * def requestBody = read('classpath:payloads/AddPlayer.json')
    Given path 'team/cricket/addTeamPlayers'
    And param teamAPIId = 1755185471222
    And request requestBody
    And method POST
    Then status 200
    * print response

  @Reg
  Scenario: Delete player from team
    * def requestBody = read('classpath:payloads/DeletePlayer.json')
    Given path 'team/cricket/deleteTeamPlayers'
    And request requestBody
    And method DELETE
    Then status 200
    * print response
