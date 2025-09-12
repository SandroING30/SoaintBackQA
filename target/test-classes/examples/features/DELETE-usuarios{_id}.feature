@eliminarUsuario
Feature: Eliminar usuario

  Background:
    * url baseUrl
    * def result = call read('POST-usuario.feature')
    * def userId = result.id

  Scenario: Eliminar usuario sin carrito
    Given path 'usuarios', userId
    When method DELETE
    Then status 200
    And match response.message == '#string'

