import 'package:dio/dio.dart';
import 'package:hacktoberapp/app/shared/network/hacktoberapp/hacktoberapp_api.dart';
import 'package:hacktoberapp/app/shared/repositories/iuser_repository.dart';
import 'package:hacktoberapp/app/shared/repositories/user_repository.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:hacktoberapp/app/app_widget.dart';
import 'package:hacktoberapp/app/modules/home/home_module.dart';

import 'shared/network/api.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        Bind((i) => Dio()),
        Bind((i) => HacktoberappApi()),
        Bind((i) => Api()),
        Bind<IUserRepository>((i) => UserRepository()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
