import 'dart:convert';
import 'package:get/get.dart';
import 'package:shopping_app/pages/OrderList/model/order_model.dart';
import 'package:shopping_app/pages/OrderList/model/ordered_product_model.dart';
import 'package:shopping_app/pages/OrderList/service/clientOrderList.dart';
import 'package:shopping_app/pages/OrderList/service/clientOrderPortfolio.dart';
import 'package:shopping_app/pages/Product/models/description_model.dart';
import 'package:shopping_app/pages/Product/models/image_model.dart';
import 'package:shopping_app/pages/Product/models/product_model.dart';
import 'package:shopping_app/pages/Product/services/description_services.dart';
import 'package:shopping_app/pages/Product/services/image_services.dart';
import 'package:shopping_app/pages/Product/services/product_services.dart';
import 'package:shopping_app/pages/User%20Data/model.dart';
import 'package:shopping_app/pages/User%20Data/service.dart';

class MainController extends GetxController {
  var productList = List<Products>().obs;
  var cartList = List<Products>().obs;
  var userData = List<Users>().obs;
  var userOrderList = List<Orders>().obs;
  var userOrderedProductList = List<OrderedProduct>().obs;
  var productImageList = List<Images>().obs;
  var productDescriptionList = List<Descriptions>().obs;
  var totalPrice = 0.obs;
  var totalItem = 0.obs;
  var pressed = false.obs;
  var confirmed = false.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  fetchProductDescription(String productID) async {
    var productDescription =
        await DescriptionServices.fetchDescription(productID);
    if (productDescription != null) {
      productDescriptionList.value = productDescription;
    }
  }

  fetchProductImage(String productID) async {
    var productImage = await ImageServices.fetchImage(productID);
    if (productImage != null) {
      productImageList.value = productImage;
    }
  }

  fetchUserOrderedProductList(String orderid) async {
    var orderedProduct = await OrderedProductServices.fetchOrder(orderid);
    if (orderedProduct != null) {
      userOrderedProductList.value = orderedProduct;
    }
  }

  fetchUserOrderList(String userid) async {
    var orderList = await OrdersServices.fetchOrder(userid);
    if (orderList != null) {
      userOrderList.value = orderList;
    }
  }

  fetchUsers(String userid) async {
    var user = await UserServices.fetchUsers(userid);
    if (user != null) {
      userData.add(user);
      return 'success';
    }
  }

  void fetchProducts() async {
    var product = await ProductServices.fetchProduct();
    if (product != null) {
      productList.value = product;
    }
  }

  deleteItem(String item) {
    ////// print("total item befor ${cartList.length}");
    dynamic checkMyId = jsonEncode(cartList);
    checkMyId = jsonDecode(checkMyId);
    int i;
    int tempTotal = totalPrice.toInt();
    int priceToRemove;
    for (i = 0; i < checkMyId.length; i++) {
      if (checkMyId[i]['_id'] == item) {
        priceToRemove = checkMyId[i]['BaseQuantity'] * checkMyId[i]['Price'];
        cartList.remove(cartList[i]);
      }
      totalItem.value = cartList.length;
      checkPrice(cartList);
    }
    tempTotal = tempTotal - priceToRemove;
    totalPrice.value = tempTotal;
  }

  cartItems(dynamic item) {
    if (cartList.isEmpty) {
      cartList.add(item);
      totalItem.value = cartList.length;
      checkPrice(cartList);
      return "success";
    } else {
      dynamic chechId = jsonEncode(item);
      chechId = jsonDecode(chechId);
      String idCheck = chechId['_id'];
      dynamic forId = jsonEncode(cartList);
      forId = jsonDecode(forId);
      List idList = [];
      int i;
      for (i = 0; i < forId.length; i++) {
        String x = forId[i]['_id'];
        idList.add(x);
      }
      int z;
      var huhu = true;
      for (z = 0; z < idList.length; z++) {
        if (idCheck == idList[z]) {
          huhu = false;
          return "existing product";
        }
      }
      if (huhu == true) {
        cartList.add(item);
        totalItem.value = cartList.length;
        checkPrice(cartList);

        return "success";
      }
    }
  }

  addIndex(String id) {
    dynamic temp = productsToJson(cartList);
    temp = jsonDecode(temp);
    int i;
    int baseIndex;
    for (i = 0; i < temp.length; i++) {
      if (temp[i]['_id'] == id) {
        temp[i]['BaseQuantity'] = temp[i]['BaseQuantity'] + 1;
        baseIndex = temp[i]['BaseQuantity'];
      }
    }
    temp = jsonEncode(temp);
    cartList.value = productsFromJson(temp);
    return baseIndex;
  }

  removeIndex(String id) {
    dynamic temp = productsToJson(cartList);
    temp = jsonDecode(temp);
    int i;
    int baseIndex;
    for (i = 0; i < temp.length; i++) {
      if (temp[i]['_id'] == id) {
        temp[i]['BaseQuantity'] = temp[i]['BaseQuantity'] - 1;
        baseIndex = temp[i]['BaseQuantity'];
      }
    }
    temp = jsonEncode(temp);
    cartList.value = productsFromJson(temp);
    return baseIndex;
  }

  increasePrice(int base, int price) {
    int tempTotal = totalPrice.toInt();
    tempTotal = tempTotal + price;
    totalPrice.value = tempTotal;
  }

  decreasePrice(int base, int price) {
    int tempTotal = totalPrice.toInt();
    tempTotal = tempTotal - price;
    totalPrice.value = tempTotal;
  }

  checkPrice(dynamic cartList) {
    dynamic temp = jsonEncode(cartList);
    temp = jsonDecode(temp);
    int i;
    var sum = 0;
    for (i = 0; i < cartList.length; i++) {
      sum = sum + temp[i]['Price'];
    }
    totalPrice.value = sum;
  }
}
