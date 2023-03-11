import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DeviceStorage {
  static const secureStorage = FlutterSecureStorage();

  static loadData(void Function(Duration, FlutterSecureStorage) func) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      func(timeStamp, DeviceStorage.secureStorage);
    });
  }
}
