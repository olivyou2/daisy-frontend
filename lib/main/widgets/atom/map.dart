import 'package:daisy_frontend/main/map/marker.dart';
import 'package:daisy_frontend/main/widgets/molecule/map/mapSheet.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaisyMap extends StatefulWidget {
  final Function? attachCallback;
  final MapMenuController mapMenuController;
  final MapPlaceController mapPlaceController;

  const DaisyMap(
      {super.key,
      this.attachCallback,
      required this.mapMenuController,
      required this.mapPlaceController});

  @override
  State<DaisyMap> createState() => _DaisyMapState();
}

class _DaisyMapState extends State<DaisyMap> {
  final markers = <Marker>[];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (!mounted) return;

        setState(() {
          _loadMarkers();
        });
      },
    );

    super.initState();
  }

  _loadMarkers() {
    for (var i = 0; i < 3; i++) {
      MarkerType type;

      if (i == 0) {
        type = MarkerType.book;
      } else if (i == 1) {
        type = MarkerType.culture;
      } else if (i == 2) {
        type = MarkerType.food;
      } else {
        type = MarkerType.book;
      }

      DaisyMarker marker = DaisyMarker(
          markerId: "d$i",
          position: LatLng(37.3426329041238 + 0.002 * i, 127.11167502411264),
          marker: type,
          onMarkerTab: (details, some) {
            print(details?.captionText);
          });

      marker.loadIconImage();

      markers.add(marker);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 844.h - 58.h - 158.h,
      child: Stack(
        children: [
          NaverMap(
            markers: markers,
            onSymbolTap: (position, caption) {
              print("onSymbolTap");
              print(caption);
            },
            pathOverlays: {
              PathOverlay(
                  PathOverlayId("path1"),
                  const [
                    LatLng(37.3426329041238 + 0.002, 127.11167502411264),
                    LatLng(37.3426329041238 + 0.002 + 0.002, 127.11167502411264)
                  ],
                  width: 2,
                  color: ColorPalette.yellow,
                  outlineColor: ColorPalette.white)
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 628.h - 60.h - 64.h,
            ),
            child: Center(
              child: GestureDetector(
                onTapUp: onTabCreateMapBtn,
                child: widget.mapMenuController.menuState == 1
                    ? null
                    : Container(
                        decoration: BoxDecoration(
                            color: ColorPalette.yello,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.w))),
                        width: 259.w,
                        height: 60.h,
                        child: Center(
                          child: Text(
                            "데이트 지도 만들기",
                            style: TextStyle(
                                color: ColorPalette.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp),
                          ),
                        ),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onTabCreateMapBtn(details) {
    widget.attachCallback!();
  }
}
