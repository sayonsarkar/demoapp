import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  static const String id = '/ListViewScreen';
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
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
