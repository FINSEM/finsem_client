import 'package:finsem_client/controller/signin/gsign.dart';
import 'package:finsem_client/controller/user_controller.dart';
import 'package:finsem_client/ui/component/nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<UserController>();
    final FirebaseAuth auth = FirebaseAuth.instance;

    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.data != null) {
          UserController.init();
          return const BottomNavBar();
        } else {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/Welcome.png',
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 380.h),
                          child: Text(
                            'Living Hood.',
                            style: GoogleFonts.ubuntu(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 280.w,
                          child: Text(
                            "One Sollution to manage all your livelihood.",
                            style: GoogleFonts.poppins(
                                fontSize: 17.sp,
                                color: const Color(0xffBABABA),
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            height: 50,
                            width: 400.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color.fromARGB(255, 227, 215, 181),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/google.svg',
                                  height: 24,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Login',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            SignIn.signin();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
