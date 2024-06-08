import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _semesterController = TextEditingController();
  final TextEditingController _entryDateController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();

  String? _selectedCareer;
  String? _selectedGender;

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Aquí pones la lógica para registrar el usuario
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
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/logo.png', // Aquí se pone el logo
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
                  DropdownButtonFormField<String>(
                    value: _selectedCareer,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Carrera',
                    ),
                    items: ['Ingeniería', 'Medicina', 'Derecho', 'Arquitectura']
                        .map((career) {
                      return DropdownMenuItem(
                        value: career,
                        child: Text(career),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCareer = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Selecciona tu carrera';
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
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa tu semestre';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Género',
                    ),
                    items: ['Masculino', 'Femenino', 'Otro']
                        .map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
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
                      labelText: 'Fecha de ingreso',
                    ),
                    keyboardType: TextInputType.datetime,
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
                      labelText: 'ID estudiantil',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa tu ID estudiantil';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa tu email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Ingresa un email válido';
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
                        return 'Ingresa tu contraseña';
                      }
                      if (value.length < 6) {
                        return 'La contraseña debe tener al menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 32.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 3, 5, 133), // Color del botón
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Registrarse',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'By clicking continue, you agree to our Terms of Service and Privacy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
