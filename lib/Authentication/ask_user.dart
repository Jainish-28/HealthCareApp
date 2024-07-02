import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellness_wave/Authentication/log_in.dart';
import 'package:wellness_wave/Authentication/sign_up.dart';
import 'package:wellness_wave/Constants/color_constant.dart';
import 'package:wellness_wave/Constants/ui_helper.dart';


class AskUser extends StatefulWidget {
  const AskUser({super.key});

  @override
  State<AskUser> createState() => _AskUserState();
}

class _AskUserState extends State<AskUser> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final constant = ColorConstant();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/wellness_wave.png", height: height * 0.3),
            Text(
              "Let's Get Started",
              style: GoogleFonts.inter(
                  color: constant.blackColor, fontSize: height * 0.03),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
              child: Text(
                "Login to enjoy the features we’ve provided, and stay healthy!",
                style: GoogleFonts.inter(
                    color: constant.shadowBlack, fontSize: height * 0.020),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: height* .02),
              child: UiDesign().desBtn(() {Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogIn())); },"Log IN",325,50),
            ),
            UiDesign().signUp(() {Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUp()));})
          ],
        ),
      ),
    );
  }
}
