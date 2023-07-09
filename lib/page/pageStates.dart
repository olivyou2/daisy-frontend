// ignore_for_file: file_names

import 'package:hooks_riverpod/hooks_riverpod.dart';

enum PageState { login, register, main }

class PageStateNotifier extends StateNotifier<PageState> {
  PageStateNotifier() : super(PageState.login);

  void updatePage(PageState page) {
    state = page;
  }
}

final pageStateProvider = StateNotifierProvider<PageStateNotifier, PageState>(
    (ref) => PageStateNotifier());

PageState getPageState(WidgetRef ref) => ref.watch(pageStateProvider);

PageStateNotifier getPageStateProvider(WidgetRef ref) =>
    ref.read(pageStateProvider.notifier);
