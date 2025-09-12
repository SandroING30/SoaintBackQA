@listarUsuarios
Feature: Listar todos los usuarios

  Background:
    * url baseUrl

  Scenario: Obtener lista de todos los usuarios
    Given path 'usuarios'
    When method GET
    Then status 200
    And match response contains deep { usuarios: '#[]' }
    And match each response.usuarios contains { nome: '#string', email: '#string', administrador: '#string', _id: '#string' }

