import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/article.dart';
import '../common/configs/app_configs.dart';

import '../interfaces/i_webservice.dart';

class WebService implements IWebService {
  final AppConfig appConfig;

  WebService(this.appConfig);

  String host;
  var url;
  String xClientname;
  Map<String, String> requestHeaders;

  Future<List<Article>> fetchArticles(String searchTerm) async {
    host = appConfig.host;
    xClientname = appConfig.xClientname;

    requestHeaders = {
      'Host': '$host',
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    if (searchTerm == null && searchTerm.isEmpty) {
      throw Exception("Search Term is empty!");
    } else {
      url = Uri.http(host, '/api/2003/suche/v1/?suchbegriff=$searchTerm');
      try {
        final response = await http.get(url, headers: requestHeaders);
        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);

          final Iterable json = body["artikelliste"];
          List<Article> articlList =
              json?.map((article) => Article.fromMap(article))?.toList();
          return articlList;
        } else {
          throw Exception("Unable to perform request!");
        }
      } catch (e) {
        print(e);
        throw Exception("network request failed");
      }
    }
  }
}
