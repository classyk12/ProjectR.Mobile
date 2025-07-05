import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provide connectivity globally
final internetConnectivityProvider =
    StateNotifierProvider<InternetConnectivityNotifier, bool>(
  (ref) => InternetConnectivityNotifier(),
);

class InternetConnectivityNotifier extends StateNotifier<bool> {
  InternetConnectivityNotifier() : super(true) {
    _monitorConnectivity();
  }

  void _monitorConnectivity() {
    Connectivity().onConnectivityChanged.listen((result) {
      state = !result.contains(ConnectivityResult.none);
    });
  }

  @override
  void dispose() {
    //
    super.dispose();
  }
}
