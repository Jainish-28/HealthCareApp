import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellness_wave/Constants/color_constant.dart';
import 'package:wellness_wave/OnBoarding/onboarding_1.dart';
import 'package:wellness_wave/UiScreens/bottom_navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final _auth=FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user=_auth.currentUser;

    if(user!=null)
      {
        Timer(const Duration(seconds: 2), () {
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const BottomNavbar()));
        });
      }
    else
      {
        Timer(const Duration(seconds: 2), () {
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const Onboarding1()));
        });
      }

  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final constant=ColorConstant();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/wellness_wave.png",height: height*0.2,width: width*0.5,),
            Text("Wellness Wave",style: GoogleFonts.inter(fontSize: height*0.03,color: constant.blackColor,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
