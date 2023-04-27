import '../../../model/utilities/imports/generalImport.dart';

Widget imageAvatar(context, {String? image}) {
  return Container(
    key: UniqueKey(),
    width: sS(context).cW(width: 32),
    height: sS(context).cH(height: 32),
    decoration: BoxDecoration(shape: BoxShape.circle),
    alignment: Alignment.center,
    child: Image.asset(image ?? "images/image_avatar.png"),
  );
}
