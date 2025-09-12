Guía de Uso del Framework Karate DSL

Proyecto: QA Automation Junior con Karate DSL – Yrvin Pachas (Inetum)

Este proyecto contiene pruebas automatizadas utilizando Karate DSL para verificar el correcto funcionamiento de la API de gestión de usuarios del sistema ServeRest. 
He utilizado un enfoque de reutilización de funciones para optimizar el tiempo y mejorar la eficiencia de las pruebas, eliminando la necesidad de crear un usuario manualmente en cada prueba. 
Esto permite ejecutar las pruebas de GET, PUT y DELETE sin necesidad de manejar el ID de los usuarios, ya que el POST de creación de usuario es reutilizado automáticamente.

📁 Estructura del Proyecto
```
features/
├── POST-usuario.feature      # Crea un usuario con email aleatorio y devuelve su ID
├── usuarios-post-invalid.feature   # Escenario negativo: registro con email duplicado
├── buscarUsuarioPorId.feature      # Llama a crearUsuarioValido, captura el ID y hace GET /usuarios/{id}
├── usuarios-put.feature            # Llama a crearUsuarioValido, captura el ID y hace PUT /usuarios/{id}
├── usuarios-delete.feature         # Llama a crearUsuarioValido, captura el ID y hace DELETE /usuarios/{id}
├── usuarios-get-list.feature       # Lista todos los usuarios (no depende de crearUsuarioValido)
└── UsersRunner.java                # Runner JUnit para ejecutar todos los features

karate-config.js                    # Configuración de entornos y baseUrl
pom.xml                             # Dependencias y plugin para Karate DSL
```
⚙️ Requisitos Previos

Java 8+ (utilize  Java 17)

Maven  o Gradle  instalado y en $PATH

IDE (IntelliJ, VS Code, etc.)

Conexión a la API: https://serverest.dev


La instalacion de Karate DSL la realize mediante :
https://github.com/karatelabs/karate/wiki/Get-Started:-Maven-and-Gradle


🧪 Ejecuciones

Todas las ejecuciones tienen que ser por command prompt
1️⃣ Ejecución por Tags
Para ejecutar pruebas específicas usando tags:

mvn test -Dkarate.options="--tags @Test"

2️⃣ Ejecución por Entornos
Para ejecutar pruebas en un entorno específico como QA:


mvn test -Dkarate.options="--tags @Test" -Dkarate.env="QA"


🧪 Ejecución de Pruebas CRUD

Como todos los tests reutilizan POST-usuario.feature, NO necesitamos:

Ejecutar manualmente un POST

No es necesario Introducir un ID en los archivos de GET, PUT o DELETE

Solo ejecuta el comando con la etiqueta correspondiente:

POST-usuarioInvalid
Registrar usuario negativo (email duplicado)

mvn test -Dkarate.options="--tags @registrarUsuarioEmailExistente" -Dkarate.env=QA

GET/usuarios/{_id}
Obtener usuario por ID

mvn test -Dkarate.options="--tags @buscarUsuarioId" -Dkarate.env=QA

PUT/usuarios/{_id}
Actualizar usuario

mvn test -Dkarate.options="--tags @actualizarUsuario" -Dkarate.env=QA

DELETE/usuarios/{_id}
Eliminar usuario

mvn test -Dkarate.options="--tags @eliminarUsuario" -Dkarate.env=QA

GET/usuarios
Listar todos los usuarios

mvn test -Dkarate.options="--tags @listarUsuarios" -Dkarate.env=QA

🌎 Entornos (env)

Para cambiar la baseUrl según el entorno, ajusta karate.env:

if (env == 'QA') {
config.baseUrl = 'https://serverest.dev/'
}

Las URLs se definen en karate-config.js.

🎯 Practicas utilizadas

A modo de practica Genere emails únicos usando java.util.UUID para no colisionar.

Utilizar call read() para encadenar features y compartir variables.

Mantener cada feature enfocado a un solo escenario principal.

Scenarios positivos y negativos 

Configuracion en Karate-config para entornos 

🛠 Mejoras Futuras
Se pueden mejorar las validaciones creando carpetas para:

Requests: Modularización de las solicitudes de la API.

Schemas y Response: Validaciones específicas de las respuestas.

Más Scenarios de prueba.

Reporte de Cucumber: Para obtener resultados más detallados y visuales.

📊 Ver Reportes
Después de ejecutar las pruebas, Karate genera los reportes en la carpeta target/karate-reports/. Dentro de esta carpeta, puedes encontrar:

karate-summary.html: Un resumen general de las ejecuciones.


Para ver los reportes, solo abre karate-summary.html  en tu navegador.

🙋‍♂️ Autor

Yrvin Pachas – QA Automation Junior @ Inetum



