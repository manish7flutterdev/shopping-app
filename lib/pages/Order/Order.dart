import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_app/pages/Homepage.dart';
import 'package:shopping_app/pages/Main%20Controller/main_controller.dart';
import 'package:get/get.dart';
import 'package:shopping_app/pages/Order/OrderHandler/OrderHandler.dart';
import 'package:shopping_app/pages/Order/OrderHandler/OrderedProductHandler.dart';
import 'package:shopping_app/pages/Product/models/product_model.dart';
import 'package:shopping_app/pages/User%20Data/model.dart';

class Order extends StatelessWidget {
  final MainController mainController = Get.put(MainController());
  OrderHandler orderHandler = OrderHandler();
  OrderedProductHandler orderedProductHandler = OrderedProductHandler();

  @override
  Widget build(BuildContext context) {
    var statusBar = MediaQuery.of(context).padding.top;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height - statusBar;
    return Obx(() => Scaffold(
        floatingActionButton: (mainController.confirmed == true)
            ? FloatingActionButton(
                onPressed: () {
                  Get.to(() => Homepage());
                  mainController.confirmed.value = false;
                  mainController.pressed.value = false;
                },
                backgroundColor: Colors.greenAccent[400],
                child: Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                ),
              )
            : Container(),
        body: (mainController.pressed == false)
            ? Column(
                children: [
                  SizedBox(height: statusBar),
                  Container(
                    width: width,
                    height: height / 9,
                    color: Theme.of(context).primaryColor,
                    child: Row(
                      children: [
                        Container(
                          width: width / 6,
                          height: height / 9,
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: width / 2,
                          height: height / 9,
                        ),
                        Obx(
                          () => Container(
                            width: width / 3,
                            height: height / 9,
                            child: Center(
                              child: Text(
                                  "₹ ${mainController.totalPrice.toString()}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: height / 12,
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 2,
                            )),
                            child: Center(
                              child: Text(
                                "No.",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            height: height / 12,
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 2,
                            )),
                            child: Center(
                              child: Text(
                                "Product",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: height / 12,
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 2,
                            )),
                            child: Center(
                              child: Text(
                                "Qt.",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: height / 12,
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 2,
                            )),
                            child: Center(
                              child: Text(
                                "Price",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: mainController.cartList.length,
                        itemBuilder: (context, index) {
                          Products products = mainController.cartList[index];
                          var indeyx = index + 1;
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: height / 12,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      width: 2,
                                    )),
                                    child: Center(
                                      child: Text(
                                        indeyx.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    height: height / 12,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      width: 2,
                                    )),
                                    child: Center(
                                      child: Text(
                                        products.productName,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: height / 12,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      width: 2,
                                    )),
                                    child: Center(
                                      child: Text(
                                        products.baseQuantity.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: height / 12,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      width: 2,
                                    )),
                                    child: Center(
                                      child: Text(
                                        products.price.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  InkWell(
                    onTap: () {
                      getCart();
                    },
                    child: Container(
                      width: width,
                      height: height / 8,
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                      ),
                      child: Center(
                        child: Text(
                          "CONFIRM",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : (mainController.confirmed == true)
                ? Container(
                    width: width,
                    height: height + statusBar,
                    color: Colors.black,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Text(
                        "Your Order is Successfull!!",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                            color: Colors.greenAccent[400]),
                      ),
                    )),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )));
  }

  getCart() async {
    mainController.pressed.value = true;
    String dateVar = getCurrentDate();
    Users users = mainController.userData[0];
    dynamic productData = jsonEncode(mainController.cartList);
    productData = jsonDecode(productData);
    Map<String, String> data = {
      "CustomerID": users.id,
      "CustomerName": users.userName,
      "Address": users.address,
      "PhoneNumber": users.phoneNumber.toString(),
      "Email": users.email,
      "TotalPrice": mainController.totalPrice.toString(),
      "OrderConfirmed": "false",
      "Delivered": "false",
      "Date": dateVar
    };

    var response = await orderHandler.post('/register', data);
    var zuzu = jsonDecode(response.body);
    if ((zuzu['orderID'].length <= 25)) {
      print("Your Order has been created");
      int i;
      var orderID = zuzu['orderID'];
      for (i = 0; i < productData.length; i++) {
        var productName = productData[i]['ProductName'];
        var productPrice = productData[i]['Price'].toString();
        var quantity = productData[i]['BaseQuantity'].toString();
        Map<String, String> data = {
          "ProductName": productName,
          "Price": productPrice,
          "Quantity": quantity,
          "OrderID": orderID,
        };
        await orderedProductHandler.post('/register', data);
      }
      print(orderID);
      var checkProducts = await orderedProductHandler.get("/orderid/$orderID");
      if (checkProducts.length == productData.length) {
        print("Order is successfull");
        mainController.cartList.value = [];
        mainController.totalPrice.value = 0;
        mainController.confirmed.value = true;
      } else {
        print("order Not successful");
        mainController.pressed.value = false;
      }
    }
  }

  getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    return formattedDate;
  }
}
