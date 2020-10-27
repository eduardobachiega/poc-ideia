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

  _handleSuccessResponse(Response response) {
    if (response == null) return null;
    var data = response.data["data"];
    var error = response.data["error"];
    var msg = response.data["message"];

    if (data == null && error != null && msg != null) {
      throw msg;
    }
  }

  Future<User> getInfo(String username) async {
    final response = await _client.getInfo(username);
    return Future.value(response);
  }

}
