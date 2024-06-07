import 'package:flutter/material.dart';
import 'edit_profile_page.dart'; // Importa la página de edición de perfil

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Perfil'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Lógica para cerrar sesión
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_picture.png'),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text(
                'Nombre del Estudiante',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('ID: 123456'), // Cambiar por el ID del estudiante
            ),
            ListTile(
              title: Text(
                'Correo Electrónico',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Text('estudiante@universidad.edu'), // Cambiar por el correo del estudiante
            ),
            ListTile(
              title: Text(
                'Carrera',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Text('Ingeniería Informática'), // Cambiar por la carrera del estudiante
            ),
            ListTile(
              title: Text(
                'Bio',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquet risus nec eleifend lobortis.', // Agregar la bio del estudiante
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navega a la página de edición de perfil cuando se presiona el botón
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
                },
                child: Text('Editar Perfil'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
