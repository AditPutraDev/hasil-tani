part of 'controllers.dart';

class AuthController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();

  var isLoading = false.obs;

  Future<bool> signIn(String username, String password) async {
    try {
      isLoading(true);
      Request request = Request(url: 'login.php', body: {
        'username': username,
        'password': password,
      });
      await request.post().then((res) {
        final data = jsonDecode(res.body);
        if (res.statusCode == 200 && data["value"] == 1) {
          Get.offAll(() => NewsPage());
          showBotToastText(data["message"]);
          isLoading(false);
          saveLikeToken(data["password"]);
          return true;
        }
        showBotToastText(data["message"]);
      });
      return false;
    } finally {
      isLoading(false);
    }
  }

  Future<bool> signUp(String username, String fullname, String email,
      String sex, String address, String password) async {
    try {
      isLoading(true);
      Request request = Request(url: 'register.php', body: {
        'username': username,
        'full_name': fullname,
        'email': email,
        'sex': sex,
        'address': address,
        'password': password,
      });
      await request.post().then((res) {
        final data = jsonDecode(res.body);
        if (res.statusCode == 200 && data["value"] == 1) {
          Get.offAll(() => NewsPage());
          showBotToastText(data["message"]);
          isLoading(false);
          saveLikeToken(data["value"].toString());
          return true;
        }
        showBotToastText(data["message"]);
      });
      return false;
    } finally {
      isLoading(false);
    }
  }

  void signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("like_token", "");
    Get.offAll(() => MainPage());
  }

  void splash() {
    Future.delayed(Duration(seconds: 3), () {
      checkLoginStatus();
    });
  }

  checkLoginStatus() async {
    String? token = await readLikeToken();
    if (token == '' || token == null) {
      Get.offAll(() => SignInPage());
    } else {
      Get.offAll(() => NewsPage());
    }
  }

  saveLikeToken(String likeToken) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("like_token", likeToken);
  }

  Future<String?> readLikeToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("like_token");
    return token;
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
    } else if (address.text == '') {
      showBotToastText('Please fill the address field');
    } else if (password.text == '') {
      showBotToastText('Please fill the password field');
    }
  }
}
