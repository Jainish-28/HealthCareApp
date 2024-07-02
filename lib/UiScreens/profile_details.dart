import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wellness_wave/Constants/color_constant.dart';
import 'package:wellness_wave/Constants/ui_helper.dart';
import 'package:wellness_wave/OnBoarding/onboarding_1.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final color = ColorConstant();
    final uiHelper = UiDesign();

    final auth = FirebaseAuth.instance;
    final user=auth.currentUser;
    return Scaffold(
        body: Container(
      height: height * 1,
      width: width * 1,
      color: color.primaryColor,
      child: ListView(
        shrinkWrap: true,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/Authentication/login.png",
                height: height * 0.2,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidHeart,
                      color: color.primaryRed,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    uiHelper.stringValues("HeartRate", 10, color.lightGreen),
                    const SizedBox(
                      height: 5,
                    ),
                    uiHelper.stringValues("215bpm", 15, color.whiteColor)
                  ],
                ),
                const VerticalDivider(
                  color: Colors.red,
                  width: 10,
                ),
                Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.fire,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    uiHelper.stringValues("Calories", 10, color.lightGreen),
                    SizedBox(
                      height: 5,
                    ),
                    uiHelper.stringValues("756cal", 15, color.whiteColor)
                  ],
                ),
                VerticalDivider(
                  color: Colors.red,
                  width: 10,
                ),
                Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.dumbbell,
                      color: color.blackColor,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    uiHelper.stringValues("Weight", 10, color.lightGreen),
                    SizedBox(
                      height: 5,
                    ),
                    uiHelper.stringValues("103lbs", 15, color.whiteColor)
                  ],
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: color.whiteColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.pencil,
                        color: Colors.blue,
                      ),
                      SizedBox(width: width * 0.03),
                      uiHelper.stringValues(
                          "Edit Profile", 17, color.blackColor),
                    ],
                  ),
                  const Divider(),
                  SizedBox(height: height * 0.03),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.locationCrosshairs,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      uiHelper.stringValues("My Address", 17, color.blackColor)
                    ],
                  ),
                  const Divider(),
                  SizedBox(height: height * 0.03),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.clockRotateLeft,
                        color: Colors.greenAccent,
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      uiHelper.stringValues("History", 17, color.blackColor),
                    ],
                  ),
                  const Divider(),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.phone,
                        color: Colors.orangeAccent,
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      uiHelper.stringValues(
                          "Talk to Our Support", 17, color.blackColor),
                    ],
                  ),
                  const Divider(),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.circleInfo,
                        color: CupertinoColors.activeBlue,
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      uiHelper.stringValues("About Us", 17, color.blackColor),
                    ],
                  ),
                  const Divider(),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.signalMessenger,
                        color: Colors.pinkAccent,
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      uiHelper.stringValues("Feedback", 17, color.blackColor),
                    ],
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: uiHelper.submitButton("LogOut", 350, 50,
                        color.whiteColor, color.primaryColor, 20, () {
                      auth.signOut()
                          .then((value) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Onboarding1())))
                          .onError((error, stackTrace) =>
                              uiHelper.flutterToast(error.toString()));
                    }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
