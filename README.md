# Pruebas unitarias con Flutter Test y Mocktail

Proyecto de ejemplo desarrollado para demostrar el uso de **Flutter Test** y **Mocktail** en pruebas unitarias con Flutter.

## Objetivo

El proyecto simula un pequeño inventario de productos y permite comprobar diferentes comportamientos mediante pruebas automatizadas.

## Estructura principal

```text
lib/
├── models/
│   └── producto.dart
├── services/
│   └── producto_service.dart
└── controllers/
    └── inventario_controller.dart

test/
└── inventario_controller_test.dart
```

## Tecnologías utilizadas

- Flutter
- Dart
- Flutter Test
- Mocktail

## Instalación

Clonar el repositorio:

```bash
git clone <https://github.com/memeGpt/Flutter-test-y-Mocktail-para-pruebas-unitarias>
```

Entrar a la carpeta del proyecto:

```bash
cd pruebas_flutter
```

Descargar las dependencias:

```bash
flutter pub get
```

## Ejecutar las pruebas

Para ejecutar todas las pruebas:

```bash
flutter test
```

Para mostrar el nombre de cada prueba:

```bash
flutter test -r expanded
```

## Casos de prueba incluidos

El proyecto contiene pruebas para verificar:

- Si un producto con stock está disponible.
- Si un producto sin stock no está disponible.
- El cálculo del valor total del inventario.
- El conteo de productos disponibles.

Mocktail se utiliza para simular el servicio encargado de obtener los productos, evitando depender de una base de datos o API real.

## Resultado esperado

Cuando todas las pruebas se ejecutan correctamente, Flutter muestra:

```text
All tests passed!
```