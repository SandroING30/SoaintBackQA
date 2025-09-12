@registrarUsuarioEmailExistente
Feature: Registrar un nuevo usuario

  Background:
    * url baseUrl

  Scenario: Registrar usuario con email ya existente
    Given path 'usuarios'
    And request { nome: 'Sandro Huaman ', email: 'sandroingsistemas30@gmail.com', password: '123456', administrador: 'true' }
    When method POST
    Then status 400
    And match response contains { message: '#string' }



