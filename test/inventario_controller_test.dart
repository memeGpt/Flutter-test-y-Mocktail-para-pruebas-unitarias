import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pruebas_flutter/controllers/inventario_controller.dart';
import 'package:pruebas_flutter/models/producto.dart';
import 'package:pruebas_flutter/services/producto_service.dart';

class MockProductoService extends Mock implements ProductoService {}

void main() {
  late MockProductoService mockService;
  late InventarioController controller;

  setUp(() {
    mockService = MockProductoService();
    controller = InventarioController(mockService);
  });

  // PRUEBA 1
  test('verifica que un producto con stock este disponible', () {
    // Preparar
    final producto = Producto(
      id: 1,
      nombre: 'Teclado',
      precio: 25000,
      stock: 5,
    );

    // Ejecutar
    final resultado = controller.productoDisponible(producto);

    // Verificar
    expect(resultado, true);
  });

  // PRUEBA 2
  test('verifica que un producto sin stock no este disponible', () {
    // Preparar
    final producto = Producto(id: 2, nombre: 'Mouse', precio: 12000, stock: 0);

    // Ejecutar
    final resultado = controller.productoDisponible(producto);

    // Verificar
    expect(resultado, false);
  });

  // PRUEBA 3
  test('calcula correctamente el valor total del inventario', () async {
    // Preparar
    final productos = [
      Producto(id: 1, nombre: 'Teclado', precio: 25000, stock: 2),
      Producto(id: 2, nombre: 'Mouse', precio: 10000, stock: 3),
    ];

    when(() => mockService.obtenerProductos())
        .thenAnswer((_) async => productos);

    // Ejecutar
    final resultado = await controller.calcularValorInventario();

    // Verificar
    expect(resultado, 80000);

    verify(() => mockService.obtenerProductos()).called(1);
  });

  // PRUEBA 4
  test('cuenta solamente los productos disponibles', () async {
    // Preparar
    final productos = [
      Producto(id: 1, nombre: 'Teclado', precio: 25000, stock: 5),
      Producto(id: 2, nombre: 'Mouse', precio: 10000, stock: 0),
      Producto(id: 3, nombre: 'Monitor', precio: 95000, stock: 3),
    ];

    when(() => mockService.obtenerProductos())
        .thenAnswer((_) async => productos);

    // Ejecutar
    final resultado = await controller.contarProductosDisponibles();

    // Verificar
    expect(resultado, 2);

    verify(() => mockService.obtenerProductos()).called(1);
  });
}
