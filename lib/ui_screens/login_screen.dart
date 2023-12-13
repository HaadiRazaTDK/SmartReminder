import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haadi/ui_screens/signup_screen.dart';

import '../utils/img_paths.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  var userController = TextEditingController();
  var passController = TextEditingController();
  bool passVisible = true;

  void showToast(String data) {
    var messengerState = ScaffoldMessenger.of(context);
    messengerState.removeCurrentSnackBar();
    messengerState.showSnackBar(SnackBar(
      content: Align(
        alignment: Alignment.center,
        child: Text(data,
            style: GoogleFonts.poppins(
              color: Colors.red,
              fontSize: 16,
            )),
      ),
      backgroundColor: Color(0xFF343541),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      showCloseIcon: false,
    ));
  }

  void _togglePasswordVisibility() {
    setState(() {
      passVisible = !passVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF0EAEA),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Container(
            padding: EdgeInsets.only(left: 3),
            width: 30, // Set the desired width
            height: 25, // Set the desired height
            decoration: BoxDecoration(
              color: Color(0xFFF0EAEA),// Set the background color
            ),
            child: IconButton(
                iconSize: 25,
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: screenHeight,
          width: screenWidth - 80,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: screenHeight * 0.045,
                ),
                Center(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'SmartRe',
                        style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF163EA7),)),
                    TextSpan(
                        text: 'minder',
                        style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF04E6D8),)),
                  ])),
                ),
                SizedBox(
                  height: screenHeight * 0.07,
                ),
                Text(
                  'Log in',
                  style: GoogleFonts.poppins(
                      color: Color(0xFF4D8AF0),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: userController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter a username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.black,
                          ),
                          hintText: "Enter Username",
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: passController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        obscureText: passVisible,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                            onPressed: _togglePasswordVisibility,
                            icon: Icon(
                              passVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Enter Password",
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.poppins(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.06,
                ),
                Container(
                  width: screenWidth - 8,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(5, 15),
                        blurRadius: 10,
                        color: Colors.grey.shade200,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.06,
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 5.0),
                            height: 1,
                            color: Colors.grey,
                            width: (screenWidth * 0.5) - 90,
                          ),
                          Text(
                            'or login with',
                            style: GoogleFonts.poppins(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 13,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5.0),
                            height: 1,
                            color: Colors.grey,
                            width: (screenWidth * 0.5) - 90,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 60,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.grey.shade100,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(3, 5),
                                    blurRadius: 5,
                                    color: Color(0xFFD3D3D3).withOpacity(.99),
                                  ),
                                ]),
                            child: Center(
                              child: Image.asset(
                                AssetImages.fbImg,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 60,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.grey.shade100,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(3, 5),
                                    blurRadius: 5,
                                    color: Color(0xFFD3D3D3).withOpacity(.99),
                                  ),
                                ],),
                            child: Center(
                              child: Image.asset(
                                AssetImages.googleImg,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 60,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.grey.shade100,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(3, 5),
                                    blurRadius: 5,
                                    color: Color(0xFFD3D3D3).withOpacity(.99),
                                  ),
                                ]),
                            child: Center(
                              child: Image.asset(
                                AssetImages.appleImg,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an account?",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupScreen()));
                            },
                            child: Text(
                              " Sign up",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
