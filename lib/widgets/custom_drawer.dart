import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University Rideshare'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Lógica para buscar viajes
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
      drawer: CustomDrawer(), // Utiliza el CustomDrawer aquí
    );
  }
}

class CustomDrawer extends StatelessWidget { // Define la clase CustomDrawer
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menú',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.directions_car),
            title: Text('Conductores'),
            onTap: () {
              Navigator.pushNamed(context, '/drivers');
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Viajes'),
            onTap: () {
              Navigator.pushNamed(context, '/trips');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
    );
  }
}
