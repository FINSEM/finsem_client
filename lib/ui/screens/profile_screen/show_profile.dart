import 'package:finsem_client/controller/api_helper.dart';
import 'package:finsem_client/controller/signin/gsign.dart';
import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:finsem_client/ui/screens/profile_screen/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ShowProfile extends StatelessWidget {
  const ShowProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
      title: 'Profile',
      isBack: true,
      leading: IconButton(
        icon: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EditProfile()));
        },
      ),
      child: SizedBox(
        height: 350.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: CircleAvatar(
                foregroundImage: NetworkImage(
                  FirebaseAuth.instance.currentUser!.photoURL!,
                ),
                radius: 100,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              ApiHelper.loggedInUser.value.name,
              style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              ApiHelper.loggedInUser.value.bio,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Text(
              ApiHelper.loggedInUser.value.add,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Container(
                height: 35,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFE9573A),
                      Color(0xFFFDC424),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Sign Out',
                    style: GoogleFonts.roboto(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                SignIn.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
