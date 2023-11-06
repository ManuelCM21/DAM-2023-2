import 'package:asistenciaupeu_frontend/apis/actividad_api.dart';
import 'package:asistenciaupeu_frontend/modelo/ActividadModelo.dart';
import 'package:asistenciaupeu_frontend/modelo/GenericModelo.dart';
import 'package:asistenciaupeu_frontend/util/TokenUtil.dart';
import 'package:dio/dio.dart';
class ActividadRepository {
  ActividadApi? actividadApi;

  ActividadRepository() {
    Dio _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/json";
    actividadApi = ActividadApi(_dio);
  }

  Future<List<ActividadModelo>> getActividad() async {
    var dato = await actividadApi!.getActividad(TokenUtil.TOKEN).then((
        value) => value);
    return await dato;
  }

  Future<GenericModelo> deleteActividad(int id) async {
    return await actividadApi!.deleteActividad(TokenUtil.TOKEN, id);
  }

  Future<ActividadModelo> updateActividad(int id,
      ActividadModelo actividad) async {
    return await actividadApi!.updateActividad(TokenUtil.TOKEN, id, actividad);
  }

  Future<ActividadModelo> createActividad(ActividadModelo actividad) async {
    return await actividadApi!.crearActividad(TokenUtil.TOKEN, actividad);
  }
}