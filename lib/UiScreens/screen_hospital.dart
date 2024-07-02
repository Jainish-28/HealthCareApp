import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wellness_wave/Constants/color_constant.dart';
import 'package:wellness_wave/Constants/ui_helper.dart';
import 'package:wellness_wave/Models/all_model.dart';
import 'package:wellness_wave/UiScreens/bottom_navigation_bar.dart';


class ScreenHospital extends StatefulWidget {
  const ScreenHospital({super.key});

  @override
  State<ScreenHospital> createState() => _ScreenHospitalState();
}

class _ScreenHospitalState extends State<ScreenHospital> {

  List<HospitalModel> hospitalList=[
    HospitalModel(img:"assets/Hospital/hospital_1.png",name: "Zydus Hospital",address: "Zydus Hospitals Road, Nr. Sola Bridge, S.G. Highway, Ahmedabad - 380054,",helpLineNumber: "+91 89800 85200 "),
    HospitalModel(img:"assets/Hospital/hospital_2.png",name: "K.D. Hospital",address: "Vaishnodevi Circle, Sarkhej - Gandhinagar Hwy, Ahmedabad, Gujarat 382421,",helpLineNumber: "+91 79 6677 0003."),
    HospitalModel(img:"assets/Hospital/hospital_3.png",name: "Apollo Hospital",address: "Plot No.1 A, Bhat GIDC Estate, Gandhinagar – 382428, Gujarat, India.",helpLineNumber: "+91 8401801066 "),
    HospitalModel(img:"assets/Hospital/hospital_4.png",name: "CIMS Hospital",address: "Plot No. 67/1, Opp. Panchamrut Bunglows, · Near Shukan Mal, Off. Science City Road, · Sola, Ahmedabad – 380060.",helpLineNumber: "1800 309 9999. "),
  ];
  List<HospitalModel> hospitalTempList=[];
  @override
  void initState() {
    // TODO: implement initState
    hospitalTempList=hospitalList;
    super.initState();
  }
  void _searchHospital(String search) {
    if (search.isEmpty) {
      hospitalTempList = hospitalList;
    } else {
      List<HospitalModel> result = hospitalList.where((hospital) => hospital.name!.toLowerCase().contains(search.toLowerCase())).toList();
      hospitalTempList = result;
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
          title: uiHelp.stringValues("Hospital", 25, color.blackColor),
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
                      onChanged: (value)=> _searchHospital(value),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: const Icon(Icons.search),
                          hintText: "Search Anything here",
                          hintStyle: TextStyle(color: color.textColor)))),
            ),
            SizedBox(
              height: height*0.995,
              child: hospitalTempList.isNotEmpty? ListView.builder(
                  itemCount: hospitalTempList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.0),
                      child: Container(
                        height: height*0.20,
                        decoration: BoxDecoration(
                            border: Border.all(color: color.blackColor.withOpacity(0.7)),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)
                                  ),
                                  child: Image.asset(hospitalTempList[index].img.toString(),height: height*0.18,width: width*0.35,fit: BoxFit.cover,))
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  uiHelp.stringValues(hospitalTempList[index].name.toString(), 18, color.blackColor),
                                  const SizedBox(height: 5),
                                  Container(
                                      height:height*0.1,
                                      width: width*0.48,
                                      child: uiHelp.stringValues(hospitalTempList[index].address.toString(), 13, color.shadowBlack)),
                                  const SizedBox(height: 5),
                                  uiHelp.stringValues(hospitalTempList[index].helpLineNumber.toString(), 15, color.blueColor),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            )
                          ],
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
      )
    );
  }
}
