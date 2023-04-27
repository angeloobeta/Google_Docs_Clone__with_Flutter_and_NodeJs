import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class BaseUi extends StatelessWidget {
  final List<Widget> children;
  final FloatingActionButton? floatingActionButton;
  final AppBar? appBar;
  final bool? allowBackButton;
  final bool? safeTop;
  final Function? onRefreshFunction;

  const BaseUi(
      {Key? key,
      this.allowBackButton,
      required this.children,
      this.floatingActionButton,
      this.appBar,
      this.safeTop,
      this.onRefreshFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
        viewModelBuilder: () => BaseModel(),
        onModelReady: (model) async {},
        disposeViewModel: false,
        builder: (context, model, child) => WillPopScope(
            onWillPop: () async {
              return allowBackButton ?? true;
            },
            child: KeyboardDismisser(
              gestures: const [
                GestureType.onTap,
                // GestureType.onPanUpdateDownDirection
              ],
              child: RefreshIndicator(
                displacement: 100,
                backgroundColor: blue,
                color: white,
                strokeWidth: 3,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                onRefresh: () async {
                  if (onRefreshFunction != null) {
                    return onRefreshFunction!();
                  }
                },
                child: Scaffold(
                  appBar: appBar,
                  body: SafeArea(
                    bottom: false,
                    top: safeTop ?? false,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: white,
                      child: Stack(
                        children: children,
                      ),
                    ),
                  ),
                  floatingActionButton: floatingActionButton,
                ),
              ),
            )));
  }
}
