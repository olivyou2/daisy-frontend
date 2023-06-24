import 'package:daisy_frontend/main/screens/main.dart';
import 'package:daisy_frontend/main/widgets/atom/menuBtn.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:daisy_frontend/util/image.dart';
import 'package:daisy_frontend/util/remoteActivator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuWidgetController extends RemoteActivator {
  bool state = false;
  bool menuPositionAnimationDone = true;

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
    state = false;
    menuPositionAnimationStart();
    activate("close");
  }

  open() {
    state = true;
    menuPositionAnimationStart();
    activate("open");
  }

  menuPositionAnimationStart() {
    menuPositionAnimationDone = false;
  }

  menuPositionAnimationEnd() {
    menuPositionAnimationDone = true;
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
        Positioned(
          right: widget.menuController.state ||
                  !widget.menuController.menuPositionAnimationDone
              ? 0
              : -390.w,
          child: AnimatedOpacity(
            opacity: widget.menuController.state ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: GestureDetector(
              onTapUp: backgroundTouched,
              child: Container(
                width: 390.w,
                height: 844.h,
                decoration:
                    const BoxDecoration(color: Color.fromARGB(200, 0, 0, 0)),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutCirc,
          onEnd: () {
            setState(() {
              widget.menuController.menuPositionAnimationEnd();
            });
          },
          right: widget.menuController.state ? 0 : -390.w,
          child: Container(
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
                    },
                  ),

                  // 친구 등록
                  MenuBtnWidget(
                    menuName: "친구 등록",
                    openCallback: () {
                      widget.pageNavigateController.changePage("friend");
                      widget.pageNavigateController.pageOpen();
                    },
                  ),
                  // 계정 정보
                  MenuBtnWidget(
                    menuName: "계정 정보",
                    openCallback: () {
                      setState(() {
                        widget.pageNavigateController.changePage("account");
                        widget.pageNavigateController.pageOpen();
                      });
                    },
                  ),
                  // 설정
                  MenuBtnWidget(
                    menuName: "설정",
                    openCallback: () {
                      widget.pageNavigateController.changePage("setting");
                      widget.pageNavigateController.pageOpen();
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
          ),
        )
      ],
    );
  }
}
