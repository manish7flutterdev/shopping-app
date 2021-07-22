import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/pages/Authorization/Signin.dart';
import 'package:shopping_app/pages/Authorization/SigninHandler.dart';
import 'package:shopping_app/pages/Authorization/Signup.dart';
import 'package:shopping_app/pages/Main%20Controller/main_controller.dart';

class Starter extends StatefulWidget {
  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  SigninHandler signinHandler = SigninHandler();
  MainController mainController = Get.put(MainController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _globalkey = GlobalKey<FormState>();

  bool circular = false;
  bool loginPress = true;
  var statusBar;
  var width;
  var height;
  @override
  Widget build(BuildContext context) {
    statusBar = MediaQuery.of(context).padding.top;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height - statusBar;
    return Scaffold(
        backgroundColor: Colors.green[800],
        body: Column(
          children: [
            SizedBox(
              height: statusBar,
            ),
            Stack(
              children: [
                Container(
                    width: width,
                    height: height,
                    color: Colors.green[800],
                    child: Column(
                      children: [
                        Expanded(
                          flex: 12,
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        RotatedBox(
                                            quarterTurns: 1,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  loginPress = true;
                                                });
                                              },
                                              child: Text(
                                                "Login",
                                                style: TextStyle(
                                                    fontWeight:
                                                        (loginPress == true)
                                                            ? FontWeight.bold
                                                            : FontWeight.normal,
                                                    color: Colors.white,
                                                    fontSize: 30),
                                              ),
                                            )),
                                        RotatedBox(
                                            quarterTurns: 1,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  loginPress = false;
                                                });
                                              },
                                              child: Text(
                                                "Signup",
                                                style: TextStyle(
                                                    fontWeight:
                                                        (loginPress == false)
                                                            ? FontWeight.bold
                                                            : FontWeight.normal,
                                                    color: Colors.white,
                                                    fontSize: 30),
                                              ),
                                            )),
                                        SizedBox(),
                                        SizedBox(),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.greenAccent[400],
                                                blurRadius: 2,
                                                spreadRadius: 2)
                                          ],
                                          color: Colors.greenAccent[400],
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                          )),
                                      child: (loginPress == true)
                                          ? Column(
                                              children: [
                                                Expanded(
                                                    flex: 1, child: SizedBox()),
                                                Expanded(
                                                  flex: 13,
                                                  child: Container(
                                                    color: Colors.yellow,
                                                  ),
                                                )
                                              ],
                                            )
                                          : Column(
                                              children: [
                                                Expanded(
                                                    flex: 1, child: SizedBox()),
                                                Expanded(
                                                  flex: 13,
                                                  child: Container(
                                                    child: Signup(),
                                                  ),
                                                )
                                              ],
                                            )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            )
          ],
        ));
  }
}
