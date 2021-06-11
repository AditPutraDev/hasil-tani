part of 'pages.dart';

class DictionaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DictionaryController dictioncaryController =
        Get.find<DictionaryController>();
    return Scaffold(
      body: Obx(() => Column(
            children: [
              Container(
                child: TextField(
                  decoration: InputDecoration(hintText: 'Search'),
                  controller: dictioncaryController.search,
                  onChanged: (text) {
                    dictioncaryController
                        .onSearch(dictioncaryController.search.text);
                  },
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      color: Colors.grey.shade200,
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      child: (dictioncaryController.searchList.length == 0 &&
                              dictioncaryController.search.text.isEmpty)
                          ? Column(
                              children: [
                                ...dictioncaryController.dictionaryList
                                    .map((item) {
                                  return GestureDetector(
                                    onTap: () => Get.to(() => DetailPage(
                                        DetailInfoType.dictionary,
                                        dictionary: item)),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 40),
                                        Text(item.istilah ?? '-',
                                            style: blackBoldStyle),
                                        SizedBox(height: 40),
                                        Text(item.detail ?? '-'),
                                        SizedBox(height: 40),
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
                                    ...dictioncaryController.searchList
                                        .map((item) {
                                      return GestureDetector(
                                        onTap: () => Get.to(() => DetailPage(
                                            DetailInfoType.dictionary,
                                            dictionary: item)),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 40),
                                            Text(item.istilah ?? '-',
                                                style: blackBoldStyle),
                                            SizedBox(height: 40),
                                            Text(item.detail ?? '-'),
                                            SizedBox(height: 40),
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
                                      Icon(Icons.no_accounts_rounded,
                                          size: 150),
                                      Text('data kosong'),
                                    ],
                                  ),
                                ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
