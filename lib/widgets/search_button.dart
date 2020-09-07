import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key key,
    @required this.searchBarHeight,
    @required this.isLoading,
    @required this.onSearchButtonPressed,
  }) : super(key: key);

  final double searchBarHeight;

  final bool isLoading;
  final Function onSearchButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: searchBarHeight,
      child: RaisedButton(
        color: Colors.green[500],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.green[600])),
        onPressed: onSearchButtonPressed,
        child: isLoading
            ? SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                ),
              )
            : const Icon(
                Icons.search,
                color: Colors.white,
              ),
      ),
    );
  }
}
