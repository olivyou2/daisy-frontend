import 'package:daisy_frontend/page/main/screens/subpage/account.dart';
import 'package:daisy_frontend/page/main/screens/subpage/friends.dart';
import 'package:daisy_frontend/page/main/screens/subpage/myinfo.dart';
import 'package:daisy_frontend/page/main/screens/subpage/setting.dart';
import 'package:daisy_frontend/page/main/widgets/atom/decoration/halfWidthDecoration.dart';
import 'package:daisy_frontend/page/main/widgets/atom/decoration/wideDecoration.dart';
import 'package:daisy_frontend/page/main/widgets/atom/description.dart';
import 'package:daisy_frontend/page/main/widgets/atom/map.dart';
import 'package:daisy_frontend/page/main/widgets/molecule/main/mainTopIndicator.dart';
import 'package:daisy_frontend/page/main/widgets/molecule/map/mapSheet.dart';
import 'package:daisy_frontend/page/main/widgets/molecule/menu/MenuWidget.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:daisy_frontend/util/remoteActivator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class PageNavigateController extends RemoteActivator {
  late String pageName;

  bool navigateAnimationDone = true;
  bool pageOpened = false;

  listenPageOpen(Function callback) {
    listen("open", () {
      callback();
    });
  }

  listenPageClose(Function callback) {
    listen("close", () {
      callback();
    });
  }

  changePage(String pageName) {
    this.pageName = pageName;
  }

  pageOpen() {
    navigateAnimationStart();
    pageOpened = true;
    activate("open");
  }

  pageClose() {
    navigateAnimationStart();
    pageOpened = false;
    activate("close");
  }

  navigateAnimationStart() {
    navigateAnimationDone = false;
  }

  navigateAnimationEnd() {
    navigateAnimationDone = true;
  }
}

class _MainPageState extends State<MainPage> {
  final combineWidth = 390.w - 47.w;

  final MenuWidgetController menuController = MenuWidgetController();
  final PageNavigateController pageNavigateController =
      PageNavigateController();

  @override
  void initState() {
    super.initState();

    menuController.listenOpenEvent(() {
      setState(() {
        menuOpened = true;
      });
    });

    menuController.listenCloseEvent(() {
      setState(() {
        menuOpened = false;
      });
    });

    pageNavigateController.listenPageOpen(() {
      setState(() {
        pageOpened = true;
      });
    });

    pageNavigateController.listenPageClose(() {
      setState(() {
        pageOpened = false;
      });
    });
  }

  bool menuOpened = false;
  bool pageOpened = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: SizedBox(
                    width: combineWidth,
                    child: MainTopIndicator(
                      menuController: menuController,
                    ))),
            Padding(padding: EdgeInsets.only(top: 40.h)),
            _buildDecorationSet(),
            Padding(padding: EdgeInsets.only(top: 40.h)),
            _buildBottomDecorationSet()
          ],
        ),
        const MapSheet(),
        MenuWidget(
          menuController: menuController,
          pageNavigateController: pageNavigateController,
        ),
        _renderPage()
      ]),
    );
  }

  Widget _renderPage() {
    if (pageOpened) {
      if (pageNavigateController.pageName == "info") {
        return MyInfoPageWidget(
          pageNavigateController: pageNavigateController,
        );
      } else if (pageNavigateController.pageName == "friend") {
        return FriendPageWidget(pageNavigateController: pageNavigateController);
      } else if (pageNavigateController.pageName == "account") {
        return AccountPageWidget(
            pageNavigateController: pageNavigateController);
      } else if (pageNavigateController.pageName == "setting") {
        return SettingPageWidget(
          pageNavigateController: pageNavigateController,
        );
      }
    }

    return const SizedBox();
  }

  Widget _buildBottomDecorationSet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            width: combineWidth,
            child: MainDescription(
              name: "김땡땡",
              description: "데이트코스를 추천해드릴게요",
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 12.h)),
        Padding(
          padding: EdgeInsets.only(left: 21.w, right: 21.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  HalfWidthDecoration(
                      height: 168.h,
                      backgroundColor: ColorPalette.yello2,
                      overlayText: Text(
                        "데이지에서 준비한 맞춤 데이트코스",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w700),
                      )),
                  Padding(padding: EdgeInsets.only(top: 12.h)),
                  HalfWidthDecoration(
                    height: 80.h,
                    backgroundColor: ColorPalette.gray2,
                    overlayText: Text(
                      "데이트지도 기록",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w700),
                    ),
                    subOverlayText: Text(
                      "지난번엔 뭐했지?",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              HalfWidthDecoration(
                height: 260.h,
                backgroundColor: const Color(0xff7A2317),
                textTopWidget: Container(
                  width: 70.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffE07870),
                    borderRadius: BorderRadius.all(Radius.circular(20.w)),
                  ),
                  child: Center(
                    child: Text(
                      "음식점",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff7A2317)),
                    ),
                  ),
                ),
                overlayText: Text(
                  "이번 주 추천\n데이트코스 테마는?",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDecorationSet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: combineWidth,
            child: Center(
                child: MainDescription(
              name: "김땡땡",
              description: "{name}님,\n이번 데이트는 어디가 좋을까요?",
            ))),
        Padding(padding: EdgeInsets.only(top: 12.h)),
        SizedBox(
          height: 160.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const WideDecoration();
            },
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(left: 12.w),
              );
            },
          ),
        ),
      ],
    );
  }
}
