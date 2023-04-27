// this is a general back button for the pages
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

Widget backButton(context,
    {double top = 28,
    double left = 17,
    Color? color,
    Color? arrowColor,
    double? size,
    String? navigateTo}) {
  return Stack(
    children: [
      AdaptivePositioned(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: sS(context).cH(height: size ?? 40),
                width: sS(context).cW(width: size ?? 40),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color ?? blue.withOpacity(0.1)),
                child: GeneralIconDisplay(
                    LineIcons.arrowLeft, arrowColor ?? blue, UniqueKey(), 20),
              ),
            ),
          ],
        ),
        top: top,
        left: left,
      ),
    ],
  );
}
