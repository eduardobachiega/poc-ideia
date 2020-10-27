import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hacktoberapp/app/shared/widgets/dialogs.dart';

class RequestManager {
  static Future<T> loadingRequest<T>(
      BuildContext context, Future<T> request) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: Container(
              child: SpinKitChasingDots(
                size: 75.0,
                color: Theme.of(context).accentColor,
                duration: Duration(milliseconds: 1500),
              ),
              color: Colors.transparent,
            ),
          );
        });

    request.whenComplete(() {
      Navigator.of(context, rootNavigator: true).pop();
    }).catchError((Object obj) {
      String error = "Unknown error";
      bool activeUser = true;

      switch (obj.runtimeType) {
        case DioError:
          final dioError = obj as DioError;

          if (dioError.error != null)
            if (dioError.error is String)
              error = dioError.error;

          final res = dioError.response;
          if (res != null) {
            if (res.statusCode == 401) error = "Invalid credentials";
          }

          break;
        default:
      }

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Dialogs(
              widthDialog: 700.0,
              title: "An error occurred",
              text: error,
              positiveButtonText: "OK",
              positiveButtonCallPop: activeUser,
              positiveButtonOnPressed: () {
              },
            );
          });

      print("ERROR: $obj");
    });

    return request;
  }
}
