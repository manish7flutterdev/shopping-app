import 'package:flutter/material.dart';
import 'package:shopping_app/pages/Homepage.dart';
import 'package:shopping_app/pages/Main%20Controller/main_controller.dart';
import 'package:get/get.dart';
import 'package:shopping_app/pages/OrderList/UserOrderPortfolio.dart';
import 'package:shopping_app/pages/OrderList/model/order_model.dart';
import 'package:shopping_app/pages/User%20Data/model.dart';

class UserOrderList extends StatelessWidget {
  final MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    var statusbar = MediaQuery.of(context).padding.top;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height - statusbar;
    Users user = mainController.userData[0];
    return WillPopScope(
      onWillPop: () => Get.to(() => Homepage()),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.blueGrey[100],
            body: Column(
              children: [
                SizedBox(
                  height: statusbar,
                ),
                SizedBox(
                  height: height / 30,
                ),
                Icon(
                  Icons.person_sharp,
                  size: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    user.userName,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Your Orders",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: mainController.userOrderList.length,
                      itemBuilder: (context, index) {
                        Orders order = mainController.userOrderList[index];
                        return InkWell(
                          onTap: () async {
                            mainController.userOrderedProductList.value = [];
                            Get.to(() => UserOrderPortfolio(order.totalPrice));
                            await mainController
                                .fetchUserOrderedProductList(order.id);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(25),
                            child: Container(
                              width: width,
                              height: height / 5,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blueGrey,
                                        blurRadius: 10,
                                        spreadRadius: 1)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Stack(
                                children: [
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Container(
                                          child: Text(
                                            "Order ID : ${order.id}",
                                            style: TextStyle(
                                                fontSize: height / 32,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[800]),
                                          ),
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey[700],
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          width: height / 9,
                                          height: height / 25,
                                          child: Center(
                                              child: Text(
                                            "₹ ${order.totalPrice}",
                                            style: TextStyle(
                                                fontSize: height / 40,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Container(
                                          child: Text(
                                            "Date : ${order.date}",
                                            style: TextStyle(
                                                fontSize: height / 35,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[800]),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            )),
      ),
    );
  }
}
