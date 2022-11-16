import 'package:http/http.dart' as http;
import 'package:mobiletask/model/user_model.dart';

class Repository {
  final url =
      "https://flutter-task-3b876-default-rtdb.asia-southeast1.firebasedatabase.app/users/tHNupnaeQZcSESwSwRJw";
  Users? user;
  Future userLogin() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      // user = Users.fromJson(response.body);
    }
  }
}
