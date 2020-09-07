import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/constants/style_constants.dart';

import '../enums/connectivity_status.dart';
import '../interfaces/i_connectivity_service.dart';
import '../services/connectivity_service.dart';
import '../view_models/article_list_view_model.dart';
import '../widgets/search_button.dart';
import '../widgets/article_list.dart';
import '../widgets/searchbar.dart';

class ArticleListPage extends StatefulWidget {
  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  TextEditingController _textEditingController;
  ArticleListViewModel _viewModel;
  ConnectivityService _connectivityService;

  bool isLoading = false;
  String searchTerm;
  String finishedSearchTerm;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = Provider.of<ArticleListViewModel>(context);
    _connectivityService = Provider.of<IConnectivityService>(context);
  }

  void _showSnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('no Internet connection'));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  Future<void> _onSearchButtonPressed(
      String value, BuildContext context) async {
    ConnectivityStatus connectionInfo =
        await _connectivityService.connectionInfo;
    if (connectionInfo == ConnectivityStatus.Offline) {
      _showSnackBar(context);
    } else if (!isLoading && value != null && value.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      await _viewModel.fetchArticles(value);
      _textEditingController.clear();
      setState(() {
        isLoading = false;
        finishedSearchTerm = value;
      });
      searchTerm = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(finishedSearchTerm != null
            ? 'Search results for \"$finishedSearchTerm\"'
            : 'Articles'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Flexible(
                  flex: 4,
                  child: Builder(
                    builder: (context) => SearchBar(
                      onCancel: _viewModel.cancelSearch,
                      showCancelIcon: isLoading,
                      searchBarHeight: searchBarHeight,
                      textEditingController: _textEditingController,
                      onSubmitted: (value) async =>
                          await _onSearchButtonPressed(value.trim(), context),
                      onChanged: (value) => setState(() {
                        searchTerm = value.trim();
                      }),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Builder(
                    builder: (context) => SearchButton(
                      searchBarHeight: searchBarHeight,
                      isLoading: isLoading,
                      onSearchButtonPressed: () async =>
                          await _onSearchButtonPressed(searchTerm, context),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 50),
                  child: isLoading
                      ? RaisedButton(
                          child: Text('Cancel Search'),
                          onPressed: _viewModel.cancelSearch,
                        )
                      : _viewModel.articleList == null
                          ? Center(
                              child: Text(_viewModel.errorMessage,
                                  style: errorMessageStyle,
                                  textAlign: TextAlign.center))
                          : ArticleList(articleList: _viewModel.articleList)),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
