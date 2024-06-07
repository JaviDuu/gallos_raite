// data.dart
import 'route_model.dart';

// route_model.dart

class Route {
  final String name;
  final String origin;
  final String destination;
  final List<String> points;

  Route({
    required this.name,
    required this.origin,
    required this.destination,
    required this.points,
  });
}

List<Route> routes = [
  Route(
    name: 'Ruta 1',
    origin: 'Origen 1',
    destination: 'Destino 1',
    points: ['Punto A', 'Punto B', 'Punto C'],
  ),
  Route(
    name: 'Ruta 2',
    origin: 'Origen 2',
    destination: 'Destino 2',
    points: ['Punto X', 'Punto Y', 'Punto Z'],
  ),
  // Agrega más rutas de ejemplo aquí
];
