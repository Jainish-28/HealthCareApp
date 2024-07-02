import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellness_wave/Authentication/ask_user.dart';
import 'package:wellness_wave/Constants/color_constant.dart';
import 'package:wellness_wave/Constants/ui_helper.dart';

class OnBoarding3 extends StatefulWidget {
  const OnBoarding3({super.key});

  @override
  State<OnBoarding3> createState() => _OnBoarding3State();
}

class _OnBoarding3State extends State<OnBoarding3> {
  @override
  Widget build(BuildContext context) {
    final constants = ColorConstant();
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const AskUser()));}, child: Text("Skip",style: GoogleFonts.inter(color: constants.shadowBlack),)),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.045),
              child: Image.asset("assets/InformationPage/info_page_3.png"),
            ),
            Container(
              decoration: BoxDecoration(
                  color: constants.lightWhite,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25))),
              height: height * 0.347,
              width: width * 0.9,
              child: Padding(
                padding:
                EdgeInsets.symmetric(vertical: height*0.05,horizontal: width*0.05),
                child: Column(
                  children: [
                    Text(
                      "Get connect our Online Consultation",
                      style: GoogleFonts.inter(fontSize: height*0.03),
                    ),
                    SizedBox(height: height*0.05,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        UiDesign().navigateButton(() { Navigator.push(context, MaterialPageRoute(builder: (context)=>const AskUser())); })
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}