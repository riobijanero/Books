extension MapExtensions on Map {
  /// Tries to parse and return a key from a given map. Returns [defaultValue] if map is null or key doesn't exists.
  dynamic tryParse(dynamic key, {dynamic defaultValue}) =>
      this != null && containsKey(key) ? this[key] : defaultValue;

  /// Tries to parse and return a nested key from a given map. Returns null if map is null or key doesn't exists.
  dynamic tryParseNested(List<dynamic> keys) {
    if (this != null && keys != null && keys.isNotEmpty) {
      Map subMap = this;
      for (dynamic key in keys) {
        if (subMap.containsKey(key)) {
          if (key == keys.last) {
            return subMap[key];
          } else {
            subMap = subMap[key];
          }
        } else {
          break;
        }
      }
    }

    return null;
  }
}
