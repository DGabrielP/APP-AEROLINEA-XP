#!/bin/bash

# Crear directorios con .gitkeep para mantenerlos en git
mkdir -p backend/src/main/java/controller
touch backend/src/main/java/controller/.gitkeep

mkdir -p backend/src/test
touch backend/src/test/.gitkeep

mkdir -p backend/migrations
touch backend/migrations/.gitkeep

mkdir -p backend/resources
echo "# Configuraciones YAML del backend" > backend/resources/configurations.yml

# Archivo pom.xml básico (ejemplo mínimo)
cat <<EOL > backend/pom.xml
<project xmlns="http://maven.apache.org/POM/4.0.0" 
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
                             http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.example</groupId>
    <artifactId>app-aerolinea-backend</artifactId>
    <version>1.0.0</version>
</project>
EOL

# Crear frontend
mkdir -p frontend/pages
touch frontend/pages/.gitkeep

mkdir -p frontend/components
touch frontend/components/.gitkeep

mkdir -p frontend/styles
touch frontend/styles/.gitkeep

mkdir -p frontend/service
touch frontend/service/.gitkeep

# Crear docs
mkdir -p docs
echo "# Arquitectura del sistema" > docs/arquitectura.md

# Crear xp_docs
mkdir -p xp_docs
echo "# Historias de usuario" > xp_docs/historias_usuario.md
echo "# Tareas" > xp_docs/tareas.md
echo "# Feedback del cliente" > xp_docs/feedback_cliente.md

# Crear .github workflows
mkdir -p .github/workflows
cat <<EOL > .github/workflows/ci.yml
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    - name: Set up JDK 17
      uses: actions/setup-java@v3
      with:
        distribution: 'temurin'
        java-version: 17
    - name: Build backend with Maven
      working-directory: backend
      run: mvn clean install
EOL

# Crear README.md
echo "# Proyecto App Aerolinea

Este repositorio contiene la estructura simulada de un proyecto XP para una aplicación de aerolínea.

## Estructura

- backend/: código backend Java con Maven
- frontend/: código frontend con componentes y páginas
- docs/: documentación de arquitectura
- xp_docs/: documentos XP: historias, tareas y feedback
- .github/workflows/: configuración de integración continua

" > README.md

echo "Estructura creada correctamente."
