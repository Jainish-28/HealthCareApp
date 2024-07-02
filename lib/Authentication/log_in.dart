import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellness_wave/Authentication/sign_up.dart';
import 'package:wellness_wave/Constants/color_constant.dart';
import 'package:wellness_wave/Constants/ui_helper.dart';
import 'package:wellness_wave/UiScreens/bottom_navigation_bar.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final constant = ColorConstant();
    final field = UiDesign();

    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Log In",
          style: GoogleFonts.inter(
              fontSize: height * 0.025, color: constant.blackColor),
          textAlign: TextAlign.start,
        ),
        backgroundColor: constant.whiteColor,
        elevation: 0,
        iconTheme: IconThemeData(color: constant.blackColor),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: constant.whiteColor,
          height: height * 1,
          width: width * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Hey ! Welcome Back ",
                style: GoogleFonts.inter(
                    fontSize: height * 0.025, color: constant.primaryColor),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Image.asset(
                "assets/Authentication/login.png",
                height: height * 0.4,
                width: width * 0.8,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Form(
                  child: Column(
                children: [
                  field.emailField(email, constant.lightWhite),
                  field.passwordField(password, constant.lightWhite),
                  SizedBox(
                    height: height * 0.045,
                  ),
                  field.desBtn((){
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email.text.toString(),
                            password: password.text.toString())
                        .then((value) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavbar())))
                        .onError((error, stackTrace) =>
                            field.flutterToast(error.toString()));
                  }, "Log In", 325, 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("If You Don't Have An Account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.inter(
                                color: constant.primaryRed,
                                fontSize: height * 0.019),
                          ))
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
