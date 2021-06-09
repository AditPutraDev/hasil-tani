part of 'services.dart';

class DictionaryService {
  static Future getDictionary() async {
    var url = Uri.parse(API_URL + '/get_dictionary.php');
    final responseData = await http.get(url);
    if (responseData.statusCode == 200) {
      final data = jsonDecode(responseData.body);
      print(responseData.body);
      return (data as List).map((v) => Dictionary.fromJson(v)).toList();
    }
  }
}
