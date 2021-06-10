part of 'pages.dart';

class SignInPage extends StatelessWidget {
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 93),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Color(0xFF43A8FC),
                      letterSpacing: 3,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 67),
                  child: TextField(
                    controller: authController.username,
                    style: TextStyle(color: Color(0xFF43A8FC)),
                    decoration: new InputDecoration(
                      suffixIcon: Icon(Icons.person_outline),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50),
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(30, 16, 0, 16),
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "Email",
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 23),
                  child: TextField(
                    controller: authController.password,
                    obscureText: true,
                    style: TextStyle(color: Color(0xFF43A8FC)),
                    decoration: new InputDecoration(
                      suffixIcon: Icon(Icons.lock_outline),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(32),
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(30, 16, 0, 16),
                      hintStyle: new TextStyle(),
                      hintText: "Password",
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {}, // => Get.to(ResetPasswordPage()),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color(0xFF757575),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                MyRaisedButton(
                  title: 'Sign In',
                  icon: Icons.arrow_forward,
                  onPressed: () => authController.signIn(
                      authController.username.text,
                      authController.password.text),
                  //isLoading: _isLoading,
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Color(0xFF757575),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 7),
                    InkWell(
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Color(0xFF43A8FC),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());

                        Get.to(() => SignUpPage());
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
