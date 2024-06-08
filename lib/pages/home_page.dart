import 'package:flutter/material.dart';
import 'route_model.dart';
import 'new_route_info_page.dart'; // Importamos la página para la información adicional de la ruta

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showRouteNameInput = false;
  TextEditingController _routeNameController = TextEditingController();
  bool _isAddButtonPressed = false;
  List<RouteModel> _routes = [];

  @override
  void initState() {
    super.initState();
    _loadFakeRoutes();
  }

  void _loadFakeRoutes() {
    setState(() {
      _routes = [
        RouteModel(id: '1', routeName: 'Ruta 1', origin: 'Campus Norte', destination: 'Residencias A'),
        RouteModel(id: '2', routeName: 'Ruta 2', origin: 'Campus Sur', destination: 'Centro Comercial B'),
        RouteModel(id: '3', routeName: 'Ruta 3', origin: 'Biblioteca', destination: 'Residencias C'),
        // Agrega más rutas de ejemplo según sea necesario
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear/Reservar Ruta'),
      ),
      body: Stack(
        children: <Widget>[
          _showRouteNameInput ? _buildRouteNameInput() : _buildRouteList(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _isAddButtonPressed = !_isAddButtonPressed;
                    _showRouteNameInput = _isAddButtonPressed;
                  });
                },
                child: Icon(_isAddButtonPressed ? Icons.close : Icons.add),
              ),
            ),
          ),
          if (_showRouteNameInput)
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 90, right: 16),
                child: FloatingActionButton(
                  onPressed: () async {
                    if (_routeNameController.text.isNotEmpty) {
                      final newRoute = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewRouteInfoPage(
                            routeName: _routeNameController.text,
                          ),
                        ),
                      );
                      if (newRoute != null) {
                        setState(() {
                          _routes.add(newRoute);
                        });
                      }
                    }
                  },
                  child: Icon(Icons.check),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRouteNameInput() {
    return Positioned(
      top: 0,
      left: 16,
      right: 16,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
          controller: _routeNameController,
          decoration: InputDecoration(
            labelText: 'Nombre de la Nueva Ruta',
          ),
        ),
      ),
    );
  }

  Widget _buildRouteList() {
    return ListView.builder(
      itemCount: _routes.length,
      itemBuilder: (context, index) {
        final route = _routes[index];
        return ListTile(
          title: Text(route.routeName),
          subtitle: Text('${route.origin} -> ${route.destination}'),
          onTap: () {
            // Lógica para ver detalles de la ruta
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _routeNameController.dispose();
    super.dispose();
  }
}
