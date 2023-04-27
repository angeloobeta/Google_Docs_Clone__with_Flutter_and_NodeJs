// page tab

import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

Widget pageTab(context, {double? top, TabEnum? tabEnum}) {
  return Positioned(
    child: Center(
      child: Container(
        width: sS(context).cW(width: 375),
        height: sS(context).cH(height: 65),
        decoration: BoxDecoration(color: white, boxShadow: [
          BoxShadow(
              offset: const Offset(15, 0),
              blurRadius: 12,
              color: black.withOpacity(0.15))
        ]),
        child: Stack(
          children: [
            // home page
            tabWidget(context,
                image:
                    tabEnum == TabEnum.home ? "homeSelected" : "homeUnselected",
                isSelected: tabEnum == TabEnum.home ? true : false,
                left: 26,
                navigation: tabEnum == TabEnum.home
                    ? () {}
                    : () {
                        Navigator.pushNamed(context, "oldUser");
                      }),
            // wallet page
            tabWidget(context,
                image: tabEnum == TabEnum.wallet
                    ? "walletSelected"
                    : "walletUnselected",
                isSelected: tabEnum == TabEnum.wallet ? true : false,
                left: 99,
                navigation: tabEnum == TabEnum.wallet
                    ? () {}
                    : () {
                        Navigator.pushNamed(context, "walletTabPage");
                      }),
            // circle page
            tabWidget(context,
                image: tabEnum == TabEnum.circles
                    ? "circleSelected"
                    : "circleUnselected",
                isSelected: tabEnum == TabEnum.circles ? true : false,
                left: 172,
                navigation: tabEnum == TabEnum.circles
                    ? () {}
                    : () {
                        Navigator.pushNamed(context, "circleHomePage");
                      }),
            // chat page
            tabWidget(context,
                image: tabEnum == TabEnum.chats
                    ? "chatSelected"
                    : "chatUnselected",
                isSelected: tabEnum == TabEnum.chats ? true : false,
                right: 100,
                navigation: tabEnum == TabEnum.chats
                    ? () {}
                    : () {
                        Navigator.pushNamed(context, "chatHomePage",
                            arguments: false);
                      }),
            // profile page
            rowPositioned(
                child: GestureDetector(
                  onTap: () {
                    tabEnum == TabEnum.profile
                        ? () {}
                        : Navigator.pushNamed(context, "profileHomePage");
                  },
                  child: Column(
                    children: [
                      // home paget(assetName)
                      tabEnum != TabEnum.profile
                          ? SvgPicture.asset("assets/profileUnselected.svg")
                          : Column(
                              children: [
                                SvgPicture.asset("assets/profileSelected.svg"),
                                S(h: 2),
                                GeneralTextDisplay(
                                    "Profile",
                                    const Color.fromRGBO(5, 16, 112, 1),
                                    1,
                                    9,
                                    FontWeight.w600,
                                    ""),
                                S(h: 2),
                              ],
                            ),
                      // indicator

                      if (tabEnum == TabEnum.profile)
                        Container(
                            width: sS(context).cW(width: 8),
                            height: sS(context).cH(height: 8),
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(5, 16, 112, 1),
                                shape: BoxShape.circle))
                    ],
                  ),
                ),
                top: 11,
                right: 25),
          ],
        ),
      ),
    ),
    bottom: sS(context).cH(height: 0),
  );
}

Widget tabWidget(context,
    {required String image,
    required bool isSelected,
    double? left,
    double? right,
    Function? navigation}) {
  return Stack(
    children: [
      rowPositioned(
          child: GestureDetector(
            onTap: () {
              navigation!();
            },
            child: Column(
              children: [
                // home page
                SvgPicture.asset("assets/$image.svg"),
                // indicator
                if (isSelected)
                  Container(
                      width: sS(context).cW(width: 8),
                      height: sS(context).cH(height: 8),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(5, 16, 112, 1),
                          shape: BoxShape.circle))
              ],
            ),
          ),
          top: 11,
          left: left,
          right: right),
    ],
  );
}
