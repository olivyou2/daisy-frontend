import 'package:daisy_frontend/page/main/widgets/molecule/course/courseSheet.dart';
import 'package:daisy_frontend/page/main/widgets/molecule/path/pathSheet.dart';
import 'package:daisy_frontend/page/main/widgets/molecule/path/pathSheetIndicator.dart';
import 'package:daisy_frontend/util/remoteActivator.dart';
import 'package:flutter/material.dart';

import '../../atom/map.dart';
import 'mapTopIndicator.dart';

class MapPlaceController extends ChangeNotifier {
  late PathUnit? path;
  late bool placeOpened = false;

  setPath(PathUnit path) {
    this.path = path;
    this.placeOpened = true;

    notifyListeners();
  }

  setEmpty() {
    this.path = null;
    this.placeOpened = false;

    notifyListeners();
  }
}

class MapSheetController extends RemoteActivator {
  attach() {
    activate("attach");
  }

  deattach() {
    activate("deattach");
  }

  close() {
    activate("close");
  }
}

class MapMenuController extends ChangeNotifier {
  int menuState = 0;

  setMenu(int menu) {
    menuState = menu;
    notifyListeners();
  }
}

class MapSheet extends StatefulWidget {
  const MapSheet({super.key});

  @override
  State<MapSheet> createState() => _MapSheetState();
}

class _MapSheetState extends State<MapSheet> {
  static double middleScrollPosition = (844 - 58) / 844;
  static double initScrollPosition = 0.05;
  static double attachedScrollPosition = 1;

  List<double> defaultSnap = [initScrollPosition, middleScrollPosition];
  List<double> maximizeSnap = [attachedScrollPosition];

  bool animationDone = true;

  DraggableScrollableController controller = DraggableScrollableController();
  CourseSheetController courseSheetController = CourseSheetController();

  MapMenuController mapMenuController = MapMenuController();
  MapSheetController mapSheetController = MapSheetController();
  MapPlaceController mapPlaceController = MapPlaceController();

  bool maximized = false;

  _attach() {
    setState(() {
      maximized = true;
      animationDone = false;

      courseSheetController.open();

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        controller
            .animateTo(attachedScrollPosition,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut)
            .then((value) {
          setState(() {
            animationDone = true;
          });
        });
      });
    });
  }

  _deattach() {
    setState(() {
      maximized = false;
      animationDone = false;

      courseSheetController.close();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        controller
            .animateTo(middleScrollPosition,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut)
            .then((value) {
          setState(() {
            animationDone = true;
          });
        });
      });
    });
  }

  _close() {
    setState(() {
      maximized = false;
      animationDone = false;

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        controller
            .animateTo(initScrollPosition,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut)
            .then((value) {
          setState(() {
            animationDone = true;
          });
        });
      });
    });
  }

  _debugAttach() {
    setState(() {
      if (maximized) {
        _deattach();
      } else {
        _attach();
      }
    });
  }

  @override
  void initState() {
    super.initState();

    mapMenuController.addListener(() {
      setState(() {});
    });

    mapSheetController.listen("close", () {
      _close();
    });

    mapSheetController.listen("deattach", () {
      _deattach();
    });

    mapPlaceController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    List<double> snaps = maximized ? maximizeSnap : defaultSnap;

    double maxChildSize = animationDone
        ? (maximized
            ? _MapSheetState.attachedScrollPosition
            : _MapSheetState.middleScrollPosition)
        : _MapSheetState.attachedScrollPosition;

    double minChildSize = (maximized && animationDone)
        ? maxChildSize
        : _MapSheetState.initScrollPosition;

    double initialChildSize = (maximized && animationDone)
        ? maxChildSize
        : _MapSheetState.initScrollPosition;

    return Stack(children: [
      _sheet(snaps, initialChildSize, minChildSize, maxChildSize),
      mapPlaceController.placeOpened
          ? const SizedBox()
          : (mapMenuController.menuState == 0
              ? CourseSheet(
                  controller: courseSheetController,
                  menuController: mapMenuController,
                  mapSheetDetatchCallback: () => _deattach(),
                )
              : PathSheet(
                  mapSheetController: mapSheetController,
                  mapMenuController: mapMenuController,
                )),
      !mapPlaceController.placeOpened
          ? const SizedBox()
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.5)),
    ]);
  }

  DraggableScrollableSheet _sheet(List<double> snaps, double initialChildSize,
      double minChildSize, double maxChildSize) {
    return DraggableScrollableSheet(
      snap: true,
      snapSizes: snaps,
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      controller: controller,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              child: const MapTopIndicator(),
            ),
            DaisyMap(
              mapMenuController: mapMenuController,
              mapPlaceController: mapPlaceController,
              attachCallback: () {
                _debugAttach();
              },
            )
          ],
        );
      },
    );
  }
}
