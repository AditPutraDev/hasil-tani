part of 'pages.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.find<NewsController>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => MainPage()),
            icon: Icon(Icons.exit_to_app_rounded),
          )
        ],
      ),
      body: ListView(
        children: [
          Obx(
            () {
              if (newsController.isLoading.value == true)
                return Loading.threeBounce;
              else
                return Container(
                  child: Column(
                    children: [
                      ...newsController.newsList.map((item) {
                        return GestureDetector(
                          onTap: () => Get.to(
                            () => DetailPage(DetailInfoType.news, news: item),
                          ),
                          child: Card(
                            child: Column(
                              children: [
                                Text(item.description ?? '-'),
                                Text(item.title ?? '-'),
                                Image.network(item.image ?? '-'),
                              ],
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                );
            },
          ),
        ],
      ),
    );
  }
}
