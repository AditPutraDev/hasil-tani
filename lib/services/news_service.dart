part of 'services.dart';

class NewsService {
  static Future getNews() async {
    var url = Uri.parse(API_URL + '/get_news.php');
    final responseData = await http.get(url);
    if (responseData.statusCode == 200) {
      final data = jsonDecode(responseData.body);
      return (data as List).map((v) => News.fromJson(v)).toList();
    }
  }
}
