import 'package:coding_challenge/models/cover_image.dart';

class ArticleUtils {
  static String _formatIntToTwoDigits(int ordering) {
    if (ordering / 10 < 1) {
      return '0$ordering';
    }
    return ordering.toString();
  }

  static String getImageUrl(CoverImage coverImage) {
    String urlPrefix = coverImage.urlPrefix;
    String imagePrefixId = coverImage.imagePrefixId;
    String formattedOrdering = _formatIntToTwoDigits(coverImage.ordering);
    String encodedTitle = coverImage.encodedTitel;
    String fileExtension = coverImage.fileExtension;

    return '${urlPrefix}$imagePrefixId-$formattedOrdering-00/$encodedTitle.$fileExtension';
  }
}
