import 'package:flutter/material.dart';
import 'route_model.dart';

import 'map_screen.dart'; // Importamos la nueva pantalla del mapa

class NewRouteInfoPage extends StatefulWidget {
  final String routeName;

  const NewRouteInfoPage({Key? key, required this.routeName}) : super(key: key);

  @override
  _NewRouteInfoPageState createState() => _NewRouteInfoPageState();
}

class _NewRouteInfoPageState extends State<NewRouteInfoPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  TextEditingController _idEstudianteController = TextEditingController();
  TextEditingController _idEstudianteCController = TextEditingController();
  TextEditingController _idVehiculoController = TextEditingController();
  TextEditingController _fechaHoraSalidaController = TextEditingController();
  TextEditingController _asientosDisponiblesController = TextEditingController();
  TextEditingController _costoController = TextEditingController();
  TextEditingController _statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de la Nueva Ruta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Creando una nueva ruta llamada:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.routeName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _originController,
                  decoration: InputDecoration(
                    labelText: 'Origen',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el origen de la ruta';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _destinationController,
                  decoration: InputDecoration(
                    labelText: 'Destino',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el destino de la ruta';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _idEstudianteController,
                  decoration: InputDecoration(
                    labelText: 'ID Estudiante',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el ID del estudiante';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _idEstudianteCController,
                  decoration: InputDecoration(
                    labelText: 'ID Estudiante C',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el ID del estudiante C';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _idVehiculoController,
                  decoration: InputDecoration(
                    labelText: 'ID Vehículo',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el ID del vehículo';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _fechaHoraSalidaController,
                  decoration: InputDecoration(
                    labelText: 'Fecha y Hora de Salida',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa la fecha y hora de salida';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _asientosDisponiblesController,
                  decoration: InputDecoration(
                    labelText: 'Asientos Disponibles',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa la cantidad de asientos disponibles';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _costoController,
                  decoration: InputDecoration(
                    labelText: 'Costo',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el costo';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _statusController,
                  decoration: InputDecoration(
                    labelText: 'Status',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el estado del viaje';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Crear un nuevo RouteModel con los datos del formulario
                      final newRoute = RouteModel(
                        idViaje: DateTime.now().millisecondsSinceEpoch, // ID temporal
                        idEstudiante: int.parse(_idEstudianteController.text),
                        idEstudianteC: int.parse(_idEstudianteCController.text),
                        idVehiculo: int.parse(_idVehiculoController.text),
                        fechaHoraSalida: DateTime.parse(_fechaHoraSalidaController.text),
                        asientosDisponibles: int.parse(_asientosDisponiblesController.text),
                        costo: _costoController.text,
                        status: _statusController.text,
                      );
                      Navigator.pop(context, newRoute);
                      _showSuccessDialog(context);
                    }
                  },
                  child: Text('Confirmar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Éxito'),
          content: Text('La nueva ruta ha sido creada exitosamente.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapScreen(), // Dirige al usuario a la nueva pantalla del mapa
                  ),
                );
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
