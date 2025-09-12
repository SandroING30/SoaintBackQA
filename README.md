# Reto de Automatización QA - BackEnd

Este proyecto contiene una **automatización de pruebas QA del Backend** para la **API de Usuarios de ServeRest** ([https://serverest.dev/](https://serverest.dev/)) utilizando **Karate DSL**.

---

## 🎯 Objetivo

Automatizar pruebas para la API de usuarios, incluyendo operaciones **CRUD** y escenarios positivos y negativos, siguiendo buenas prácticas de automatización y reutilización de código.

---

## 📁 Estructura del Proyecto

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
## ⚙️ Requisitos del Entorno

* **Java 11 o superior** (se recomienda Java 17)
* **Maven o Gradle** configurado en la variable de entorno \$PATH
* IDE compatible (IntelliJ, VS Code, Eclipse, etc.)
* Acceso a la API: [https://serverest.dev](https://serverest.dev)

Instalación de Karate DSL:
[https://github.com/karatelabs/karate/wiki/Get-Started:-Maven-and-Gradle](https://github.com/karatelabs/karate/wiki/Get-Started:-Maven-and-Gradle)

## 🧪 Ejecución de Pruebas

Todas las pruebas deben ejecutarse desde la terminal o línea de comandos.

### 1️⃣ Ejecución por Etiquetas

```bash
mvn test -Dkarate.options="--tags @Test"
```

### 2️⃣ Ejecución según Entorno

```bash
mvn test -Dkarate.options="--tags @Test" -Dkarate.env="QA"
```

### 🧪 Ejecución de Pruebas CRUD

Dado que todas las pruebas reutilizan `crearUsuario.feature`, no es necesario:

* Ejecutar un POST manualmente
* Ingresar IDs manualmente en GET, PUT o DELETE

Solo se debe invocar el comando con la **etiqueta específica**:

**POST - registro inválido (email duplicado)**

```bash
mvn test -Dkarate.options="--tags @registrarUsuarioEmailExistente" -Dkarate.env=QA
```

**GET /usuarios/{\_id}**

```bash
mvn test -Dkarate.options="--tags @buscarUsuarioId" -Dkarate.env=QA
```

**PUT /usuarios/{\_id}**

```bash
mvn test -Dkarate.options="--tags @actualizarUsuario" -Dkarate.env=QA
```

**DELETE /usuarios/{\_id}**

```bash
mvn test -Dkarate.options="--tags @eliminarUsuario" -Dkarate.env=QA
```

**GET /usuarios (listado general)**

```bash
mvn test -Dkarate.options="--tags @listarUsuarios" -Dkarate.env=QA
```

## 🌎 Configuración de Entornos

Para ajustar la `baseUrl` según el entorno, modifique `karate.env`:

```javascript
if (env === 'CERTI') {
    config.baseUrl = 'https://serverest.dev/';
}
```

Todas las URLs se gestionan desde `karate-config.js`.

## 🎯 Estrategias y Buenas Prácticas

* Creación de **emails únicos** utilizando `java.util.UUID` para evitar duplicidades
* Uso de `call read()` para encadenar features y compartir variables globales
* Cada feature enfocado en un escenario principal para mejorar la mantenibilidad
* Cobertura de escenarios **positivos y negativos**
* Configuración centralizada de entornos en `karate-config.js`

## 🛠 Posibles Mejoras

* Modularización de Requests para reutilización avanzada
* Validaciones detalladas de **schemas** y **responses**
* Ampliación de escenarios de prueba
* Integración de reportes visuales más completos (Cucumber / Karate HTML Reports)

## 📊 Generación de Reportes

Los reportes se generan en `target/karate-reports/`, incluyendo:

* `karate-summary.html`: Resumen consolidado de todas las ejecuciones

Se recomienda abrir `karate-summary.html` en un navegador para revisar los resultados de manera visual.