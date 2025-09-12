@registrarNuevoUsuario
Feature: Registrar un nuevo usuario

  Background:
    * url baseUrl
    * def randomEmail = 'sandro+' + java.util.UUID.randomUUID() + '@gmail.com'

  @crearUsuarioValido
  Scenario: Registrar usuario con datos válidos
    Given path 'usuarios'
    And request { nome: 'Sandro Huamán Mendoza', email: "#(randomEmail)", password: 'testerQA', administrador: 'true' }
    When method POST
    Then status 201
    And match response contains { message: '#string', _id: '#string' }
    * def id = response._id




