part of 'pages.dart';

class DictionaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DictionaryController dictioncaryController =
        Get.find<DictionaryController>();
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Obx(
            () => Container(
              child: Column(
                children: [
                  ...dictioncaryController.dictionaryList.map((item) {
                    return Column(
                      children: [
                        Text(item.istilah ?? '-'),
                        Text(item.detail ?? '-'),
                        Text(item.type ?? '-'),
                      ],
                    );
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
