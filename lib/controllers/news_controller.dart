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
      Request request = Request(url: 'get_news.php');
      await request.get().then((res) {
        if (res.statusCode == 200) {
          final data = jsonDecode(res.body);
          final value = (data as List).map((e) => News.fromJson(e)).toList();
          if (value is List<News>) {
            newsList.addAll(value);
          }
        }
      });
    } finally {
      isLoading(false);
    }
  }
}
