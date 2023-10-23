
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ActividadModelo {
  ActividadModelo({
    required this.id,
    required this.nombreActividad,
    required this.fecha,
    required this.horai,
    required this.minToler,
    required this.latitud,
    required this.longitud,
    required this.estado,
    required this.evaluar,
    required this.userCreate,
    required this.mater,
    required this.validInsc,
    required this.asisSubact,
    required this.entsal,
    required this.offlinex,
  });

  ActividadModelo.unlaunched();

  late  int id=0;
  late final String nombreActividad;
  late final String fecha;
  late final String horai;
  late final String minToler;
  late final String latitud;
  late final String longitud;
  late final String estado;
  late final String evaluar;
  late final String userCreate;
  late final String mater;
  late final String validInsc;
  late final String asisSubact;
  late final String entsal;
  late final String offlinex;

  factory ActividadModelo.fromJson(Map<String, dynamic> json){
   return ActividadModelo(
       id : json['id'],
       nombreActividad : json['nombreActividad'],
       fecha : json['fecha'],
       horai : json['horai'],
       minToler : json['minToler'],
       latitud : json['latitud'],
       longitud : json['longitud'],
       estado : json['estado'],
       evaluar : json['evaluar'],
       userCreate : json['userCreate'],
       mater : json['mater'],
       validInsc : json['validInsc'],
       asisSubact : json['asisSubact'],
       entsal : json['entsal'],
       offlinex : json['offlinex'],
   );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombreActividad'] = nombreActividad;
    _data['fecha'] = fecha;
    _data['horai'] = horai;
    _data['minToler'] = minToler;
    _data['latitud'] = latitud;
    _data['longitud'] = longitud;
    _data['estado'] = estado;
    _data['evaluar'] = evaluar;
    _data['userCreate'] = userCreate;
    _data['mater'] = mater;
    _data['validInsc'] = validInsc;
    _data['asisSubact'] = asisSubact;
    _data['entsal'] = entsal;
    _data['offlinex'] = offlinex;
    return _data;
  }
}