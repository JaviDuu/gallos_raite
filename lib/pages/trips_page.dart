import 'package:flutter/material.dart';
import 'home_page.dart'; // Importamos la pantalla de inicio

class TripsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Deshabilitar la flecha de retroceso
        title: Text('Mis Viajes'),
      ),
      body: SafeArea( // Envuelve el cuerpo con SafeArea
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
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
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/main');
                },
                icon: Icon(Icons.home),
                label: Text('Inicio'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
