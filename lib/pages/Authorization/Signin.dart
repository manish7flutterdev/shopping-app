import 'package:flutter/material.dart';
import 'package:shopping_app/Pages/Authorization/SigninHandler.dart';
import 'package:get/get.dart';
import 'package:shopping_app/pages/Homepage.dart';
import 'package:shopping_app/pages/Main%20Controller/main_controller.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  SigninHandler signinHandler = SigninHandler();
  MainController mainController = Get.put(MainController());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _globalkey = GlobalKey<FormState>();

  bool circular = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Form(
          key: _globalkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 50.0),
                  child: Column(children: [
                    Text(
                      "EMAIL",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) return "Email cant be empty";
                        if (!value.contains("@")) return "Email is invalid";
                        return null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                          //            errorText: validate ? null : errorText,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ))),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 50.0),
                  child: Column(children: [
                    Text(
                      "PASSWORD",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Password cant be empty";
                        } else if (value.length < 6) {
                          return "Password Length should more than 6 letter";
                        } else {
                          return null;
                        }
                      },
                      controller: passwordController,
                      decoration: InputDecoration(
                          //            errorText: validate ? null : errorText,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ))),
                    )
                  ]),
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                    onTap: () async {
                      if (_globalkey.currentState.validate()) {
                        setState(() {
                          circular = true;
                        });
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }

                        Map<String, String> data = {
                          "Email": emailController.text,
                          "Password": passwordController.text,
                        };
                        var response =
                            await signinHandler.post('/users/login', data);
                        //  print(response['result']);
                        print(response);
                        if (response != null) {
                          String userid = response['result'];

                          var res = await mainController.fetchUsers(userid);
                          if (res == 'success') {
                            Get.to(() => Homepage());
                            setState(() {
                              circular = false;
                            });
                          } else {}
                        } else {
                          print("There was error please log in again");
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: Text(
                                        "Please enter correct Email and Password"));
                              });
                          emailController.text = "";
                          passwordController.text = "";
                          setState(() {
                            circular = false;
                          });
                        }
                      } else {
                        print("Pease validate");
                      }
                    },
                    child: (circular == false)
                        ? Container(
                            width: width / 2,
                            height: height / 9,
                            decoration: BoxDecoration(
                                color: Colors.grey[700],
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "SIGNIN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 30),
                              ),
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          )),
              ],
            ),
          ),
        ));
  }
}
