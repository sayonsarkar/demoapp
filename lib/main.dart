import 'package:flutter/material.dart';
import 'package:mobiletask/screens/list_view_screen.dart';
import 'package:mobiletask/screens/login_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          initialRoute: MyHomePage.id,
          routes: {
            ListViewScreen.id: (context) => const ListViewScreen(),
          },
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Login Page'),
        );
      },
    );
  }
}
