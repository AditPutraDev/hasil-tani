part of 'pages.dart';

class DictionaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DictionaryController dictioncaryController =
        Get.find<DictionaryController>();
    return Scaffold(
      body: Obx(
        () => ListView(
          children: [
            TextField(
              controller: dictioncaryController.search,
              onChanged: (text) {
                dictioncaryController
                    .onSearch(dictioncaryController.search.text);
              },
            ),
            Container(
              child: (dictioncaryController.searchList.length == 0 &&
                      dictioncaryController.search.text.isEmpty)
                  ? Column(
                      children: [
                        ...dictioncaryController.dictionaryList.map((item) {
                          return GestureDetector(
                            onTap: () => Get.to(() => DetailPage(
                                DetailInfoType.dictionary,
                                dictionary: item)),
                            child: Column(
                              children: [
                                Text(item.istilah ?? '-'),
                                Text(item.detail ?? '-'),
                                Text(item.type ?? '-'),
                              ],
                            ),
                          );
                        })
                      ],
                    )
                  : (dictioncaryController.searchList.length != 0)
                      ? Column(
                          children: [
                            ...dictioncaryController.searchList.map((item) {
                              return GestureDetector(
                                onTap: () => Get.to(() => DetailPage(
                                    DetailInfoType.dictionary,
                                    dictionary: item)),
                                child: Column(
                                  children: [
                                    Text(item.istilah ?? '-'),
                                    Text(item.detail ?? '-'),
                                    Text(item.type ?? '-'),
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
