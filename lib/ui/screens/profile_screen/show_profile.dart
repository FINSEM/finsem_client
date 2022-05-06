import 'package:finsem_client/controller/signin/gsign.dart';
import 'package:finsem_client/controller/user_controller.dart';
import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:finsem_client/ui/screens/profile_screen/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ShowProfile extends StatelessWidget {
  const ShowProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
      title: 'Profile',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              foregroundImage: NetworkImage(
                FirebaseAuth.instance.currentUser!.photoURL!,
              ),
              radius: 50,
            ),
          ),
          Row(
            children: [
              Text(
                'Name: ',
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(UserController.loggedInUser.value.name),
            ],
          ),
          Row(
            children: [
              Text(
                'Address: ',
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(UserController.loggedInUser.value.add),
            ],
          ),
          Row(
            children: [
              Text(
                'Bio: ',
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(UserController.loggedInUser.value.bio),
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              SignIn.signOut();
            },
            child: const Text('Sign out'),
          )
        ],
      ),
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
    );
  }
}
