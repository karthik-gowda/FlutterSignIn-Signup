// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_application_1/signin.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/user.dart';
import 'package:http/http.dart' as http;

import 'dashboard.dart';

enum SingingCharacter { hcp, rep }

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  Future save() async {
    var res = await http
        .post("https://flutter-signin-sigup.herokuapp.com/signup", 
       headers: <String, String>{
      'Context-Type': 'application/json;charSet=UTF-8',
      'connection': 'keep-alive',
      "Accept": "application/json"
    }, body: <String, String>{
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'acctype': _character
          .toString(), //Have to convert boolean to string to store in db
    });
    print(res.body);
    var result = res.body;
    var userName = (result);
    var userEmail = (result);
    if (res.body == 'null') {
      print("Email Not available");
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Signin()));
    }
  }

  User user = User('', '', '', '');
  SingingCharacter? _character = SingingCharacter.hcp;
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
                      Text("Signup",
                          style: GoogleFonts.pacifico(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.blue)),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                            controller: TextEditingController(text: user.name),
                            onChanged: (value) {
                              user.name = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Name';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Name",
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
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Account Type"),
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          ),
                          ListTile(
                            title: const Text('HCP'),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.hcp,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('REP'),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.rep,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SizedBox(
                            height: 50,
                            width: 400,
                            child: TextButton(
                              child: const Text('Register'),
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
                        padding: const EdgeInsets.fromLTRB(65, 10, 0, 0),
                        child: Row(children: [
                          const Text(
                            "Already have account ?",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signin()));
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ]
                      ),
                    ),
                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
