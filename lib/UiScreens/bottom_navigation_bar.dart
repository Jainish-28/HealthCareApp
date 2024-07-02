import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:wellness_wave/Constants/color_constant.dart';
import 'package:wellness_wave/UiScreens/health_details.dart';
import 'package:wellness_wave/UiScreens/home_screens.dart';
import 'package:wellness_wave/UiScreens/medicine_cart.dart';
import 'package:wellness_wave/UiScreens/profile_details.dart';


class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {

  final constant=ColorConstant();
  int _selectedIndex=0;

  final List<Widget> _navBar=[
    const HomeScreen(),
    const MedicineCart(),
    const HealthDetails(),
    const ProfileDetails()
  ];
  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _navBar[_selectedIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
          onTap: _onItemSelected,
          items: [
            SalomonBottomBarItem(icon: const Icon(Icons.home), title:  const  Text("Home"),selectedColor: constant.primaryColor),
            SalomonBottomBarItem(icon: const Icon(Icons.medical_services), title:  const  Text("Medicine"),selectedColor: Colors.blueAccent),
            SalomonBottomBarItem(icon: const Icon(Icons.monitor_heart_rounded), title:  const  Text("Home"),selectedColor: constant.primaryRed),
            SalomonBottomBarItem(icon: const Icon(Icons.account_circle), title:  const  Text("Profile"),selectedColor: Colors.greenAccent),
          ]),
    );
  }
}
