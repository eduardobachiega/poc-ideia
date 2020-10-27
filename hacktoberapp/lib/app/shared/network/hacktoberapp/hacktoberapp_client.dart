import 'dart:ffi';

import 'package:hacktoberapp/app/shared/models/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'hacktoberapp_client.g.dart';

@RestApi(baseUrl: "https://hacktoberfestchecker.jenko.me")
abstract class HacktoberappClient {
  factory HacktoberappClient(Dio dio, {String baseUrl}) = _HacktoberappClient;

  @GET("/prs")
  Future<User> getInfo(@Query("username") String username);

}

