part of 'widgets.dart';

class CustomListCard {
  static dictionaryList(String title, String description, context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        Get.bottomSheet(
          BottomSheets.dictionarySheet(title, description),
        );
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: blackBoldStyle),
                  SizedBox(height: 4),
                  Text(
                      (description.length > 40)
                          ? '${description.substring(0, 40)} ...'
                          : description,
                      textAlign: TextAlign.justify),
                ],
              ),
            ),
            SizedBox(width: 12),
            Icon(Icons.arrow_forward_ios_rounded,
                size: 14, color: Colors.grey[500])
          ],
        ),
      ),
    );
  }

  static imageItem(String imageUrl) {
    return CachedNetworkImage(
      height: 120,
      width: 100,
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Loading.shimmer,
      errorWidget: (context, url, error) => Container(
        height: 120,
        width: 100,
        color: Colors.grey.shade200,
        child: Icon(Icons.broken_image_rounded, color: Colors.grey),
      ),
    );
  }
}
