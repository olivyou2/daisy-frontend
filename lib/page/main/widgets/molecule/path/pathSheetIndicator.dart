import 'package:daisy_frontend/page/main/widgets/atom/indicator.dart';
import 'package:daisy_frontend/page/main/widgets/molecule/map/mapSheet.dart';
import 'package:daisy_frontend/page/main/widgets/molecule/path/pathSheet.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PathItem {
  final bool empty;
  final String? title;
  final String? place;
  final String? type;
  final Image? image;

  const PathItem(
      {this.title, this.place, this.type, this.image, this.empty = true});
}

class PathUnit extends StatefulWidget {
  final PathItem pathItem;
  final int position;

  const PathUnit({super.key, required this.pathItem, required this.position});

  @override
  State<PathUnit> createState() => _PathUnitState();
}

class _PathUnitState extends State<PathUnit> {
  Widget buildEmptyUnit() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
                color: ColorPalette.gray2,
                borderRadius: BorderRadius.circular(25.w)),
          ),
          Padding(padding: EdgeInsets.only(left: 12.w)),
          Text("시작 장소를 선택해주세요",
              style: TextStyle(
                  color: ColorPalette.gray2,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500))
        ]);
  }

  Widget buildUnit() {
    PathItem item = widget.pathItem;

    String place = item.place ?? "언남동";

    String title = item.title ?? "삼대째손두부";
    String type = item.type ?? "음식점";

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
              color: ColorPalette.gray2,
              borderRadius: BorderRadius.circular(25.w)),
        ),
        Padding(padding: EdgeInsets.only(left: 12.w)),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: ColorPalette.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "$place | $type",
              style: TextStyle(
                  color: ColorPalette.gray3,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    );
  }

  Widget createVerticalDivider(double height) {
    return SizedBox(
      height: height,
      child: VerticalDivider(
        color: ColorPalette.gray2,
        thickness: 2.w,
        width: 2.w,
        indent: 0,
        endIndent: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> columnWidgets = [];

    if (widget.position == 0) {
      columnWidgets.add(Padding(padding: EdgeInsets.only(top: 45.h)));
      columnWidgets.add(createVerticalDivider(45.h));
    } else if (widget.position == 1) {
      columnWidgets.add(createVerticalDivider(90.h));
    } else if (widget.position == 2) {
      columnWidgets.add(createVerticalDivider(45.h));
      columnWidgets.add(Padding(padding: EdgeInsets.only(top: 45.h)));
    }

    return Stack(
      children: [
        SizedBox(
            width: 350.w,
            height: 90.h,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
                ),
                Column(children: columnWidgets)
              ],
            )),
        SizedBox(
          width: 350.w,
          height: 90.h,
          child: widget.pathItem.empty ? buildEmptyUnit() : buildUnit(),
        ),
      ],
    );
  }
}

class PathTopIndicator extends StatefulWidget {
  final MapSheetController mapSheetController;
  final MapMenuController mapMenuController;

  const PathTopIndicator({
    super.key,
    required this.mapSheetController,
    required this.mapMenuController,
  });

  @override
  State<PathTopIndicator> createState() => _PathTopIndicatorState();
}

class _PathTopIndicatorState extends State<PathTopIndicator> {
  int mode = 0;
  List<PathItem> pathItems = [];

  @override
  void initState() {
    super.initState();

    pathItems.add(PathItem(title: "누메르도스", empty: false));
    pathItems.add(PathItem(title: "삼대째손두부", empty: false));
    pathItems.add(PathItem(title: "명지대최고의맛집", empty: false));
    pathItems.add(PathItem(empty: true));
  }

  void reorderData(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final PathItem item = pathItems.removeAt(oldIndex);
      pathItems.insert(newIndex, item);
    });
  }

  void onCreateDone() {
    widget.mapMenuController.setMenu(0);
    widget.mapSheetController.deattach();
  }

  @override
  Widget build(BuildContext context) {
    return Indicator(height: 786.h, children: [
      SizedBox(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(padding: EdgeInsets.only(top: 10.h)),
          SizedBox(
            width: 350.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2023 05/28 (일) 데이트 지도",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      color: Color.fromARGB(255, 242, 163, 9)),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10.h)),
          SizedBox(
            height: 570.h,
            child: ReorderableListView.builder(
                onReorder: reorderData,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 0.h),
                itemBuilder: (BuildContext context, int index) {
                  return ReorderableDelayedDragStartListener(
                    key: Key('$index'),
                    index: index,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PathUnit(
                          pathItem: pathItems[index],
                          position: index == 0
                              ? 0
                              : (index == pathItems.length - 1 ? 2 : 1),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: pathItems.length,
                footer: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 40.h)),
                    Container(
                      alignment: Alignment.center,
                      width: 220.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          color: ColorPalette.backGray,
                          borderRadius: BorderRadius.circular(10.w)),
                      child: Text(
                        "항목을 길게 눌러 편집할 수 있습니다.",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorPalette.gray2),
                      ),
                    )
                  ],
                )),
          ),
          Padding(padding: EdgeInsets.only(top: 15.h)),
          SizedBox(
            width: 350.w,
            child: Center(
              child: GestureDetector(
                onTapUp: (details) {
                  onCreateDone();
                },
                child: Container(
                  width: 242.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: ColorPalette.yello,
                      borderRadius: BorderRadius.all(Radius.circular(30.w))),
                  alignment: Alignment.center,
                  child: Text(
                    "데이트지도 완성",
                    style: TextStyle(
                        color: ColorPalette.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
        ]),
      )
    ]);
  }
}
