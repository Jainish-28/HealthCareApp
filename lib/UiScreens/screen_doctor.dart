import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wellness_wave/Constants/color_constant.dart';
import 'package:wellness_wave/Constants/ui_helper.dart';
import 'package:wellness_wave/Models/all_model.dart';
import 'package:wellness_wave/UiScreens/bottom_navigation_bar.dart';
import 'info_doctor.dart';


class ScreenDoctor extends StatefulWidget {
  const ScreenDoctor({super.key});

  @override
  State<ScreenDoctor> createState() => _ScreenDoctorState();
}

class _ScreenDoctorState extends State<ScreenDoctor> {
  List<DrModel> drList=[
    DrModel(img: "assets/Doctor/doctor_1.png",name: "Dr. Kirti Patel",type: "Chardiologist",about: "A cardiologist is a medical doctor who studies and treats diseases and conditions of the cardiovascular system — the heart and blood vessels — including heart rhythm disorders, coronary artery disease, heart attacks, heart defects and infections, and related disorders.",number: 6351638146,rating: 4.5),
    DrModel(img: "assets/Doctor/doctor_2.png",name: "Dr. Mahima Shah",type: "Psychologist",about: "Psychologists are mental health professionals who study cognitive, emotional, and social processes, and how people relate to each other and their environment",number: 9965236587,rating: 4.3),
    DrModel(img: "assets/Doctor/doctor_3.png",name: "Dr. Hetali Patel",type: "Radiologist",about: "Radiologists are medical doctors that specialize in diagnosing and treating injuries and diseases using medical imaging (radiology) procedures (exams/tests) such as X-rays, computed tomography (CT), magnetic resonance imaging (MRI), nuclear medicine, positron emission tomography (PET) and ultrasound.",number: 6351986524,rating: 4.4),
    DrModel(img: "assets/Doctor/doctor_4.png",name: "Dr. Gaurang Desai",type: "Orthopedist",about: "An orthopedist (also spelled orthopaedist) is a medical specialty focusing on injuries and diseases affecting your musculoskeletal system (bones, muscles, joints and soft tissues).",number: 9898632514,rating: 4.4),
    DrModel(img: "assets/Doctor/doctor_5.png",name: "Dr. Minakshi ",type: "Chardiologist",about: "A cardiologist is a medical doctor who studies and treats diseases and conditions of the cardiovascular system — the heart and blood vessels — including heart rhythm disorders, coronary artery disease, heart attacks, heart defects and infections, and related disorders.",number: 8969351526,rating: 4.1),
  ];

  List<DrModel> drTempList=[];
  @override
  void initState() {
    // TODO: implement initState
    drTempList=drList;
    super.initState();
  }
  void _searchDoctor(String search) {
    if (search.isEmpty) {
      drTempList = drList;
    } else {
      List<DrModel> result = drList.where((dr) => dr.type!.toLowerCase().contains(search.toLowerCase())).toList();
      drTempList = result;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final color = ColorConstant();
    final uiHelp = UiDesign();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: uiHelp.stringValues("Doctors", 25, color.blackColor),
        backgroundColor: color.whiteColor.withOpacity(0.1),
        leading: IconButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const BottomNavbar()));}, icon: const Icon(FontAwesomeIcons.arrowLeft))
      ),
      body: ListView(
        shrinkWrap: true,
        children:[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
            child: Container(
                height: height * 0.05,
                decoration: BoxDecoration(
                    color: color.whiteColor,
                    borderRadius: BorderRadius.circular(25)),
                child: TextField(
                  onChanged: (value)=> _searchDoctor(value),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search Anything here",
                        hintStyle: TextStyle(color: color.textColor)))),
          ),
          SizedBox(
            height: height*0.995,
            child: drTempList.isNotEmpty? ListView.builder(
                itemCount: drTempList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>InformationDoctor(
                        img: drTempList[index].img.toString(),
                        name: drTempList[index].name.toString(),
                        type: drTempList[index].type.toString(),
                        about: drTempList[index].about.toString(),
                        number: drTempList[index].number.toString(),
                        rating: drTempList[index].rating.toString(),
                      )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.0),
                      child: Container(
                        height: height*0.17,
                        width: width*0.85,
                        decoration: BoxDecoration(
                            border: Border.all(color: color.blackColor.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Image.asset(drTempList[index].img.toString(),fit: BoxFit.cover,height: height*0.15,),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  uiHelp.stringValues(drTempList[index].name.toString(), 20, color.blackColor),
                                  const SizedBox(height: 5),
                                  uiHelp.stringValues(drTempList[index].type.toString(), 15, color.shadowBlack),
                                  const SizedBox(height: 5),
                                  uiHelp.stringValues(drTempList[index].number.toString(), 17, color.blueColor),
                                  const SizedBox(height: 5),
                                  Container(
                                    height: height*0.04,
                                    width: width*0.2,
                                    decoration: BoxDecoration(
                                        color: color.lightGreen.withOpacity(0.2)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(FontAwesomeIcons.solidStar,color: color.primaryColor,size: 20,),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: uiHelp.stringValues(drTempList[index].rating.toString(), 17, color.primaryColor),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }): Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 90.0),
                      child: Image.asset("assets/Doctor/no_data.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 200.0,left: 90),
                      child: uiHelp.stringValues("Sorry No Data Found",20, color.blackColor),
                    )
                  ],
                ),
          ),]
      ),
    );
  }

}
