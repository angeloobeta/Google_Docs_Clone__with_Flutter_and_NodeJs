// this textField is for otp textField
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class PinTextField extends StatelessWidget {
  final TextInputType keyInputType;
  final TextEditingController textFieldController;
  final int textFieldLineSpan;
  final String textFieldLabel;
  final String textFieldHint;
  final dynamic functionValue;
  final double height;
  final double width;
  final Color containerColor;
  final bool greyBackground;
  final FocusNode focus;
  final Function onFieldSubmitted;
  final int maxIndex;
  final bool? errorTextActive;

  const PinTextField(
      this.keyInputType,
      this.textFieldController,
      this.textFieldLabel,
      this.textFieldHint,
      this.functionValue,
      this.textFieldLineSpan,
      this.height,
      this.width,
      this.containerColor,
      this.greyBackground,
      this.focus,
      this.onFieldSubmitted,
      this.maxIndex,
      {this.errorTextActive});

  @override
  Widget build(BuildContext context) {
    Size dynamicSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      height: sS(context).cH(height: height),
      width: sS(context).cW(width: width),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height * (4 / 800)),
      ),
      alignment: Alignment.center,
      child: Align(
        alignment: Alignment.center,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.bottom,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
          cursorColor: blue,
          keyboardType: keyInputType,
          controller: textFieldController,
          maxLines: textFieldLineSpan,
          focusNode: focus,
          textInputAction:
              maxIndex == 4 ? TextInputAction.done : TextInputAction.done,
          onChanged: (change) {
            onFieldSubmitted();
          },
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: blue,
                  fontSize: orientation == Orientation.portrait
                      ? sS(context).cH(height: 30)
                      : dynamicSize.width * (16 / 800),
                  fontWeight: FontWeight.w500)),
          autocorrect: true,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: textFieldLabel,
              hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.height * (30 / 800)
                          : dynamicSize.width * (16 / 800),
                      color: blue,
                      fontWeight: FontWeight.w500)),
              hintText: textFieldHint,
              labelStyle: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontSize: orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.height * (15 / 800)
                          : dynamicSize.width * (16 / 800),
                      color: const Color.fromRGBO(186, 186, 186, 1.0),
                      fontWeight: FontWeight.w500)),
              contentPadding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * (15 / 360),
                  MediaQuery.of(context).size.height * (5 / 800),
                  MediaQuery.of(context).size.width * (2 / 360),
                  MediaQuery.of(context).size.height * (5 / 800)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: grey, width: 1.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(
                    orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height * (4 / 800)
                        : dynamicSize.width * (4 / 800),
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: errorTextActive == true ? red : blue,
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(
                    orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height * (4 / 800)
                        : dynamicSize.width * (4 / 800),
                  ))),
        ),
      ),
    );
  }
}

class FormattedTextFields extends StatelessWidget {
  final TextInputType keyInputType;
  final TextEditingController textFieldController;
  final int? textFieldLineSpan, maxLength;
  final String textFieldLabel, textFieldHint;
  final double height, width, textFont, hintFont, labelFont, borderRadius;
  final Color containerColor,
      cursorColor,
      hintColor,
      labelColor,
      outLineBorderColor,
      focusBorderColor;
  final bool? noBorder, autoFocus, obscureText, readOnly;
  final Function? onChangedFunction, onTap;
  final List<TextInputFormatter> inputFormatters;
  final bool errorTextActive;
  final FocusNode? focusNode;
  final Widget? prefixIcon, suffixIcon;
  final Widget? prefix;
  final FontWeight textFontWeight, hintFontWeight, labelFontWeight;
  final FloatingLabelBehavior? labelBehaviour;
  final Alignment? align;

  const FormattedTextFields(
      {required this.keyInputType,
      required this.textFieldController,
      required this.textFieldLabel,
      required this.textFieldHint,
      required this.textFieldLineSpan,
      required this.height,
      required this.width,
      required this.containerColor,
      required this.noBorder,
      required this.autoFocus,
      required this.inputFormatters,
      required this.onChangedFunction,
      required this.errorTextActive,
      required this.focusNode,
      required this.prefixIcon,
      required this.prefix,
      required this.suffixIcon,
      required this.textFont,
      required this.hintFont,
      required this.labelFont,
      required this.borderRadius,
      required this.cursorColor,
      required this.hintColor,
      required this.labelColor,
      required this.outLineBorderColor,
      required this.focusBorderColor,
      required this.textFontWeight,
      required this.hintFontWeight,
      required this.labelFontWeight,
      this.obscureText,
      this.labelBehaviour,
      this.maxLength,
      this.align,
      this.onTap,
      this.readOnly,
      required EdgeInsets contentPadding,
      required bool enabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sS(context).cH(height: height),
      width: sS(context).cW(width: width),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height * (borderRadius / 800)),
      ),
      alignment: align ?? Alignment.center,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.bottom,
        focusNode: focusNode,
        onTap: () {
          if (onTap != null) onTap!();
        },
        onChanged: (changed) {
          onChangedFunction!();
        }, // this function to validate the
        // text field as the user types in it
        autofocus: autoFocus!,
        enabled: readOnly ?? true,
        cursorColor: cursorColor,
        textInputAction: TextInputAction.done,
        keyboardType: keyInputType,
        obscureText: obscureText ?? false,
        controller: textFieldController,
        maxLines: textFieldLineSpan,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        style: GoogleFonts.montserrat(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: textFont,
                fontWeight: textFontWeight)),
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefix: prefix,
            labelText: textFieldLabel,
            hintStyle: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: sS(context).cH(height: hintFont),
                    color: hintColor,
                    fontWeight: hintFontWeight)),
            hintText: textFieldHint,
            floatingLabelBehavior: labelBehaviour ?? FloatingLabelBehavior.auto,
            labelStyle: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: sS(context).cH(height: labelFont),
                    color: labelColor,
                    fontWeight: labelFontWeight)),
            disabledBorder: OutlineInputBorder(
                borderSide: noBorder == true
                    ? BorderSide.none
                    : BorderSide(
                        color: outLineBorderColor,
                        width: 1.0,
                        style: noBorder == true
                            ? BorderStyle.none
                            : BorderStyle.solid),
                borderRadius:
                    BorderRadius.circular(sS(context).cW(width: borderRadius))),
            enabledBorder: OutlineInputBorder(
                borderSide: noBorder == true
                    ? BorderSide.none
                    : BorderSide(
                        color: outLineBorderColor,
                        width: 1.0,
                        style: noBorder == true
                            ? BorderStyle.none
                            : BorderStyle.solid),
                borderRadius:
                    BorderRadius.circular(sS(context).cW(width: borderRadius))),
            focusedBorder: OutlineInputBorder(
                borderSide: noBorder == true
                    ? BorderSide.none
                    : BorderSide(
                        color: errorTextActive == true ? red : focusBorderColor,
                        width: 1.0,
                        style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(
                    sS(context).cW(width: borderRadius)))),
      ),
    );
  }
}
