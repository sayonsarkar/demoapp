import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobiletask/screens/list_view_screen.dart';
import 'package:mobiletask/utils/api.dart';
import 'package:mobiletask/widgets/login_text_fields.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends StatefulWidget {
  static const String id = '/';
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? passwordValidate, usernameValidate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const ListViewScreen();
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginTextField(
                  labelText: 'username',
                  validate: usernameValidate,
                  controller: usernameController,
                  icon: const Icon(Icons.account_circle_outlined),
                ),
                const SizedBox(
                  height: 20,
                ),
                LoginTextField(
                  labelText: 'password',
                  validate: passwordValidate,
                  controller: passwordController,
                  icon: const Icon(Icons.lock),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Repository().userLogin();
                    // setState(() {
                    //   isPasswordCompliant(passwordController.text)
                    //       ? passwordValidate = true
                    //       : passwordValidate = false;

                    //   isUsernameValidate(usernameController.text)
                    //       ? usernameValidate = true
                    //       : usernameValidate = false;
                    // });
                    // log(passwordValidate.toString());
                    // Navigator.popAndPushNamed(context, ListViewScreen.id);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: 100.w,
                    child: const Center(
                        child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future loginUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text.trim(),
        password: passwordController.text.trim());
  }

  // userLogin() async* {
  //  List<Users> users=  FirebaseFirestore.instance.collection('users').snapshots().map(
  //       (event) => event.docs.map((e) => Users.fromJson(e.data())).toList());
  // }
}

bool isUsernameValidate(String value) {
  if (value.length < 10) {
    return false;
  }
  return true;
}

bool isPasswordCompliant(String password, [int minLength = 7]) {
  if (password.isEmpty) {
    return false;
  }
  bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
  bool hasDigits = password.contains(RegExp(r'[0-9]'));
  bool hasSpecialCharacters =
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMinLength = password.length > minLength;

  return hasDigits & hasUppercase & hasSpecialCharacters & hasMinLength;
}
