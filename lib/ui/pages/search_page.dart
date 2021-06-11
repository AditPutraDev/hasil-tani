part of 'pages.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DictionaryController dictioncaryController =
        Get.find<DictionaryController>();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Search'),
                      controller: dictioncaryController.search,
                      onChanged: (text) {
                        dictioncaryController
                            .onSearch(dictioncaryController.search.text);
                      },
                    ),
                  ),
                  (dictioncaryController.isTyping.value)
                      ? IconButton(
                          onPressed: () => dictioncaryController.onTyping(),
                          icon: Icon(Icons.close, color: Colors.black),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
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
                                      Text('${item.istilah}',
                                          style: blackBoldStyle),
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
                                          Text('${item.istilah}',
                                              style: blackBoldStyle),
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
          ],
        ),
      ),
    );
  }
}
