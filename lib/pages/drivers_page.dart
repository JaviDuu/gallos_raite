import 'package:flutter/material.dart';

class DriversPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conductores Disponibles'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.directions_car),
            title: Text('Conductor ${index + 1}'),
            subtitle: Text('Datos del conductor ${index + 1}'),
            onTap: () {
              // Lógica para ver detalles del conductor
            },
          );
        },
      ),
    );
  }
}
