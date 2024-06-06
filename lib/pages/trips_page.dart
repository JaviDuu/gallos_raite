import 'package:flutter/material.dart';

class TripsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Viajes'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.history),
            title: Text('Viaje ${index + 1}'),
            subtitle: Text('Detalles del viaje ${index + 1}'),
            onTap: () {
              // Lógica para ver detalles del viaje
            },
          );
        },
      ),
    );
  }
}
