import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopping_app/Pages/Authorization/SIgnupHandler.dart';
import 'package:shopping_app/Pages/Starting/Starter.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  SignupHandler signupHandler = SignupHandler();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();

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
                      "USERNAME",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Username cant be empty";
                        } else {
                          return null;
                        }
                      },
                      controller: usernameController,
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
                      "EMAIL",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
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
                          fontSize: 20),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 50.0),
                  child: Column(children: [
                    Text(
                      "ADDRESS",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Address cant be empty";
                        } else {
                          return null;
                        }
                      },
                      controller: addressController,
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
                      "PHONE NUMBER",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Phone Number cant be empty";
                        } else if (value.length != 10) {
                          return "Phone Number should be of 10 numbers";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: phonenumberController,
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
                  height: 30,
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
                          "UserName": usernameController.text,
                          "Email": emailController.text,
                          "Password": passwordController.text,
                          "Address": addressController.text,
                          "PhoneNumber": phonenumberController.text
                        };
                        var response =
                            await signupHandler.post('/users/register', data);
                        print(response);
                        if (response['msg'] == 'success') {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: Text(
                                        "You have successfully signed up, please login to have access to panel"));
                              });
                          Timer(Duration(seconds: 4), () {
                            Get.to(() => Starter());
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
                                "SIGNUP",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 30),
                              ),
                            ),
                          )
                        : CircularProgressIndicator()),
              ],
            ),
          ),
        ));
  }
}
