part of 'pages.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = new TextEditingController();
    final TextEditingController emailController = new TextEditingController();
    final TextEditingController phoneController = new TextEditingController();
    final TextEditingController passwordController =
        new TextEditingController();
    final TextEditingController password2Controller =
        new TextEditingController();
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
                    controller: nameController,
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
                    controller: emailController,
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
                    controller: phoneController,
                    style: TextStyle(color: Color(0xFF43A8FC)),
                    keyboardType: TextInputType.phone,
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(50),
                          ),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(30, 16, 0, 16),
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Phone Number"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 23),
                  child: TextField(
                    controller: passwordController,
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
                ),
                TextField(
                  controller: password2Controller,
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
                      hintText: "Confirm Password"),
                ),
                SizedBox(height: 40),
                MyRaisedButton(
                  title: 'Sign Up',
                  icon: Icons.arrow_forward,
                  onPressed: () {},
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
