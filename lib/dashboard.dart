import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/signin.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var userName;
  var userEmail;

  Dashboard(this.userName, this.userEmail, {Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardTextStyle =  const TextStyle(
        fontFamily: 'Montserrat Regular',
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1)
    );
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(children: <Widget>[
          Container(
          height: size.height * .3,
          decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('assets/images/top_header.png')),
            ),
          ),
          SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      ),
                      const SizedBox(width: 16),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.userName,
                                style: const TextStyle(
                                    fontFamily: 'Montserrat Medium',
                                    color: Colors.white,
                                    fontSize: 20)),
                             Text(widget.userEmail,
                                style: const TextStyle(
                                    fontFamily: 'Montserrat Medium',
                                    color: Colors.white,
                                    fontSize: 10))
                          ]),
                      const SizedBox(width: 70),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(                    
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(2, 138, 250, 1)),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => Signin()));
                          },
                          child: const Text('LogOut'),
                        ),
                      )
                    ]),
              ),
              GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  primary: false,
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 4, //Box Shadow
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'images/man.png',
                                height: 130,
                                width: 130,
                              ),
                               Text("Personal Data", style: cardTextStyle,),
                            ]
                          )
                        ),
                  Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 4, //Box Shadow
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'images/man.png',
                                height: 130,
                                width: 130,
                              ),
                               Text("Personal Data", style: cardTextStyle,),
                            ]
                          )
                        ),
                  Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 4, //Box Shadow
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'images/man.png',
                                height: 130,
                                width: 130,
                              ),
                               Text("Personal Data", style: cardTextStyle,),
                            ]
                          )
                        ),
                  Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 4, //Box Shadow
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'images/man.png',
                                height: 130,
                                width: 130,
                              ),
                               Text("Personal Data", style: cardTextStyle,),
                            ]
                          )
                        ),
                  Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 4, //Box Shadow
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'images/man.png',
                                height: 130,
                                width: 130,
                              ),
                               Text("Personal Data", style: cardTextStyle,),
                            ]
                          )
                        ),
                  Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 4, //Box Shadow
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'images/man.png',
                                height: 130,
                                width: 130,
                              ),
                               Text("Personal Data", style: cardTextStyle,),
                            ]
                          )
                        )
                      ]
                    )
                  ]
                ),
              ),
            ),
          ]
        ),
      )

        //   body: Column(
        //     children: [
        //       Padding(padding:const EdgeInsets.all(8.0),
        //       child: Text("Welcome To Dashboard",
        //        style: GoogleFonts.pacifico(
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 30,
        //                 color: Colors.blue,
        //               )
        //       )
        //        ),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Center(

        //           child: Text("Hi " + widget.result.toString()
        //               // style: GoogleFonts.pacifico(
        //               //   fontWeight: FontWeight.bold,
        //               //   fontSize: 50,
        //               //   color: Colors.blue,
        //               // )
        //               ),
        //         ),
        //       ),
        //       Padding(padding: const EdgeInsets.fromLTRB(28, 400, 0,0),
        //       child: Center(
        //         child: TextButton(
        //                   style: ButtonStyle(
        //                     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        //                     backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(2, 138, 250, 1)),
        //                   ),
        //                   onPressed: () {
        //                      Navigator.pushReplacement(
        //                       context, MaterialPageRoute(builder: (context) => Signin()));
        //                   },
        //                   child: const Text('LogOut'),
        //                 )
        //       )
        //       )

        //     ],
        //   ),
        );
  }
}
