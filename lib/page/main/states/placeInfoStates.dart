import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlaceInfoState {
  late String imageUrl;
  late String placeName;
  late String time;
  late int rate;

  PlaceInfoState(
      {required this.imageUrl,
      required this.placeName,
      required this.time,
      required this.rate});

  clone() {
    return PlaceInfoState(
        imageUrl: imageUrl, placeName: placeName, time: time, rate: rate);
  }
}

class PlaceInfoStateNotifier extends StateNotifier<PlaceInfoState> {
  PlaceInfoStateNotifier()
      : super(PlaceInfoState(
          imageUrl: "",
          placeName: "",
          time: "",
          rate: 0,
        ));

  void updatePlaceInfo(String imageUrl) {
    state = state.clone()..imageUrl = imageUrl;
  }

  void updatePlaceName(String placeName) {
    state = state.clone()..placeName = placeName;
  }

  void updateTime(String time) {
    state = state.clone()..time = time;
  }

  void updateRate(int rate) {
    state = state.clone()..rate = rate;
  }
}

final placeInfoStateProvider =
    StateNotifierProvider<PlaceInfoStateNotifier, PlaceInfoState>(
        (ref) => PlaceInfoStateNotifier());

PlaceInfoState getPlaceInfoState(WidgetRef ref) =>
    ref.watch(placeInfoStateProvider);

PlaceInfoStateNotifier getPlaceInfoStateProvider(WidgetRef ref) =>
    ref.read(placeInfoStateProvider.notifier);
