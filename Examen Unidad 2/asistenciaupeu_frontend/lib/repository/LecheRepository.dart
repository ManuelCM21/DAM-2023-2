import 'package:asistenciaupeu_frontend/apis/leche_api.dart';
import 'package:asistenciaupeu_frontend/modelo/LecheModelo.dart';
import 'package:asistenciaupeu_frontend/modelo/GenericModelo.dart';
import 'package:asistenciaupeu_frontend/util/TokenUtil.dart';
import 'package:dio/dio.dart';

class LecheRepository {
  LecheApi? lecheApi;

  LecheRepository() {
    Dio _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/json";
    lecheApi = LecheApi(_dio);
  }

  Future<List<LecheModelo>> getLeche() async {
    var dato = await lecheApi!.getLeche(TokenUtil.TOKEN).then((
        value) => value);
    return await dato;
  }

  Future<GenericModelo> deleteLeche(int id) async {
    return await lecheApi!.deleteLeche(TokenUtil.TOKEN, id);
  }

  Future<LecheModelo> updateLeche(int id,
      LecheModelo leche) async {
    return await lecheApi!.updateLeche(TokenUtil.TOKEN, id, leche);
  }

  Future<LecheModelo> createLeche(LecheModelo leche) async {
    return await lecheApi!.crearLeche(TokenUtil.TOKEN, leche);
  }
}