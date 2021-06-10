part of 'services.dart';

class GaleryService {
  static Future getGalery() async {
    var url = Uri.parse(API_URL + '/get_galery.php');
    final responseData = await http.get(url);
    if (responseData.statusCode == 200) {
      final data = jsonDecode(responseData.body);
      return (data as List).map((v) => Galery.fromJson(v)).toList();
    }
  }
}
