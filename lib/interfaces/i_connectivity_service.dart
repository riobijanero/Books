import '../enums/connectivity_status.dart';

abstract class IConnectivityService {
  /// Returns a connecvitiy status Stream
  Stream<ConnectivityStatus> get connectionStatusStream;

  /// Returns a connecvitiy status Future
  Future<ConnectivityStatus> get connectionInfo;
}
