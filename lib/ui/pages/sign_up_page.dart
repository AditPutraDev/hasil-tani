part of 'pages.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
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
                    "Sign Up",
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
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(50),
                          ),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(30, 16, 0, 16),
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 23),
                  child: TextField(
                    controller: authController.email,
                    style: TextStyle(color: Color(0xFF43A8FC)),
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(50),
                          ),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(30, 16, 0, 16),
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 23),
                  child: TextField(
                    controller: authController.fullname,
                    style: TextStyle(color: Color(0xFF43A8FC)),
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(50),
                          ),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(30, 16, 0, 16),
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Fullname"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 23),
                  child: TextField(
                    controller: authController.sex,
                    obscureText: true,
                    style: TextStyle(color: Color(0xFF43A8FC)),
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(32),
                          ),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(30, 16, 0, 16),
                        hintStyle: new TextStyle(),
                        hintText: "Sex"),
                  ),
                ),
                TextField(
                  controller: authController.address,
                  obscureText: true,
                  style: TextStyle(color: Color(0xFF43A8FC)),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(32),
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(30, 16, 0, 16),
                      hintStyle: new TextStyle(),
                      hintText: "Address"),
                ),
                SizedBox(height: 24),
                TextField(
                  controller: authController.password,
                  obscureText: true,
                  style: TextStyle(color: Color(0xFF43A8FC)),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(32),
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(30, 16, 0, 16),
                      hintStyle: new TextStyle(),
                      hintText: "Password"),
                ),
                SizedBox(height: 40),
                MyRaisedButton(
                    title: 'Sign Up',
                    icon: Icons.arrow_forward,
                    onPressed: () {
                      if (authController.username.text != '' &&
                          authController.fullname.text != '' &&
                          authController.email.text != '' &&
                          authController.sex.text != '' &&
                          authController.address.text != '' &&
                          authController.password.text != '') {
                        authController.signUp(
                            authController.username.text,
                            authController.fullname.text,
                            authController.email.text,
                            authController.sex.text,
                            authController.address.text,
                            authController.password.text);
                      }
                      authController.checkSignUp();
                    }),
              ],
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
