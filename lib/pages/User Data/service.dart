import 'package:http/http.dart' as http;
import './model.dart';

class UserServices {
  static Future<Users> fetchUsers(String userid) async {
    var response = await http
        .get("https://nameless-crag-50769.herokuapp.com/users/id/$userid");
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return usersFromJson(jsonString);
    } else {
      return null;
    }
  }
}
