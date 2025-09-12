@buscarUsuarioId
Feature: Buscar usuario por ID

  Background:
    * url baseUrl
    * def result = call read('POST-usuario.feature')
    * def userId = result.id

  Scenario: Buscar usuario existente por ID
    Given path 'usuarios', userId
    When method GET
    Then status 200
    And match response contains { nome: '#string', email: '#string', password: '#string', administrador: '#string', _id: '#(userId)' }

  Scenario: Buscar usuario inexistente por ID
    Given path 'usuarios', '79UndqZN5oz4LU2a'
    When method GET
    Then status 400
    And match response.message == '#string'
