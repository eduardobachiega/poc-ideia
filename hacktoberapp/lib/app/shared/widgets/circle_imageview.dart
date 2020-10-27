import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hacktoberapp/app/shared/constants/colors.dart' as AppColors;

class CircleImageView extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;
  final BoxFit fit;
  final bool network;
  final Color backgroundColor;
  final VoidCallback onTap;
  final File file;
  final IconData icon;

  CircleImageView({
    this.imagePath,
    this.width = 200,
    this.height = 200,
    this.fit = BoxFit.fitHeight,
    this.network = false,
    this.backgroundColor = AppColors.TRANSPARENT,
    this.onTap,
    this.file,
    this.icon
  });

  @override
  _CircleImageViewPageState createState() => new _CircleImageViewPageState();
}

class _CircleImageViewPageState extends State<CircleImageView> {
  @override
  Widget build(BuildContext context) {
    Image image;
    if (widget.icon == null) {
      if (widget.imagePath != null) {
        if (widget.network)
          image = Image.network(widget.imagePath);
        else
          image = Image.asset(widget.imagePath);
      } else if (widget.file != null) {
        image = Image.file(widget.file);
      }
    }

    return new InkWell(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: image != null
            ? new BoxDecoration(
          color: widget.backgroundColor,
          shape: BoxShape.circle,
          image: new DecorationImage(
            fit: widget.fit,
            image: image.image,
          ),
        )
            : BoxDecoration(
          color: widget.backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(widget.icon),
      ),
    );
  }
}
