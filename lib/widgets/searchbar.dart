import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    @required this.searchBarHeight,
    @required TextEditingController textEditingController,
    @required Function(String) onSubmitted,
    @required Function(String) onChanged,
    @required void Function() onCancel,
    @required bool showCancelIcon,
  })  : _textEditingController = textEditingController,
        _onSubmitted = onSubmitted,
        _onChanged = onChanged,
        _showCancelIcon = showCancelIcon,
        _onCancel = onCancel,
        super(key: key);

  final double searchBarHeight;
  final TextEditingController _textEditingController;
  final bool _showCancelIcon;
  final void Function() _onCancel;
  final Function(String) _onChanged;
  final Function(String) _onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: searchBarHeight,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        onChanged: (value) => _onChanged(value),
        controller: _textEditingController,
        onSubmitted: (value) {
          _onSubmitted(value);
        },
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            suffixIcon: _showCancelIcon
                ? IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.white,
                      size: 22,
                    ),
                    onPressed: _onCancel,
                  )
                : null,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none),
      ),
    );
  }
}
