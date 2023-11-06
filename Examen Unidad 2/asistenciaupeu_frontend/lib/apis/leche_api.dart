
import 'package:asistenciaupeu_frontend/modelo/LecheModelo.dart';
import 'package:asistenciaupeu_frontend/modelo/GenericModelo.dart';
import 'package:asistenciaupeu_frontend/util/UrlApi.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

part 'leche_api.g.dart';
@RestApi(baseUrl: UrlApi.urlApix)
abstract class LecheApi {
  factory LecheApi(Dio dio, {String baseUrl}) = _LecheApi;

  static LecheApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return LecheApi(dio);
  }

  @GET("/asis/leche/list")
  Future<List<LecheModelo>> getLeche(@Header("Authorization") String token);

  @POST("/asis/leche/crear")
  Future<LecheModelo> crearLeche(@Header("Authorization") String token, @Body() LecheModelo leche);

  @GET("/asis/leche/buscar/{id}")
  Future<LecheModelo> findLeche(@Header("Authorization") String token, @Path("id") int id);

  @DELETE("/asis/leche/eliminar/{id}")
  Future<GenericModelo> deleteLeche(@Header("Authorization") String token, @Path("id") int id);

  @PUT("/asis/leche/editar/{id}")
  Future<LecheModelo> updateLeche(@Header("Authorization") String token, @Path("id") int id , @Body() LecheModelo leche);
}