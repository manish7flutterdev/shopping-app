import 'package:flutter/material.dart';
import 'package:shopping_app/pages/Main%20Controller/main_controller.dart';
import 'package:shopping_app/pages/Order/Order.dart';
import 'package:shopping_app/pages/Product/models/product_model.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  final MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    var statusBar = MediaQuery.of(context).padding.top;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height - statusBar;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: statusBar,
          ),
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
                      child: Text("₹ ${mainController.totalPrice.toString()}",
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
          ///////////// AppBaar ///////////////
          cartContainer(width, height),
          InkWell(
            onTap: () {
              Get.to(() => Order());
            },
            child: Container(
              width: width,
              height: height / 8,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Center(
                child: Text(
                  "PLACE ORDER",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget cartContainer(var width, var height) {
    return Expanded(
      child: Obx(() => ListView.builder(
          shrinkWrap: true,
          itemCount: mainController.cartList.length,
          itemBuilder: (context, index) {
            Products product = mainController.cartList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Container(
                width: width,
                height: height / 5,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue, blurRadius: 10, spreadRadius: 1)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: Text(
                              product.productName,
                              style: TextStyle(
                                  fontSize: height / 25,
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
                                color: Colors.blue[900],
                                borderRadius: BorderRadius.circular(30)),
                            width: height / 9,
                            height: height / 25,
                            child: Center(
                                child: Text(
                              "₹ ${product.price}",
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 8),
                        child: Container(
                          width: width / 3,
                          height: height / 12,
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    if (product.baseQuantity > 1) {
                                      var res = mainController
                                          .removeIndex(product.id);

                                      mainController.decreasePrice(
                                          res, product.price);
                                    }
                                  },
                                  child: Container(
                                    height: height / 17,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Icon(Icons.remove),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: height / 17,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.blue,
                                            blurRadius: 10,
                                            spreadRadius: 1)
                                      ],
                                      shape: BoxShape.circle),
                                  child: Center(
                                      child: Text(
                                    product.baseQuantity.toString(),
                                    style: TextStyle(
                                        fontSize: height / 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700]),
                                  )),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    var res =
                                        mainController.addIndex(product.id);

                                    mainController.increasePrice(
                                        res, product.price);
                                  },
                                  child: Container(
                                    height: height / 17,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15),
                        child: InkWell(
                          onTap: () {
                            mainController.deleteItem(product.id);
                          },
                          child: Icon(
                            Icons.delete,
                            size: height / 20,
                            color: Colors.cyan[600],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
