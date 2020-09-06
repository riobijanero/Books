import '../enums/connectivity_status.dart';

abstract class IConnectivityService {
  /// Returns a connecvitiy status
  Future<ConnectivityStatus> get connectionInfo;
}
