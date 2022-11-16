import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  static const String id = '/ListViewScreen';
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("Name"),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Age"),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text("City"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              print("My account menu is selected.");
            } else if (value == 1) {
              print("Settings menu is selected.");
            } else if (value == 2) {
              print("Logout menu is selected.");
            }
          }),
        ],
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text('data'),
          );
        },
      ),
    );
  }
}
