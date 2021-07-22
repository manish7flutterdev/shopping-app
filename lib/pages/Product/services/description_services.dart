import 'package:http/http.dart' as http;
import 'package:shopping_app/pages/Product/models/description_model.dart';

class DescriptionServices {
  static Future<List<Descriptions>> fetchDescription(String productID) async {
    var response = await http.get(
        "https://nameless-crag-50769.herokuapp.com/descriptions/productid/$productID");
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return descriptionsFromJson(jsonString);
    } else {
      return null;
    }
  }
}
