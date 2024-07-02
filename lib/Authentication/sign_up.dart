import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellness_wave/Authentication/log_in.dart';
import 'package:wellness_wave/Constants/color_constant.dart';
import 'package:wellness_wave/Constants/ui_helper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final constant = ColorConstant();
    final field = UiDesign();

    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    final formKey=GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
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
                "Create Your Account Now !",
                style: GoogleFonts.inter(
                    fontSize: height * 0.025, color: constant.primaryColor),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Image.asset(
                "assets/AuthImage/signup.png",
                height: height * 0.4,
                width: width * 0.8,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Form(
                key: formKey,
                  child: Column(
                children: [
                  field.emailField(
                      email, constant.primaryColor.withOpacity(0.2)),
                  field.passwordField(
                      password, constant.primaryColor.withOpacity(0.2)),
                  SizedBox(
                    height: height * 0.045,
                  ),
                  field.signUp(() {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                        email: email.text.toString(),
                        password: password.text.toString())
                        .then((value) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogIn()))).onError((error, stackTrace) => field.flutterToast(error.toString()));
                 }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("If You Already Have Account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogIn()));
                          },
                          child: Text(
                            "Sign In",
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
