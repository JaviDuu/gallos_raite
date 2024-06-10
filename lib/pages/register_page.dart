import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Career {
  final int id;
  final String name;

  Career(this.id, this.name);
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _semesterController = TextEditingController();
  final TextEditingController _entryDateController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  int? _selectedCareer;
  String? _selectedGender;
  List<Career> _careerOptions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCareerOptions();
  }

  void _loadCareerOptions() async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.43.68:3000/carrera/mostrarCarrera'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _careerOptions = data
              .map<Career>((career) => Career(career['id_carrera'], career['carrera']))
              .toList();
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

  void _register() {
    if (_formKey.currentState!.validate()) {
      print('Nombre de usuario: ${_usernameController.text}');
      print('Nombre: ${_nameController.text}');
      print('Apellidos: ${_surnameController.text}');
      print('Email: ${_emailController.text}');
      print('Teléfono: ${_phoneController.text}');
      print('Contraseña: ${_passwordController.text}');
      print('Carrera: $_selectedCareer');
      print('Semestre: ${_semesterController.text}');
      print('Género: $_selectedGender');
      print('Fecha de ingreso: ${_entryDateController.text}');
      print('ID estudiantil: ${_studentIdController.text}');
      print('Fecha de nacimiento: ${_birthdateController.text}');
      print('Bio: ${_bioController.text}');

      Navigator.pushReplacementNamed(context, '/main');
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
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nombre',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa tu nombre';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _surnameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Apellidos',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa tus apellidos';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Correo Electrónico',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa tu correo electrónico';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Número de Teléfono',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa tu número de teléfono';
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
                      DropdownButtonFormField<int>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Carrera',
                        ),
                        value: _selectedCareer,
                        items: _careerOptions.map((Career career) {
                          return DropdownMenuItem<int>(
                            value: career.id,
                            child: Text(career.name),
                          );
                        }).toList(),
                        onChanged: (int? newValue) {
                          setState(() {
                            _selectedCareer = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Selecciona una carrera';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _semesterController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Semestre',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa tu semestre';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Género',
                        ),
                        value: _selectedGender,
                        items: <String>['Masculino', 'Femenino', 'Otro']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedGender = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Selecciona tu género';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _entryDateController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Fecha de Ingreso',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa tu fecha de ingreso';
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
                      TextFormField(
                        controller: _birthdateController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Fecha de Nacimiento',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa tu fecha de nacimiento';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _bioController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Bio',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa tu bio';
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
