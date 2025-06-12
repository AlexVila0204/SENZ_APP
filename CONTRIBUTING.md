# Guía de Contribución

¡Gracias por tu interés en contribuir a Senz App! Este documento proporciona las pautas y el proceso para contribuir al proyecto.

## Flujo de Trabajo

1. **Fork del Repositorio**
   - Haz un fork del repositorio a tu cuenta de GitHub
   - Clona tu fork localmente:
     ```bash
     git clone https://github.com/TU-USUARIO/senz_app.git
     cd senz_app
     ```

2. **Configuración del Entorno**
   - Asegúrate de tener Flutter instalado y configurado
   - Ejecuta `flutter pub get` para instalar las dependencias
   - Ejecuta `flutter doctor` para verificar que todo esté correctamente configurado

3. **Crear una Rama**
   - Crea una nueva rama para tu feature o fix:
     ```bash
     git checkout -b feature/nombre-de-tu-feature
     # o
     git checkout -b fix/nombre-del-fix
     ```

4. **Desarrollo**
   - Realiza tus cambios siguiendo las convenciones de código
   - Asegúrate de que los tests pasen
   - Mantén tus commits atómicos y descriptivos

5. **Pull Request**
   - Push de tus cambios a tu fork:
     ```bash
     git push origin feature/nombre-de-tu-feature
     ```
   - Crea un Pull Request desde tu fork a la rama `develop` del repositorio principal
   - Completa la plantilla de Pull Request con todos los detalles necesarios

## Convenciones de Código

- Sigue las guías de estilo de Dart/Flutter
- Usa nombres descriptivos para variables, funciones y clases
- Documenta tu código cuando sea necesario
- Escribe tests para nuevas funcionalidades

## Proceso de Revisión

1. Tu PR será revisada por los mantenedores del proyecto
2. Podrían solicitar cambios o mejoras
3. Una vez aprobada, tu PR será mergeada a la rama `develop`
4. Los cambios serán eventualmente mergeados a `master` después de pruebas adicionales

## Estructura de Ramas

- `master`: Código en producción
- `develop`: Rama principal de desarrollo
- `feature/*`: Nuevas características
- `fix/*`: Correcciones de bugs
- `release/*`: Preparación de releases

## Comunicación

- Usa el sistema de issues para reportar bugs o sugerir features
- Mantén la comunicación profesional y constructiva
- Si tienes dudas, no dudes en preguntar

¡Gracias por contribuir a hacer Senz App mejor! 