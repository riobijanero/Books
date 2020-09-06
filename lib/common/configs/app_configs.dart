class AppConfig {
  /// The app name
  final String appName;

  /// Base http host for all requests with backend
  final String host;

  /// Whether the dev debug flaf should be shown
  final bool showdebugFlag;

  final String xClientname;

  /// Constructs an instance of the config
  AppConfig({
    this.showdebugFlag = false,
  })  : appName = _DevConstants.appName,
        host = _DevConstants.host,
        xClientname = _DevConstants.xClientname;
}

class _DevConstants {
  static const appName = 'Thalia coding Challenge';
  static const host = 'www.thalia.de';
  static const xClientname = 'crosschannelapp';
}
