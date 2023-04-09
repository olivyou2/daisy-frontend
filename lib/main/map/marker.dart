import 'package:daisy_frontend/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum MarkerType { book, culture, food }

class DaisyMarker extends Marker {
  late MarkerType marker;

  DaisyMarker(
      {required super.markerId, required super.position, required this.marker});

  Future<void> loadIconImage() async {
    OverlayImage? image;

    // super.width = 30;
    // super.height = 30;
    super.captionText = "음하하";

    if (marker == MarkerType.book) {
      image = await OverlayImage.fromAssetImage(
        assetName: DaisyImages.bookMarkerImage.assetName,
      );
    } else if (marker == MarkerType.culture) {
      image = await OverlayImage.fromAssetImage(
          assetName: DaisyImages.cultureMarkerImage.assetName);
    } else if (marker == MarkerType.food) {
      image = await OverlayImage.fromAssetImage(
          assetName: DaisyImages.foodMarkerImage.assetName);
    }

    if (image == null) {
      return;
    }

    icon = image;
  }
}
