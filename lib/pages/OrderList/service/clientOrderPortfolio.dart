import 'package:http/http.dart' as http;
import 'package:shopping_app/pages/OrderList/model/ordered_product_model.dart';

class OrderedProductServices {
  static Future<List<OrderedProduct>> fetchOrder(String orderid) async {
    var response = await http.get(
        "https://nameless-crag-50769.herokuapp.com/orderedproducts/orderid/$orderid");
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return orderedProductFromJson(jsonString);
    } else {
      return null;
    }
  }
}
