part of 'controllers.dart';

class AuthController extends GetxController {
  final username = TextEditingController(text: 'aditya14');
  final password = TextEditingController(text: '123456');
  final fullname = TextEditingController();
  final email = TextEditingController();
  final sex = TextEditingController();
  final address = TextEditingController();

  var isLoading = false.obs;

  Future<bool> signIn(String username, String password) async {
    try {
      isLoading(true);
      var url = Uri.parse(API_URL + '/login.php');
      final response = await http.post(url, body: {
        'username': username,
        'password': password,
      });
      var data = json.decode(response.body);

      if (response.statusCode == 200 && data["value"] == 1) {
        print(data);
        Get.to(() => NewsPage());
        showBotToastText(data["message"]);
        isLoading(false);
        return true;
      }
      showBotToastText(data["message"]);
      return false;
    } finally {
      isLoading(false);
    }
  }

  Future<bool> signUp(String username, String fullname, String email,
      String sex, String address, String password) async {
    try {
      isLoading(true);
      var url = Uri.parse(API_URL + '/register.php');
      final response = await http.post(url, body: {
        'username': username,
        'full_name': fullname,
        'email': email,
        'sex': sex,
        'address': address,
        'password': password,
      });
      var data = json.decode(response.body);
      if (response.statusCode == 200 && data["value"] == 1) {
        print(data);
        Get.to(() => NewsPage());
        showBotToastText(data["message"]);
        isLoading(false);
        return true;
      }
      showBotToastText(data["message"]);
      return false;
    } finally {
      isLoading(false);
    }
  }

  void checkSignIn() {
    if (username.text == '') {
      showBotToastText('Please fill the username field');
    } else if (password.text == '') {
      showBotToastText('Please fill the password field');
    }
  }

  void checkSignUp() {
    if (username.text == '') {
      showBotToastText('Please fill the username field');
    } else if (email.text == '') {
      showBotToastText('Please fill the email field');
    } else if (fullname.text == '') {
      showBotToastText('Please fill the fullname field');
    } else if (sex.text == '') {
      showBotToastText('Please fill the sex field');
    } else if (address.text == '') {
      showBotToastText('Please fill the address field');
    } else if (password.text == '') {
      showBotToastText('Please fill the password field');
    }
  }
}
