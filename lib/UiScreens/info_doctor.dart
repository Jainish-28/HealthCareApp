import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wellness_wave/Constants/color_constant.dart';
import 'package:wellness_wave/Constants/ui_helper.dart';


class InformationDoctor extends StatefulWidget {
  final String img,name,number,rating,type,about;
  const InformationDoctor({required this.img,required this.name,required this.type,required this.about,required this.number,required this.rating,super.key});

  @override
  State<InformationDoctor> createState() => _InformationDoctorState();
}

class _InformationDoctorState extends State<InformationDoctor> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final color = ColorConstant();
    final uiHelp = UiDesign();
    return Scaffold(
      appBar: AppBar(
        title:uiHelp.stringValues("Doctor Details", 20, color.blackColor)
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(widget.img),
                SizedBox(width: width*0.05,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    uiHelp.stringValues(widget.name, 20, color.blackColor),
                    const SizedBox(height: 5),
                    uiHelp.stringValues(widget.type, 15, color.shadowBlack),
                    const SizedBox(height: 25),
                    // uiHelp.stringValues(widget.number.toString(), 13, color.blueColor),
                    // const SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          height: height*0.02,
                          width: width*0.13,
                          decoration: BoxDecoration(
                              color: color.lightGreen.withOpacity(0.2),
                            borderRadius: BorderRadius

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.solidStar,color: color.primaryColor,size: 12,),
                              uiHelp.stringValues(widget.rating.toString(), 13, color.primaryColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5),
            child: uiHelp.stringValues("About Doctor", 21, color.blackColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5),
            child: Container(
              height: height*0.15,
              width: width*0.9,
              child: ReadMoreText(
                widget.about,
                trimLines: 4,
                colorClickableText: color.primaryColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read more',
                trimExpandedText: 'Read less',
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: color.primaryColor),
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: uiHelp.stringValues("Working Time",21, color.blackColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
            child: uiHelp.stringValues("Monday - Friday", 19, color.primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: uiHelp.stringValues("Morning  :  10:30 to 1:30", 19, color.blackColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: uiHelp.stringValues("Evening  :  4:00 to 7.00", 19, color.blackColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
            child: uiHelp.stringValues("Weekend", 19, color.primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: uiHelp.stringValues("Morning  :  11:30 to 1:30", 19, color.blackColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: uiHelp.stringValues("Evening  :  5:00 to 7.00", 19, color.blackColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 140),
            child: uiHelp.submitButton("Book Appointment", 300, 50, color.whiteColor, color.primaryColor, 20, () async{

              final Uri url=Uri(scheme: 'tel',path: "${widget.number}");
              if(await canLaunchUrl(url))
              {
              await launchUrl(url);
              }
              else
              {
              print("cannot launch");
              }
            }),
          )
        ],
      ),

    );
  }
}
