class RouteModel {
  final int idViaje;
  final int idEstudiante;
  final int idEstudianteC;
  final int idVehiculo;
  final DateTime fechaHoraSalida;
  final int asientosDisponibles;
  final String costo;
  final String status;

  RouteModel({
    required this.idViaje,
    required this.idEstudiante,
    required this.idEstudianteC,
    required this.idVehiculo,
    required this.fechaHoraSalida,
    required this.asientosDisponibles,
    required this.costo,
    required this.status,
  });

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      idViaje: json['id_viaje'],
      idEstudiante: json['id_estudiante'],
      idEstudianteC: json['id_estudiante_c'],
      idVehiculo: json['id_vehiculo'],
      fechaHoraSalida: DateTime.parse(json['fecha_hora_salida']),
      asientosDisponibles: json['asientos_disponibles'],
      costo: json['costo'],
      status: json['status'],
    );
  }
}
