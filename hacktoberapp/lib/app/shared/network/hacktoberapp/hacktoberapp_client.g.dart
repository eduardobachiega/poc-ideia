// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hacktoberapp_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _HacktoberappClient implements HacktoberappClient {
  _HacktoberappClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://hacktoberfestchecker.jenko.me';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<User> getInfo(username) async {
    ArgumentError.checkNotNull(username, 'username');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'username': username};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/prs',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = User.fromJson(_result.data);
    return value;
  }
}
