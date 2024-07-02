import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellness_wave/Constants/color_constant.dart';



class UiDesign extends StatefulWidget {
  UiDesign({super.key});

  @override
  State<UiDesign> createState() => _UiDesignState();
  final constant = ColorConstant();
  bool click =true;

  // String? validateEmail(String value) {
  //   const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
  //       r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
  //       r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
  //       r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
  //       r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
  //       r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
  //       r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  //   final regex = RegExp(pattern);
  //
  //   return value.isNotEmpty && !regex.hasMatch(value)
  //       ? 'Enter a valid email address'
  //       : null;
  // }

  Widget navigateButton(VoidCallback voidCallback) {
    return ElevatedButton(
        onPressed: () {
          voidCallback();
        },
        style: ElevatedButton.styleFrom(
            fixedSize: Size(60,60),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            backgroundColor: constant.primaryColor),
        child: Icon(Icons.arrow_forward_sharp,size: 30,color: constant.whiteColor,));
  }

  Widget desBtn(VoidCallback voidCallback,String name,double width,double height) {
    return ElevatedButton(
        onPressed: () {
          voidCallback();
        },
        style: ElevatedButton.styleFrom(
            fixedSize: Size(width,height),
            side: const BorderSide(),
            backgroundColor: constant.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        child: Text(
          name,
          style: GoogleFonts.inter(fontSize: 16, color: constant.lightWhite),
        ));
  }

  Widget signUp(VoidCallback voidCallback) {
    return ElevatedButton(
        onPressed: () {
          voidCallback();
        },
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(325, 50),
            side: BorderSide(color: constant.primaryColor),
            backgroundColor: constant.whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        child: Text(
          "SignUp",
          style: GoogleFonts.inter(fontSize: 16, color: constant.primaryColor),
        ));
  }

  Widget emailField(TextEditingController _controller,Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0,vertical: 20.0),
      child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(50)),
          child: TextFormField(
              controller: _controller,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  hintStyle: GoogleFonts.inter(color: constant.textColor),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: constant.textColor,
                  )))),
    );
  }

  Widget passwordField(TextEditingController _controller,Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(50)),
          child: TextFormField(
              controller: _controller,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  hintStyle:  GoogleFonts.inter(color: constant.textColor),
                  border: InputBorder.none,
                  suffixIcon: click ? IconButton(onPressed: (){
                  }, icon: Icon(Icons.remove_red_eye)): IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye_outlined)),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: constant.textColor,
                  )))),
    );
  }

  Widget carouselSlider(String image){
    return Container(
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover)
      ),
    );
  }

  Widget stringValues(String value, double fontSize,Color color) {
    return Text(
        value,
        style: GoogleFonts.inter(fontSize: fontSize,color: color),
    );
  }

  Widget submitButton(String btnName,double width ,double height,Color textColor,Color backColor,double fontSize,VoidCallback voidCallback) {
    return ElevatedButton(
        onPressed: () {
          voidCallback();
        },
        style: ElevatedButton.styleFrom(

            fixedSize: Size(width,height),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
            ),
            backgroundColor: backColor
        ),
        child: Text(
          btnName,
          style: GoogleFonts.inter(fontSize: fontSize,color: textColor),
        ));
  }

  void flutterToast(String message)
  {
   Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: constant.primaryColor,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}

class _UiDesignState extends State<UiDesign> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
   }
}


