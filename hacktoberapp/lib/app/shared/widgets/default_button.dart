import 'package:flutter/material.dart';
import 'package:hacktoberapp/app/shared/constants/colors.dart' as AppColors;

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double minWidth;
  final bool enabled;

  const DefaultButton(
      {Key key,
        this.text,
        this.height = 60.0,
        this.onPressed,
        this.enabled = true,
        this.minWidth = 10})
      : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: enabled
                      ? AppColors.ACCENT_COLOR
                      : AppColors.DISABLED_BUTTON_COLOR,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                ),
              ]),
          child: ButtonTheme(
            height: height,
            minWidth: minWidth,
            child: FlatButton(
              onPressed: () {
                if (enabled) onPressed();
              },
              child: Text(
                text,
                style: TextStyle(
                    color: AppColors.PRIMARY_COLOR_DARK,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ));
  }
}
