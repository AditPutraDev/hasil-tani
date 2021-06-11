part of 'pages.dart';

class DictionaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DictionaryController dictioncaryController =
        Get.find<DictionaryController>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Search'),
                    onTap: () => Get.to(() => SearchPage()),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () => Get.to(() => SearchPage()),
                icon: Icon(Icons.search_rounded)),
          ],
        ),
      ),
      body: Obx(
        () => ListView(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 90),
              child: (dictioncaryController.dictionaryList.length != 0)
                  ? Column(
                      children: [
                        ...dictioncaryController.dictionaryList.map((item) {
                          return GestureDetector(
                            onTap: () => Get.to(() => DetailPage(
                                DetailInfoType.dictionary,
                                dictionary: item)),
                            child: Column(
                              children: [
                                SizedBox(height: 40),
                                Text('${item.istilah}', style: blackBoldStyle),
                                SizedBox(height: 40),
                                Text('${item.detail}'),
                                SizedBox(height: 40),
                                Text('${item.type}'),
                              ],
                            ),
                          );
                        })
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: height / 4),
                      child: Column(
                        children: [
                          Icon(Icons.no_accounts_rounded, size: 150),
                          Text('data kosong'),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
