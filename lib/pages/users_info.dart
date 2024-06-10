import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Career {
  final int id;
  final String name;

  Career(this.id, this.name);
}

class UsersInfo extends StatefulWidget {
  @override
  _UsersInfoState createState() => _UsersInfoState();
}

class _UsersInfoState extends State<UsersInfo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();

  List<Career> _careerOptions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCareerOptions();
  }

  void _loadCareerOptions() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.43.68:3000/carrera/mostrarCarrera'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _careerOptions = data.map<Career>((career) => Career(career['id_carrera'], career['carrera'])).toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load career options');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      // Obtener los valores de los controladores
      String usuario = _usernameController.text;
      String contrasena = _passwordController.text;
      String idEscolar = _studentIdController.text;

      // Crear el cuerpo de la solicitud en formato JSON
      Map<String, String> body = {
        'usuario': usuario,
        'contrasena': contrasena,
        'id_escolar': idEscolar,
      };

      // Enviar la solicitud POST al API
      try {
        final response = await http.post(
          Uri.parse('http://192.168.43.68:3000/sesiones/insertarSesion'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body),
        );

        // Verificar si la solicitud fue exitosa
        if (response.statusCode == 201) {
          // El registro fue exitoso, puedes realizar cualquier acción adicional aquí
          print('Registro exitoso');
          Navigator.pushReplacementNamed(context, '/main');
        } else {
          // Hubo un error en la solicitud
          print('Error en la solicitud: ${response.statusCode}');
          // Mostrar un mensaje de error al usuario, si es necesario
        }
      } catch (e) {
        // Hubo un error al conectarse al servidor
        print('Error al conectar al servidor: $e');
        // Mostrar un mensaje de error al usuario, si es necesario
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: _isLoading
              ? CircularProgressIndicator()
              : Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 120.0,
                      ),
                      Text(
                        'Registro',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nombre de Usuario',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa tu nombre de usuario';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contraseña',
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa una contraseña';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _studentIdController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ID Estudiantil',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa tu ID estudiantil';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _register,
                        child: Text('Registrar'),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}