import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapState {
  late bool isShowPlaceInfo;
  late bool isShowButton;

  MapState({required this.isShowButton, required this.isShowPlaceInfo});

  clone() {
    return MapState(
        isShowButton: isShowButton, isShowPlaceInfo: isShowPlaceInfo);
  }
}

class MapStateNotifier extends StateNotifier<MapState> {
  MapStateNotifier()
      : super(MapState(isShowButton: false, isShowPlaceInfo: false));

  void updateIsShowPlace(bool value) {
    state = state.clone()..isShowPlaceInfo = value;
  }

  void updateIsShowButton(bool value) {
    state = state.clone()..isShowButton = value;
  }
}

final mapStateProvider = StateNotifierProvider<MapStateNotifier, MapState>(
    (ref) => MapStateNotifier());

MapState getMapState(WidgetRef ref) => ref.watch(mapStateProvider);

MapStateNotifier getMapStateProvider(WidgetRef ref) =>
    ref.read(mapStateProvider.notifier);
