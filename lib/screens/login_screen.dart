import 'package:flutter/material.dart';
import 'package:mobiletask/widgets/login_text_fields.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoginTextField(
              labelText: 'username',
              icon: Icon(Icons.account_circle_outlined),
            ),
            const SizedBox(
              height: 20,
            ),
            const LoginTextField(
              labelText: 'password',
              icon: Icon(Icons.lock),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
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
          ],
        ),
      ),
    );
  }
}
