class OnceActivator {
  late bool activated;
  late List<Function> listeners;

  OnceActivator() {
    activated = false;
    listeners = [];
  }

  addListener(Function listener) {
    listeners.add(listener);
  }

  removeAllListener() {
    listeners.clear();
  }

  activate() {
    if (activated == false) {
      activated = true;
      for (var listener in listeners) {
        listener.call();
      }
    }
  }

  deactivate() {
    activated = false;
  }
}
