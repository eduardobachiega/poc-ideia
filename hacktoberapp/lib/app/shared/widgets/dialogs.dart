import 'package:flutter/material.dart';
import 'package:hacktoberapp/app/shared/constants/colors.dart' as AppColors;
import 'default_button.dart';

class Dialogs extends StatelessWidget {
  final VoidCallback positiveButtonOnPressed;
  final VoidCallback negativeButtonOnPressed;
  final dynamic title;
  final dynamic text;
  final dynamic positiveButtonText;
  final dynamic negativeButtonText;
  final Widget complement;
  final double widthDialog;
  final bool positiveButtonCallPop;
  final bool negativeButtonCallPop;

  Dialogs({
    @required this.title,
    @required this.text,
    this.positiveButtonText,
    this.widthDialog,
    this.positiveButtonOnPressed,
    this.complement = const SizedBox(),
    this.negativeButtonText,
    this.negativeButtonOnPressed,
    this.positiveButtonCallPop = true,
    this.negativeButtonCallPop = true
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[_buildHeader(context), _buildBody(context)],
      ),
    );
  }

  Container _buildBody(BuildContext context) {
    var boxDecoration = BoxDecoration(
      color: AppColors.WHITE,
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
    );
    return Container(
      decoration: boxDecoration,
      width: widthDialog,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              (text is String)
                  ? Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.PRIMARY_COLOR, fontSize: 15),
              )
                  : text,
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: complement,
              ),
              (positiveButtonText is String)
                  ? _buildButtons(context)
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    if (negativeButtonText != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _buildNegativeButton(context),
          _buildPositiveButton(context)
        ],
      );
    }
    return _buildPositiveButton(context);
  }

  Widget _buildPositiveButton(BuildContext context) {
    return DefaultButton(
        height: 40,
        text: positiveButtonText,
        onPressed: () {
          if (positiveButtonOnPressed != null) positiveButtonOnPressed();
          if (positiveButtonCallPop) Navigator.pop(context);
        });
  }

  Widget _buildNegativeButton(BuildContext context) {
    return DefaultButton(
        height: 40,
        text: negativeButtonText,
        onPressed: () {
          if (negativeButtonOnPressed != null) negativeButtonOnPressed();
          if (negativeButtonCallPop) Navigator.pop(context);
        });
  }

  Container _buildHeader(BuildContext context) {
    var boxDecoration = BoxDecoration(
      color: AppColors.ACCENT_COLOR,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
    );
    return Container(
      height: 50,
      width: widthDialog,
      decoration: boxDecoration,
      child: Center(
        child: (title is String)
            ? Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.WHITE,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )
            : title,
      ),
    );
  }
}
