import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wellness_wave/Constants/color_constant.dart';
import 'package:wellness_wave/Constants/ui_helper.dart';


class MedicineCart extends StatefulWidget {
  const MedicineCart({super.key});

  @override
  State<MedicineCart> createState() => _MedicineCartState();
}

class _MedicineCartState extends State<MedicineCart> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final color = ColorConstant();
    final uiHelp = UiDesign();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: uiHelp.stringValues("Pharmacy", 20, color.blackColor),
            backgroundColor: color.whiteColor,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
            ],
            automaticallyImplyLeading: false,
            iconTheme: IconThemeData(color: color.blackColor),
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                child: Stack(
                  children: [
                    Container(
                      height: height * 0.2,
                      width: width * 1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: color.blackColor.withOpacity(0.5)),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                color.primaryColor,
                                color.whiteColor.withOpacity(0.9),
                              ])),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 5),
                              child: uiHelp.stringValues(
                                  "Order Quickly With" + "\n" + "Prescription",
                                  17,
                                  color.blackColor),
                            ),
                            uiHelp.desBtn(() {}, "Prescription", 140, 25)
                          ],
                        ),
                        Image.asset(
                          "assets/Medicine/medi.png",
                          height: height * 0.2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    uiHelp.stringValues(
                        "Popular Medicine", 20, color.blackColor),
                    TextButton(
                      onPressed: () {},
                      child: uiHelp.stringValues(
                          "See All", 17, color.primaryColor),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.3,
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/Medicine/medi.png",
                              height: height * 0.12,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Paracitamol",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "200 pcs",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  "Rs-150",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(FontAwesomeIcons.solidSquarePlus,size: 30,color: color.primaryColor,),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    uiHelp.stringValues(
                        "Popular Medicine", 20, color.blackColor),
                    TextButton(
                      onPressed: () {},
                      child: uiHelp.stringValues(
                          "See All", 17, color.primaryColor),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.299,
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
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
                            Image.asset(
                              "assets/Medicine/medi.png",
                              height: height * 0.12,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Paracitamol",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "200 pcs",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  "Rs-150",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(FontAwesomeIcons.solidSquarePlus,size: 30,color: color.primaryColor,),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          )),
    );
  }
}
