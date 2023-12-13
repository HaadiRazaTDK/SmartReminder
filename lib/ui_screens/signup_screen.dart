import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haadi/ui_screens/login_screen.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  var userController = TextEditingController();
  var passController = TextEditingController();
  var conPassController = TextEditingController();
  bool isActiveMode = true;
  bool _isActiveMode = false;
  bool passVisible = true;
  bool pass_Visible = true;

  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
  );
  final passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$',
  );
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

  void togglePasswordVisibility() {
    setState(() {
      pass_Visible = !pass_Visible;
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
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.black,)),
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
                SizedBox(height: screenHeight * 0.045,),
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
                SizedBox(height: screenHeight * 0.07,),
                Text('Sign up',
                  style: GoogleFonts.poppins(
                      color: Color(0xFF4D8AF0),
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                  ),),
                SizedBox(height: screenHeight * 0.05,),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        height: 25,
                      ),
                      TextFormField(
                        controller: passController,
                        obscureText: passVisible,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter a password';
                          }
                          if (!passwordRegex.hasMatch(value!)) {
                            return 'Password must contain at least 1 lowercase, 1 uppercase, and 1 number';
                          }
                          return null;
                        },
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
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: conPassController,
                        validator: (value) {
                          if (value!=passController.text) {
                            return 'Passwords do not match';
                          }
                        },
                        obscureText: pass_Visible,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                            onPressed: togglePasswordVisibility,
                            icon: Icon(
                              pass_Visible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Confirm Password",
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
                SizedBox(height: screenHeight * 0.07,),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, right: 20.0),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 450),
                            curve: Curves.easeInOut,
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                              color: isActiveMode? Colors.black : Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                    alignment: isActiveMode
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isActiveMode = !isActiveMode;
                                        });
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Daily reports',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),),
                          SizedBox(height: 5.0,),
                          Text('Get a daily activity report via email',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 11,
                            ),),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: screenHeight * 0.01,),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, right: 20.0),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 450),
                            curve: Curves.easeInOut,
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                              color: _isActiveMode? Colors.black : Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: _isActiveMode
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isActiveMode = !_isActiveMode;
                                      });
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Weekly summary',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),),
                          SizedBox(height: 5.0,),
                          Text('Get a weekly activity report via email',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 11,
                            ),),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: screenHeight * 0.05,),
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
                    child: Text('Create account',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),),
                  ),
                ),
                SizedBox(height: screenHeight * 0.06,),
                Center(
                  child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Already have an account?",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                            ),),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
                            child: Text(" Login",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),),
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
