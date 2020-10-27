import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hacktoberapp/app/shared/models/user.dart';
import 'package:hacktoberapp/app/shared/network/hacktoberapp/hacktoberapp_client.dart';

class HacktoberappApi {
  HacktoberappClient _client;
  Dio _dio = Modular.get();

  HacktoberappApi() {
    _client = HacktoberappClient(_dio);
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<User> getInfo(String username) async {
    final response = await _client.getInfo(username);
    return Future.value(response);
  }

}
