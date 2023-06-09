// this is the type of button used across the application

import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

Widget button(context,
    {required String text,
    required double top,
    String? navigateTo,
    double? radius,
    Color? buttonColor,
    Color? textColor,
    Function? navigator,
    double? width,
    FontWeight? fontWeight,
    double? right,
    Widget? widget,
    double? height}) {
  return Stack(
    children: [
      rowPositioned(
        child: ButtonWidget(
            navigator ??
                () {
                  // know your customer page
                  Navigator.pushNamed(context, navigateTo ?? '');
                },
            buttonColor ?? blue,
            width ?? 297,
            height ?? 52,
            widget ??
                GeneralTextDisplay(text, textColor ?? white, 1, 16,
                    fontWeight ?? FontWeight.w700, text),
            Alignment.center,
            radius ?? 4),
        top: top,
      )
    ],
  );
}

Widget buttonWidget(
    {required String text,
    required Function onPressed,
    double? width,
    Color? textColor,
    Color? buttonColor,
    Widget? child}) {
  return ButtonWidget(() {
    onPressed();
  },
      buttonColor ?? green,
      width ?? 327,
      52,
      Stack(
        children: [
          Center(
            child: GeneralTextDisplay(
                text, textColor ?? black, 1, 16, FontWeight.w600, "button"),
          ),
          child ?? S()
        ],
      ),
      Alignment.center,
      8);
}
