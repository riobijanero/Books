import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'common/configs/app_configs.dart';
import 'interfaces/i_webservice.dart';
import 'interfaces/i_connectivity_service.dart';
import 'services/connectivity_service.dart';
import 'services/web_service.dart';
import 'view_models/article_list_view_model.dart';
import 'views/article_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static AppConfig _appConfig = AppConfig();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appConfig.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: _getAppProvidersSingelton(),
        child: ArticleListPage(),
      ),
    );
  }

  List<SingleChildWidget> _getAppProvidersSingelton() {
    final WebService webService = WebService(_appConfig);
    final ConnectivityService connectivityService = ConnectivityService();
    return [
      // StreamProvider<ConnectivityStatus>.value(
      //     value: connectivityService.connectionStatusController.stream),
      Provider<IConnectivityService>.value(value: connectivityService),
      Provider<IWebService>.value(value: webService),
      ChangeNotifierProvider(
          create: (context) => ArticleListViewModel(webService)),
    ];
  }
}
