import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/pages/Cart/CartTile.dart';
import 'package:shopping_app/pages/Main%20Controller/main_controller.dart';
import 'package:shopping_app/pages/OrderList/UserOrderList.dart';
import 'package:shopping_app/pages/Product/models/product_model.dart';
import 'package:shopping_app/pages/Product/views/ProductProfile.dart';
import 'package:shopping_app/pages/User%20Data/model.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var statusBar, height, width;
  final MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    statusBar = MediaQuery.of(context).padding.top;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height - statusBar;
    Users users = mainController.userData[0];
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: statusBar),
          Container(
            width: width,
            height: height / 9,
            color: Theme.of(context).primaryColor,
            child: Row(
              children: [
                InkWell(
                  onTap: () async {
                    await mainController.fetchUserOrderList(users.id);
                    Get.to(() => UserOrderList());
                  },
                  child: Container(
                    width: width / 6,
                    height: height / 9,
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: width / 2,
                  height: height / 9,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => Cart());
                  },
                  child: Container(
                    width: width / 6,
                    height: height / 9,
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: width / 6,
                  height: height / 9,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Obx(() => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
                      mainAxisSpacing: 11),
                  itemCount: mainController.productList.length,
                  itemBuilder: (context, index) {
                    Products product = mainController.productList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          Get.to(() => ProductProfile(index));
                          mainController.productImageList.value = [];
                          mainController.productDescriptionList.value = [];
                          await mainController.fetchProductImage(product.id);
                          await mainController
                              .fetchProductDescription(product.id);
                        },
                        child: Container(
                            width: width / 2,
                            height: height / 2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 1,
                                      spreadRadius: 2)
                                ]),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      child: Image.network(
                                        product.image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          product.productName,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          "₹ ${product.price.toString()}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                    );
                  }))),
        ],
      ),
    );
  }
}
