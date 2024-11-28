import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Connectivitycontroller {
  Connectivitycontroller._();
  static final Connectivitycontroller instance = Connectivitycontroller._();
  ValueNotifier<bool> isConnected =
      ValueNotifier(true); //so we can listen to it directly
  Future<void> init() async {
    final result = await Connectivity().checkConnectivity();

    IsConnectedd(result);
    Connectivity().onConnectivityChanged.listen(IsConnectedd);
    // listens for updates in real-time and invokes IsConnectedd whenever a change occurs.
  }

  bool IsConnectedd(List<ConnectivityResult>? result) {
    if (result!.contains(ConnectivityResult.none)) {
      isConnected.value = false;
      return false;
    } else if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi)) {
      isConnected.value = true;
      return true;
    }
    return false;
  }
}
