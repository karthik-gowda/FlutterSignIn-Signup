// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();

  Future save() async {
    var res = await http.post(
      "https://flutter-signin-sigup.herokuapp.com/signin",
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8'
      },
      body: jsonEncode({'email': user.email, 'password': user.password}),
      // body: <String, String>{
      //   'email': user.email,
      //   'password': user.password
      // }
    );
    var result = json.decode(res.body);
    var userName = (result["name"]);
    var userEmail = (result["email"]);
    var userAccType = (result["acctype"]);
    print(userName);
    if (res.body == "null") {
      print('Cannot Connect');
    } else {
      print(result);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Dashboard(userName ,userEmail)));
    }
  }

  User user = User('', '', '', '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Positioned(
            //     top: 0,
            //     child: SvgPicture.asset(
            //       'images/top.svg',
            //       width: 400,
            //       height: 150,
            //     )),
            Container(
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      Text("Signin",
                          style: GoogleFonts.pacifico(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.blue)),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                            controller: TextEditingController(text: user.email),
                            onChanged: (value) {
                              user.email = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Email';
                              } else if (RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return null;
                              } else {
                                return 'Enter a valid Email';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Enter Email",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                            controller:
                                TextEditingController(text: user.password),
                            onChanged: (value) {
                              user.password = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Password';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Password",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                              ),
                            )),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            height: 50,
                            width: 400,
                            child: TextButton(
                              child: const Text('SignIn'),
                              style: TextButton.styleFrom(
                                primary: Colors.blue,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  save();
                                } else {
                                  print("Not Ok");
                                }
                              },
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(65, 20, 0, 0),
                        child: Row(children: [
                          const Text(
                            "Not have account ?",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()));
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
