import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final dynamic onPressed;
  final dynamic color;
  final double width;
  final double height;
  final Widget child;
  final Alignment align;
  final double radius;
  final FocusNode? focusNode;
  final double? noElevation;

  ButtonWidget(this.onPressed, this.color, this.width, this.height, this.child,
      this.align, this.radius,{this.focusNode,this.noElevation});

  @override
  Widget build(BuildContext context) {
    Size dynamicSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return ElevatedButton(
      focusNode: focusNode ?? FocusNode(),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: color,
            elevation:noElevation?? 4.0,
            alignment: align,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular( dynamicSize.height * (radius / 800)),
            ),
            fixedSize: Size(
                orientation == Orientation.portrait
                    ? dynamicSize.width * (width / 360)
                    : dynamicSize.height * (width / 360),
                orientation == Orientation.landscape
                    ? dynamicSize.width * (height / 800)
                    : dynamicSize.height * (height / 800))),
        child: child);
  }
}
