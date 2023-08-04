// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _PokemonApi implements PokemonApi {
  _PokemonApi(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Pokemon> getPokemonByName(name) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Pokemon>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${name}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Pokemon.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Result> getAllPokemon() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Result>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '?limit=1200',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Result.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
