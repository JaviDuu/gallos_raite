import 'package:flutter/material.dart';
import 'trips_page.dart'; // Importamos la pantalla de viajes

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa de la Ruta'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Placeholder(), // Aquí iría el widget del mapa
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TripsPage(),
                  ),
                );
              },
              child: Text('Aceptar'),
            ),
          ),
        ],
      ),
    );
  }
}
