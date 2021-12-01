import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isWifiConnected;
  Future<bool> get isMobileConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity = Connectivity();

  @override
  Future<bool> get isWifiConnected async {
    final result = await connectivity.checkConnectivity();
    return result == ConnectivityResult.wifi;
  }

  @override
  Future<bool> get isMobileConnected async {
    final result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.mobile;
  }
}

