part of 'controllers.dart';

class NewsController extends GetxController {
  final RxList<News> newsList = <News>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    try {
      isLoading(true);
      await NewsService.getNews().then((value) {
        if (value is List<News>) {
          newsList.addAll(value);
        }
      });
    } finally {
      isLoading(false);
    }
  }
}
