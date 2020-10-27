import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hacktoberapp/app/shared/widgets/circle_imageview.dart';
import 'package:hacktoberapp/app/shared/widgets/default_button.dart';
import 'package:hacktoberapp/app/shared/widgets/default_input_text.dart';
import 'home_controller.dart';
import 'package:hacktoberapp/app/shared/constants/colors.dart' as AppColors;

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: Column(
        children: <Widget>[
          Container(
            color: AppColors.PRIMARY_COLOR,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Image.asset("hacktober.png"),
            ),
          ),
          Card(
            elevation: 5.0,
            child: Container(
              color: AppColors.PRIMARY_COLOR_DARK,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    DefaultInputText(
                      controller: textEditingController,
                      labelText: "Github user name",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DefaultButton(
                      text: "Verify",
                      minWidth: double.infinity,
                      onPressed: () {
                        controller.getUser(context, textEditingController.text);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Observer(builder: (_) {
                      return Text(
                        controller.user == null
                            ? "0/4"
                            : "${controller.user.prs.length}/4",
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      );
                    }),
                    Observer(
                      builder: (_) {
                        return controller.user == null
                            ? CircleImageView(
                                imagePath: "github.png",
                                height: 100,
                                width: 100,
                              )
                            : CircleImageView(
                                imagePath: controller.user.userImage,
                                height: 100,
                                width: 100,
                                network: true,
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
