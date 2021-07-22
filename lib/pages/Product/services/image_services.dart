import 'package:http/http.dart' as http;
import 'package:shopping_app/pages/Product/models/image_model.dart';

class ImageServices {
  static Future<List<Images>> fetchImage(String productID) async {
    var response = await http.get(
        "https://nameless-crag-50769.herokuapp.com/images/productid/$productID");
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return imagesFromJson(jsonString);
    } else {
      return null;
    }
  }
}
