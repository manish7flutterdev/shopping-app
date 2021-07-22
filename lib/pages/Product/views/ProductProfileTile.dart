import 'package:flutter/material.dart';
import 'package:shopping_app/pages/Main%20Controller/main_controller.dart';
import 'package:shopping_app/pages/Product/models/description_model.dart';
import 'package:shopping_app/pages/Product/models/image_model.dart';
import 'package:shopping_app/pages/Product/models/product_model.dart';
import 'package:get/get.dart';

class ProductProfileTile extends StatelessWidget {
  final Products product;
  ProductProfileTile(this.product);
  final MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    var statusBar = MediaQuery.of(context).padding.top;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height - statusBar;
    return Column(
      children: [
        SizedBox(height: statusBar),
        Expanded(
          flex: 4,
          child: Obx(() => Container(
              width: width,
              height: height / 2,
              child: PageView.builder(
                  itemCount: mainController.productImageList.length,
                  itemBuilder: (context, index) {
                    Images images = mainController.productImageList[index];
                    return Image.network(images.imageUrl);
                  }))),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(product.productName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  )),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text("₹ ${product.price}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  )),
            ),
          ),
        ),
        Obx(() => Expanded(
              flex: 2,
              child: Container(
                  child: PageView.builder(
                      itemCount: mainController.productDescriptionList.length,
                      itemBuilder: (context, index) {
                        Descriptions descriptions =
                            mainController.productDescriptionList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10),
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: SingleChildScrollView(
                                child: Text(
                                  descriptions.description,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                      fontSize: 30),
                                ),
                              )),
                        );
                      })),
            )),
      ],
    );
  }
}
