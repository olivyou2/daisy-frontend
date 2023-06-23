import 'package:daisy_frontend/main/screens/main.dart';
import 'package:daisy_frontend/main/widgets/atom/menuBtn.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:daisy_frontend/util/image.dart';
import 'package:daisy_frontend/util/remoteActivator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuWidgetController extends RemoteActivator {
  listenOpenEvent(Function open) {
    listen("open", () {
      open();
    });
  }

  listenCloseEvent(Function close) {
    listen("close", () {
      close();
    });
  }

  close() {
    activate("close");
  }

  open() {
    activate("open");
  }
}

class MenuWidget extends StatefulWidget {
  final MenuWidgetController menuController;
  final PageNavigateController pageNavigateController;

  const MenuWidget(
      {super.key,
      required this.menuController,
      required this.pageNavigateController});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  backgroundTouched(details) {
    widget.menuController.close();
  }

  closeBtnTouched(details) {
    widget.menuController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        GestureDetector(
          onTapUp: backgroundTouched,
          child: Container(
            width: 390.w,
            height: 844.h,
            decoration:
                const BoxDecoration(color: Color.fromARGB(200, 0, 0, 0)),
          ),
        ),
        Container(
          width: 310.w,
          height: 844.h,
          decoration: const BoxDecoration(color: ColorPalette.white),
          child: Center(
            child: SizedBox(
              width: 260.w,
              child: Column(children: [
                Padding(padding: EdgeInsets.only(top: 83.h)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTapUp: closeBtnTouched,
                      child: DaisyImages.closeImage,
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 40.h)),
                MenuBtnWidget(
                  menuName: "내 정보",
                  openCallback: () {
                    widget.pageNavigateController.changePage("info");
                    widget.pageNavigateController.pageOpen();

                    widget.menuController.close();
                  },
                ),
                // 친구 등록
                MenuBtnWidget(
                  menuName: "친구 등록",
                  openCallback: () {
                    widget.pageNavigateController.changePage("friend");
                    widget.pageNavigateController.pageOpen();

                    widget.menuController.close();
                  },
                ),
                // 계정 정보
                MenuBtnWidget(
                  menuName: "계정 정보",
                  openCallback: () {
                    widget.pageNavigateController.changePage("account");
                    widget.pageNavigateController.pageOpen();

                    widget.menuController.close();
                  },
                ),
                // 설정
                MenuBtnWidget(
                  menuName: "설정",
                  openCallback: () {
                    widget.pageNavigateController.changePage("setting");
                    widget.pageNavigateController.pageOpen();

                    widget.menuController.close();
                  },
                ),
                const Divider(
                  thickness: 1,
                  height: 1,
                  color: ColorPalette.gray4,
                ),
              ]),
            ),
          ),
        )
      ],
    );
  }
}
