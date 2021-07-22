import 'package:flutter/material.dart';
import 'package:shopping_app/pages/Main%20Controller/main_controller.dart';
import 'package:shopping_app/pages/Product/models/product_model.dart';
import 'package:get/get.dart';
import 'package:shopping_app/pages/Product/views/ProductProfileTile.dart';

class ProductProfile extends StatelessWidget {
  final index;
  ProductProfile(this.index);
  final MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    print(index);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.add),
          onPressed: () {
            var res =
                mainController.cartItems(mainController.productList[index]);
            print(res);
            if (res == 'success') {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: Text("Successfully Added to Cart"));
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(title: Text("Already Added"));
                  });
            }
          },
        ),
        body: Obx(
          () => ProductProfileTile(mainController.productList[index]),
        ));
  }
}
