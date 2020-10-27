import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hacktoberapp/app/shared/models/user.dart';

import '../network/api.dart';
import '../network/request_manager.dart';
import 'iuser_repository.dart';

class UserRepository implements IUserRepository {
  final Api _api = Modular.get();

  @override
  Future<User> getInfo(BuildContext context, String username) async =>
      RequestManager.loadingRequest(
          context, _api.hacktoberapp.getInfo(username));
}
