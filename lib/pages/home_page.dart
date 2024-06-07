import 'package:flutter/material.dart';
import 'new_route_info_page.dart'; // Importamos la página para la información adicional de la ruta

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showRouteNameInput = false;
  TextEditingController _routeNameController = TextEditingController();
  bool _isAddButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear/Reservar Ruta'),
      ),
      body: Stack(
        children: <Widget>[
          Visibility(
            visible: _showRouteNameInput,
            child: Positioned(
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
            ),
          ),
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
          Visibility(
            visible: _showRouteNameInput,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 90, right: 16),
                child: FloatingActionButton(
                  onPressed: () {
                    if (_routeNameController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewRouteInfoPage(routeName: _routeNameController.text),
                        ),
                      );
                    }
                  },
                  child: Icon(Icons.check),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _routeNameController.dispose();
    super.dispose();
  }
}
