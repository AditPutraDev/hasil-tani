part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool groupValue = true;
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
                    style: mainStyle.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 67),
                  child: TextField(
                    controller: authController.username,
                    style: mainStyle,
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(50),
                          ),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(30, 16, 0, 16),
                        hintText: "Username"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 23),
                  child: TextField(
                    controller: authController.email,
                    style: mainStyle,
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(50),
                          ),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(30, 16, 0, 16),
                        hintText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 23),
                  child: TextField(
                    controller: authController.fullname,
                    style: mainStyle,
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(50),
                          ),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(30, 16, 0, 16),
                        hintText: "Nama lengkap"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Radio<bool>(
                          value: true,
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value!;
                            });
                          }),
                      Text('Pria'),
                      Radio<bool>(
                          value: false,
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value!;
                            });
                          }),
                      Text('Wanita'),
                    ],
                  ),
                ),
                TextField(
                  minLines: 1,
                  maxLines: 3,
                  controller: authController.address,
                  style: mainStyle,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(32),
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(30, 16, 0, 16),
                      hintText: "Alamat"),
                ),
                SizedBox(height: 24),
                TextField(
                  controller: authController.password,
                  obscureText: true,
                  style: mainStyle,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(32),
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(30, 16, 0, 16),
                      hintText: "Password"),
                ),
                SizedBox(height: 40),
                Obx(
                  () => (authController.isLoading.value)
                      ? Loading.threeBounce
                      : MyRaisedButton(
                          title: 'Sign Up',
                          icon: Icons.arrow_forward,
                          onPressed: () {
                            if (authController.username.text != '' &&
                                authController.fullname.text != '' &&
                                authController.email.text != '' &&
                                authController.address.text != '' &&
                                authController.password.text != '') {
                              authController.signUp(
                                  authController.username.text,
                                  authController.fullname.text,
                                  authController.email.text,
                                  (groupValue == true) ? 'pria' : 'wanita',
                                  authController.address.text,
                                  authController.password.text);
                            }
                            authController.checkSignUp();
                          }),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
