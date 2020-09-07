import 'dart:async';

import 'package:connectivity/connectivity.dart';

import '../enums/connectivity_status.dart';
import '../interfaces/i_connectivity_service.dart';

class ConnectivityService implements IConnectivityService {
  StreamController<ConnectivityStatus> _connectionStatusController;
  Connectivity _connectivity;

  ConnectivityService() {
    _connectionStatusController =
        StreamController<ConnectivityStatus>.broadcast();
    _connectivity = Connectivity();

    _initNetworkStatusListener();
  }
  Stream<ConnectivityStatus> get connectionStatusStream =>
      _connectionStatusController.stream;

  void _initNetworkStatusListener() {
    /// subscribe to the connectivity changed stream
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectionStatusController.add(_getStatusFromResult(result));
    });
  }

  Future<ConnectivityStatus> get connectionInfo async {
    var result = await _connectivity.checkConnectivity();
    return _getStatusFromResult(result);
  }

  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }

  void disposeStream() {
    _connectionStatusController.close();
  }
}
