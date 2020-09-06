import 'dart:convert';
import '../common/utils/extensions/map_extensions.dart';

class CoverImage {
  final String urlPrefix;
  final int width;
  final int height;
  final int ordering;
  final String type;
  final String description;
  final String imagePrefixId;
  final String encodedTitel;
  final String fileExtension;
  final bool placeHolder;
  final String imageResolutions;

  CoverImage({
    this.urlPrefix,
    this.width,
    this.height,
    this.ordering,
    this.type,
    this.description,
    this.imagePrefixId,
    this.encodedTitel,
    this.fileExtension,
    this.placeHolder,
    this.imageResolutions,
  });

  CoverImage copyWith({
    String urlPrefix,
    int width,
    int height,
    int ordering,
    String type,
    String description,
    String imagePrefixId,
    String encodedTitel,
    String fileExtension,
    bool placeHolder,
    String imageResolutions,
  }) {
    return CoverImage(
      urlPrefix: urlPrefix ?? this.urlPrefix,
      width: width ?? this.width,
      height: height ?? this.height,
      ordering: ordering ?? this.ordering,
      type: type ?? this.type,
      description: description ?? this.description,
      imagePrefixId: imagePrefixId ?? this.imagePrefixId,
      encodedTitel: encodedTitel ?? this.encodedTitel,
      fileExtension: fileExtension ?? this.fileExtension,
      placeHolder: placeHolder ?? this.placeHolder,
      imageResolutions: imageResolutions ?? this.imageResolutions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'urlPrefix': urlPrefix,
      'width': width,
      'height': height,
      'ordering': ordering,
      'type': type,
      'description': description,
      'imagePrefixId': imagePrefixId,
      'encodedTitel': encodedTitel,
      'fileExtension': fileExtension,
      'placeHolder': placeHolder,
      'imageResolutions': imageResolutions,
    };
  }

  factory CoverImage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CoverImage(
      urlPrefix: map.tryParse('urlPrefix'),
      width: map.tryParse('breite'),
      height: map.tryParse('hoehe'),
      ordering: map.tryParse('ordering'),
      type: map.tryParse('typ'),
      description: map.tryParse('beschreibung'),
      imagePrefixId: map.tryParse('imageprefixid'),
      encodedTitel: map.tryParse('encodedTitel'),
      fileExtension: map.tryParse('fileExtension'),
      placeHolder: map.tryParse('platzhalter'),
      imageResolutions: map.tryParse('imageResolutions'),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoverImage.fromJson(String source) =>
      CoverImage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoverImage(urlPrefix: $urlPrefix, width: $width, height: $height, ordering: $ordering, type: $type, description: $description, imagePrefixId: $imagePrefixId, encodedTitel: $encodedTitel, fileExtension: $fileExtension, placeHolder: $placeHolder, imageResolutions: $imageResolutions)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CoverImage &&
        o.urlPrefix == urlPrefix &&
        o.width == width &&
        o.height == height &&
        o.ordering == ordering &&
        o.type == type &&
        o.description == description &&
        o.imagePrefixId == imagePrefixId &&
        o.encodedTitel == encodedTitel &&
        o.fileExtension == fileExtension &&
        o.placeHolder == placeHolder &&
        o.imageResolutions == imageResolutions;
  }

  @override
  int get hashCode {
    return urlPrefix.hashCode ^
        width.hashCode ^
        height.hashCode ^
        ordering.hashCode ^
        type.hashCode ^
        description.hashCode ^
        imagePrefixId.hashCode ^
        encodedTitel.hashCode ^
        fileExtension.hashCode ^
        placeHolder.hashCode ^
        imageResolutions.hashCode;
  }
}
