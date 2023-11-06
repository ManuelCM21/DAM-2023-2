// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LecheModelo {
  LecheModelo({
    required this.id,
    required this.fecha,
    required this.litrosLeche,
    required this.turno,
    required this.finca,
    required this.ganado,
  });

  LecheModelo.unlaunched();

  late final int id;
  late final String fecha;
  late final String litrosLeche;
  late final String turno;
  late final String finca;
  late final String ganado;
  
  LecheModelo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fecha = json['fecha'];
    litrosLeche = json['litrosLeche'];
    turno = json['turno'];
    finca = json['finca'];
    ganado = json['ganado'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fecha'] = fecha;
    _data['litrosLeche'] = litrosLeche;
    _data['turno'] = turno;
    _data['finca'] = finca;
    _data['ganado'] = ganado;
    return _data;
  }
}

class RespUsuarioModelo {
  RespUsuarioModelo({
    required this.id,
    required this.fecha,
    required this.litrosLeche,
    required this.turno,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.finca,
    required this.ganado,
  });
  late final int id;
  late final String fecha;
  late final String litrosLeche;
  late final String turno;
  late final String fechaCreacion;
  late final String fechaActualizacion;
  late final String finca;
  late final String ganado;
  
  RespUsuarioModelo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fecha = json['fecha'];
    litrosLeche = json['litrosLeche'];
    turno = json['turno'];
    fechaCreacion = json['fechaCreacion'];
    fechaActualizacion = json['fechaActualizacion'];
    finca = json['finca'];
    ganado = json['ganado'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fecha'] = fecha;
    _data['litrosLeche'] = litrosLeche;
    _data['turno'] = turno;
    _data['fechaCreacion'] = fechaCreacion;
    _data['fechaActualizacion'] = fechaActualizacion;
    _data['finca'] = finca;
    _data['ganado'] = ganado;
    return _data;
  }
}