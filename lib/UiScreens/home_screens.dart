import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:wellness_wave/Constants/color_constant.dart';
import 'package:wellness_wave/Constants/ui_helper.dart';
import 'package:wellness_wave/Models/all_model.dart';
import 'package:wellness_wave/Models/news_model.dart';
import 'package:wellness_wave/Models/news_view_model.dart';
import 'package:wellness_wave/UiScreens/info_doctor.dart';
import 'package:wellness_wave/UiScreens/news_details.dart';
import 'package:wellness_wave/UiScreens/screen_doctor.dart';
import 'package:wellness_wave/UiScreens/screen_hospital.dart';
import 'package:wellness_wave/UiScreens/screen_news.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<DrModel> drList=[
    DrModel(img: "assets/Doctor/doctor_1.png",name: "Dr. Kirti Patel",type: "Chardiologist",about: "A cardiologist is a medical doctor who studies and treats diseases and conditions of the cardiovascular system — the heart and blood vessels — including heart rhythm disorders, coronary artery disease, heart attacks, heart defects and infections, and related disorders.",number: 6351638146,rating: 4.5),
    DrModel(img: "assets/Doctor/doctor_2.png",name: "Dr. Mahima Shah",type: "Psychologist",about: "Psychologists are mental health professionals who study cognitive, emotional, and social processes, and how people relate to each other and their environment",number: 9965236587,rating: 4.3),
    DrModel(img: "assets/Doctor/doctor_3.png",name: "Dr. Hetali Patel",type: "Radiologist",about: "Radiologists are medical doctors that specialize in diagnosing and treating injuries and diseases using medical imaging (radiology) procedures (exams/tests) such as X-rays, computed tomography (CT), magnetic resonance imaging (MRI), nuclear medicine, positron emission tomography (PET) and ultrasound.",number: 6351986524,rating: 4.4),
    DrModel(img: "assets/Doctor/doctor_4.png",name: "Dr. Gaurang Desai",type: "Orthopedist",about: "An orthopedist (also spelled orthopaedist) is a medical specialty focusing on injuries and diseases affecting your musculoskeletal system (bones, muscles, joints and soft tissues).",number: 9898632514,rating: 4.4),
    DrModel(img: "assets/Doctor/doctor_5.png",name: "Dr. Minakshi ",type: "Chardiologist",about: "A cardiologist is a medical doctor who studies and treats diseases and conditions of the cardiovascular system — the heart and blood vessels — including heart rhythm disorders, coronary artery disease, heart attacks, heart defects and infections, and related disorders.",number: 8969351526,rating: 4.1),

  ];
  List<DrModel> drTempList=[];
  NewsViewModel newsViewModel = NewsViewModel();

  final format = DateFormat("MMMM dd- yy ");
  @override
  void initState() {
    // TODO: implement initState
    drTempList=drList;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final color = ColorConstant();
    final uiHelp = UiDesign();
    return Scaffold(
      appBar: AppBar(
        title: uiHelp.stringValues("WellnessWave", 20, color.blackColor),
        backgroundColor: color.whiteColor.withOpacity(0.1),
      ),
      body: Container(
        color: color.shadowBlack.withOpacity(0.1),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              child: Container(
                  height: height * 0.05,
                  decoration: BoxDecoration(
                      color: color.textField,
                      borderRadius: BorderRadius.circular(25)),
                  child: TextField(

                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: const Icon(Icons.search),
                          hintText: "Search Anything here",
                          hintStyle: TextStyle(color: color.textColor)))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration:  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: IconButton(
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const ScreenDoctor()));},
                      icon: FaIcon(FontAwesomeIcons.stethoscope,
                          color: color.primaryColor),),
                  ),
                  Container(
                    decoration:  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.pills,
                          color: color.primaryColor,
                        )),
                  ),
                  Container(
                    decoration:  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: IconButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const ScreenHospital()));},
                        icon: FaIcon(FontAwesomeIcons.hospital,
                            color: color.primaryColor)),
                  ),
                  Container(
                    decoration:  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: IconButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const ScreenNews()));},
                        icon: FaIcon(FontAwesomeIcons.newspaper,
                            color: color.primaryColor)),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               uiHelp.stringValues("Doctor", 15, color.blackColor),
                uiHelp.stringValues("Pharmacy", 15, color.blackColor),
                uiHelp.stringValues("Hospital", 15, color.blackColor),
                uiHelp.stringValues("NEWS", 15, color.blackColor),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 5),
              child: CarouselSlider(
                  items: [
                    uiHelp.carouselSlider("assets/Carousel/abha.png"),
                    uiHelp.carouselSlider("assets/Carousel/ayushyaman.png"),
                    uiHelp.carouselSlider("assets/Carousel/vatsalya.png")
                  ],
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  uiHelp.stringValues("Doctor", 20, color.blackColor),
                  TextButton(
                      onPressed: () {},
                      child: uiHelp.stringValues("See All", 17, color.primaryColor),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height*0.27,
              child: ListView.builder(
                  itemCount: drTempList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                return InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>InformationDoctor(
                    img: drTempList[index].img.toString(),
                    name: drTempList[index].name.toString(),
                    type: drTempList[index].type.toString(),
                    about: drTempList[index].about.toString(),
                    number: drTempList[index].number.toString(),
                    rating: drTempList[index].rating.toString(),
                  )));},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(drTempList[index].img.toString()),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          drTempList[index].name.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          drTempList[index].type.toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          drTempList[index].number.toString(),
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  uiHelp.stringValues("Articles", 20, color.blackColor),
                  TextButton(
                      onPressed: () {},
                      child: uiHelp.stringValues("See All", 17, color.primaryColor),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FutureBuilder<CategoriesNewsModel>(
                future: newsViewModel.fetchCategoriesNewsApi('health'),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitCircle(
                        color: Colors.indigoAccent,
                        size: 40,
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          DateTime dateTime = DateTime.parse(snapshot
                              .data!.articles![index].publishedAt
                              .toString());
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsDetailsScreen(
                                  newsImage: snapshot
                                      .data!.articles![index].urlToImage
                                      .toString(),
                                  newsTitle: snapshot
                                      .data!.articles![index].title
                                      .toString(),
                                  newsDate: snapshot
                                      .data!.articles![index].publishedAt
                                      .toString(),
                                  author: snapshot
                                      .data!.articles![index].author
                                      .toString(),
                                  description: snapshot
                                      .data!.articles![index].description
                                      .toString(),
                                  content: snapshot
                                      .data!.articles![index].content
                                      .toString(),
                                  source: snapshot
                                      .data!.articles![index].source!.name
                                      .toString())));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot
                                          .data!.articles![index].urlToImage
                                          .toString(),
                                      fit: BoxFit.cover,
                                      height: height * 0.18,
                                      width: width * 0.3,
                                      placeholder: (context, url) => Container(
                                        child: spinkit2,
                                      ),
                                      errorWidget: (context, url, error) =>
                                      const Icon(Icons.error,
                                          color: Colors.redAccent),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                        height: height * 0.18,
                                        padding: EdgeInsets.only(left: 15),
                                        child: Column(
                                          children: [
                                            Text(
                                              snapshot.data!.articles![index].title
                                                  .toString(),
                                              maxLines: 3,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Spacer(),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  snapshot.data!.articles![index]
                                                      .source!.name
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w700),
                                                ),
                                                Text(
                                                  format.format(dateTime),
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w700),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          );
                        });
                  }
                },
              ),
            ),

          ],
        ),
      )
    );
  }
  final spinkit2 = const SpinKitFadingCircle(
    color: Colors.amber,
    size: 50,
  );
}
