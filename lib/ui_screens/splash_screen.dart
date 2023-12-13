import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen(
      splash: Column(
        children: <Widget>[
          SizedBox(
            height: screenHeight * 0.3,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'SmartRe',
                style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF163EA7),)),
            TextSpan(
                text: 'minder',
                style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF04E6D8),)),
          ])),
          SizedBox(
            height: screenHeight * 0.5,
          ),
          Text(
            "be ready.",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 22,
            ),
          )
        ],
      ),
      backgroundColor: Color(0xFFF0EAEA),// Set to transparent
      nextScreen: LoginScreen(),
      splashIconSize: 900,
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
