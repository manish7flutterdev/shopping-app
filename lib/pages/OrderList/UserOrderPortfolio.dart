import 'package:flutter/material.dart';
import 'package:shopping_app/pages/Main%20Controller/main_controller.dart';
import 'package:get/get.dart';
import 'package:shopping_app/pages/OrderList/UserOrderList.dart';
import 'package:shopping_app/pages/OrderList/model/ordered_product_model.dart';

class UserOrderPortfolio extends StatelessWidget {
  final totalPrice;
  UserOrderPortfolio(this.totalPrice);
  final MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    var statusbar = MediaQuery.of(context).padding.top;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height - statusbar;
    return WillPopScope(
        onWillPop: () => Get.to(() => UserOrderList()),
        child: Obx(
          () => Scaffold(
              body: Column(
            children: [
              SizedBox(height: statusbar),
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
                    Container(
                      width: width / 3,
                      height: height / 9,
                      child: Center(
                        child: Text("₹ $totalPrice",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
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
                    itemCount: mainController.userOrderedProductList.length,
                    itemBuilder: (context, index) {
                      OrderedProduct products =
                          mainController.userOrderedProductList[index];
                      var indeyx = index + 1;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                                    products.quantity.toString(),
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
              )
            ],
          )),
        ));
  }
}
