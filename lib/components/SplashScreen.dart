
// splash screen
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/view/homeScreen/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
  void initState() {
  Timer(Duration(seconds: 5),(){
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (controller)=>HomeScreen()));

  });
    // TODO: implement initState
    super.initState();
  }
 void dispose() {
   // controller.dispose();
   // TODO: implement dispose
   super.dispose();
 }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(

          image: DecorationImage(image: AssetImage('images/splash.png'),
          fit: BoxFit.cover
          )
        ),
      ),
    );
  }
}

