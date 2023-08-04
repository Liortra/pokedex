import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon/data/source/pokemon/api/pokemon_api.dart';
import 'package:pokemon/utils/config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

class NetBindingModule {
  static providesModules() {
    _provideDio();
    _providePokemonApi();
  }

  static void _provideDio() {
    GetIt.I.registerFactory(() {
      final dio = Dio();
      if (kDebugMode) dio.interceptors.add(PrettyDioLogger(requestBody: true));
      dio.options.baseUrl = Config.baseUrl;
      // dio.interceptors.add(ErrorHttpInterceptor());
      return dio;
    });
  }

  static void _providePokemonApi() =>
      GetIt.I.registerFactory(() => PokemonApi(GetIt.I.get()));
}

