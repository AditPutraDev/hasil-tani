part of 'controllers.dart';

class AuthController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  var isLoading = true.obs;

  Future<bool> signIn(String username, String password) async {
    isLoading();
    var url = Uri.parse(API_URL + '/login.php');
    final response = await http.post(url, body: {
      'username': username,
      'password': password,
    });
    var data = json.decode(response.body);

    if (response.statusCode == 200 && data["value"] == 1) {
      isLoading(false);
      print(data);
      Get.to(() => NewsPage());
      showBotToastText(data["message"]);
      return true;
    }
    showBotToastText(data["message"]);
    return false;
  }
}
