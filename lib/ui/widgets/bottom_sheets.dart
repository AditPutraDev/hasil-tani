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

  static about() {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Aditya Dev'),
          ),
          ListTile(
            leading: Icon(Icons.smartphone_sharp),
            title: Text('Hasil Tani App'),
          ),
          ListTile(
            leading: Icon(Icons.book_rounded),
            title: Text('Flutter batch 5 udacoding'),
          )
        ],
      ),
    );
  }
}
