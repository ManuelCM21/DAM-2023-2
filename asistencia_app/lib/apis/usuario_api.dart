import 'package:asistencia_app/modelo/UsuarioModelo.dart';
import 'package:asistencia_app/util/UrlApi.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

part 'usuario_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class UsuarioaApi {
  factory UsuarioaApi(Dio dio, {String baseUrl}) = _UsuarioaApi;
  static UsuarioaApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return UsuarioaApi(dio);
  }

  @POST("/asis/login")
  Future<RespUsuarioModelo> login(@Body() UsuarioModelo usuario);
}
