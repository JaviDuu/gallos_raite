import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UAA-BUS'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _mostrarPopup(context); // Llama a la función para mostrar el popup
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Buscar Viajes',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }

  // Función para mostrar el popup
  void _mostrarPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Mapa de Viajes"), // Título del popup
          content: Image.asset('assets/mapa.png'), // Contenido del popup
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el popup cuando se presiona el botón
              },
              child: Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }
}
