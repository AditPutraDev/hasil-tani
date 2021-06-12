part of 'widgets.dart';

class BottomSheets {
  static dictionarySheet(String title, String description) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: ListView(
        children: [
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: blackBoldStyle),
                SizedBox(height: 4),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          SizedBox(height: 90),
        ],
      ),
    );
  }
}
