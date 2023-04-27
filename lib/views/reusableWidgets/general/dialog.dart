import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

Widget customDialog(child,
    {Alignment? align,
    double? x,
    double? y,
    Color? color,
    double? width,
    double? height}) {
  return Align(
    alignment: align ?? Alignment(x!, y!),
    // for y -1 to 1 (from top to bottom)
    // for x -1 to 1 (from left to right)
    child: S(
      h: height ?? 200,
      w: width ?? 300,
      child: Material(
        color: color ?? white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(padding: const EdgeInsets.all(20.0), child: child),
      ),
    ),
  );
}

loadingNoScheduleDialog(BuildContext context,
    {required String text, Color? color, required Function? onWillPop}) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ViewModelBuilder<BaseModel>.reactive(
            viewModelBuilder: () => BaseModel(),
            onModelReady: (model) async {},
            disposeViewModel: false,
            builder: (context, model, child) => WillPopScope(
              onWillPop: () async {
                if (onWillPop == null) {
                  return true;
                } else {
                  return onWillPop();
                }
              },
              child: Center(
                child: customDialog(Center(child: loading()),
                    align: Alignment.center, height: 150, width: 150),
              ),
            ),
          ));
}

// loading dialog
loadingDialog(BuildContext context,
    {required String text,
    Color? color,
    Function? onWillPop,
    int? height,
    int? width}) async {
  return SchedulerBinding.instance?.addPostFrameCallback(
    (_) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => ViewModelBuilder<BaseModel>.reactive(
              viewModelBuilder: () => BaseModel(),
              onModelReady: (model) async {},
              disposeViewModel: false,
              builder: (context, model, child) => WillPopScope(
                onWillPop: () async {
                  if (onWillPop == null) {
                    return true;
                  } else {
                    return onWillPop();
                  }
                },
                child: Center(
                  child: customDialog(Center(child: loading()),
                      align: Alignment.center,
                      height: 150,
                      width: 150,
                      color: color),
                ),
              ),
            )),
  );
}

// dialog with close
loaderWithClose(BuildContext context,
    {required String text,
    String? buttonText,
    IconData? icon,
    Function? onTap,
    Function? retry,
    Color? iconColor}) {
  return SchedulerBinding.instance?.addPostFrameCallback(
    (_) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Center(
        child: S(
          h: 220,
          w: 250,
          child: customDialog(
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GeneralIconDisplay(
                      icon ?? Icons.error, iconColor ?? red, UniqueKey(), 50),
                  S(h: 20),
                  GeneralTextDisplay(
                    text,
                    blue,
                    6,
                    14,
                    FontWeight.w500,
                    "",
                    textAlign: TextAlign.center,
                  ),
                  S(h: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (retry != null) const Spacer(),
                      // retry
                      if (retry != null)
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            retry();
                          },
                          child: GeneralTextDisplay(
                            buttonText ?? "Retry",
                            blue.withOpacity(0.6),
                            1,
                            14.5,
                            FontWeight.w500,
                            "retry",
                          ),
                        ),
                      if (retry != null) const Spacer(),
                      // close
                      GestureDetector(
                        onTap: () {
                          onTap == null
                              ? {
                                  Navigator.pop(context),
                                  if (retry != null) Navigator.pop(context)
                                }
                              : onTap();
                        },
                        child: GeneralTextDisplay(
                          buttonText ?? "close",
                          blue.withOpacity(0.4),
                          3,
                          14,
                          FontWeight.w400,
                          "",
                        ),
                      ),
                      if (retry != null) const Spacer(),
                    ],
                  )
                ],
              ),
              align: Alignment.center),
        ),
      ),
    ),
  );
}

// close dialog with no scheduler
loaderWithCloseNoScheduler(BuildContext context,
    {required String text,
    String? buttonText,
    IconData? icon,
    Function? onTap,
    Color? iconColor}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Center(
      child: S(
        h: 220,
        w: 250,
        child: customDialog(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GeneralIconDisplay(
                    icon ?? Icons.error, iconColor ?? red, UniqueKey(), 50),
                S(h: 20),
                GeneralTextDisplay(
                  text,
                  blue,
                  6,
                  14,
                  FontWeight.w500,
                  "",
                  textAlign: TextAlign.center,
                ),
                S(h: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onTap == null ? Navigator.pop(context) : onTap();
                      },
                      child: GeneralTextDisplay(
                        buttonText ?? "close",
                        blue.withOpacity(0.4),
                        3,
                        14,
                        FontWeight.w400,
                        "",
                      ),
                    ),
                  ],
                )
              ],
            ),
            align: Alignment.center),
      ),
    ),
  );
}

// loading animation i was using before
// AnimatedContainer(
//                             width: sS(context).cW(width: (model.seconds * 50)),
//                             height: sS(context).cH(height: model.seconds * 50),
//                             child: SvgPicture.asset("assets/splash.svg",
//                                 semanticsLabel: 'Splash Screen'),
//                             duration: const Duration(seconds: 5))
