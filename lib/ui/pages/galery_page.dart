part of 'pages.dart';

class GaleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GaleryController galeryController = Get.find<GaleryController>();
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Obx(
            () => Container(
              child: Column(
                children: [
                  ...galeryController.galeryList.map((item) {
                    return GestureDetector(
                      onTap: () => Get.to(
                        DetailPage(item),
                      ),
                      child: Card(
                        child: Column(
                          children: [
                            Text(item.description ?? '-'),
                            Text(item.name ?? '-'),
                            Text(item.type ?? '-'),
                            Image.network(item.foto ?? '-'),
                          ],
                        ),
                      ),
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
