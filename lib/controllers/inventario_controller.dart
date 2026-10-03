import '../models/producto.dart';
import '../services/producto_service.dart';

class InventarioController {
  final ProductoService service;

  InventarioController(this.service);

  bool productoDisponible(Producto producto) {
    return producto.stock > 0;
  }

  Future<double> calcularValorInventario() async {
    final productos = await service.obtenerProductos();

    double total = 0;

    for (final producto in productos) {
      total += producto.precio * producto.stock;
    }

    return total;
  }

  Future<int> contarProductosDisponibles() async {
    final productos = await service.obtenerProductos();

    return productos.where((producto) => producto.stock > 0).length;
  }

  Future<int> obtenerStockTotal() async {
    final productos = await service.obtenerProductos();

    int total = 0;

    for (final producto in productos) {
      total += producto.stock;
    }

    return total;
  }
}