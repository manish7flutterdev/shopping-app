import 'package:http/http.dart' as http;
import '../model/order_model.dart';

class OrdersServices {
  static Future<List<Orders>> fetchOrder(String userid) async {
    var response = await http.get(
        "https://nameless-crag-50769.herokuapp.com/orders/customerid/$userid");
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return ordersFromJson(jsonString);
    } else {
      return null;
    }
  }
}
