part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    authController.splash();
    return Scaffold(
      body: Center(
        child: Loading.threeBounce,
      ),
    );
  }
}
