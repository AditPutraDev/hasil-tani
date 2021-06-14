part of 'pages.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(NewsController());
    final authController = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text('News'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.offAll(() => MainPage()),
            icon: Icon(Icons.home_rounded)),
        actions: [
          IconButton(
            onPressed: () => authController.signOut(),
            icon: Icon(Icons.exit_to_app_rounded),
          )
        ],
      ),
      body: ListView(
        children: [
          Obx(
            () {
              if (newsController.isLoading.value)
                return Center(child: Loading.threeBounce);
              else
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 24, top: 24),
                      child: Text('Slider News', style: blackBoldStyle),
                    ),
                    SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 12),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...newsController.newsList.map((item) {
                            return GestureDetector(
                              onTap: () => Get.to(
                                () =>
                                    DetailPage(DetailInfoType.news, news: item),
                              ),
                              child: Container(
                                width: 200,
                                margin: EdgeInsets.fromLTRB(
                                    item == newsController.newsList.first
                                        ? 24
                                        : 0,
                                    24,
                                    12,
                                    6),
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2.5,
                                          blurRadius: 3,
                                          color: Colors.black26)
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Hero(
                                      tag: '${item.idNews}',
                                      child: Container(
                                        height: 140,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                          ),
                                          image: DecorationImage(
                                              image:
                                                  NetworkImage('${item.image}'),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Text('${item.title}'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text('List News', style: blackBoldStyle),
                    ),
                    ...newsController.newsList.map((item) {
                      return GestureDetector(
                        onTap: () => Get.to(
                          () => DetailPage(DetailInfoType.news, news: item),
                        ),
                        child: Card(
                          margin: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 240,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                  ),
                                  child:
                                      CustomListCard.imageItem('${item.image}'),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('${item.title}'),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                  ],
                );
            },
          ),
        ],
      ),
    );
  }
}
