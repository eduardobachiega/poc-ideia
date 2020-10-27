import 'package:flutter/cupertino.dart';
import 'package:hacktoberapp/app/shared/models/user.dart';
import 'package:hacktoberapp/app/shared/repositories/iuser_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  IUserRepository repository = Modular.get();

  @observable
  User user;

  @action
  getUser(BuildContext context, String username) async {
    user = await repository.getInfo(context, username);
    print(user);
  }
}
