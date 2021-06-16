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
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Search'),
                    onTap: () => Get.to(() => DictionarySearchPage()),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () => Get.to(() => DictionarySearchPage()),
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
                          return CustomListCard.dictionaryList(
                              '${item.istilah}', '${item.detail}', context);
                        })
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: height / 4),
                      child: Column(
                        children: [
                          CustomListCard.imageItem(
                            dictioncaryController.empty,
                            fit: BoxFit.contain,
                          ),
                          Text('Data tidak ditemukan'),
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
