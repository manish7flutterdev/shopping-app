import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductServices {
  static Future<List<Products>> fetchProduct() async {
    var response =
        await http.get("https://nameless-crag-50769.herokuapp.com/products");
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return productsFromJson(jsonString);
    } else {
      return null;
    }
  }
}
