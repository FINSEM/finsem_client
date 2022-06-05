import 'package:finsem_client/controller/api_helper.dart';
import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController.fromValue(
      TextEditingValue(text: ApiHelper.loggedInUser.value.name));
  final TextEditingController _addController = TextEditingController.fromValue(
      TextEditingValue(text: ApiHelper.loggedInUser.value.add));
  final TextEditingController _bioController = TextEditingController.fromValue(
      TextEditingValue(text: ApiHelper.loggedInUser.value.bio));
  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
      title: 'Edit Profile',
      isBack: true,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 550.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: CircleAvatar(
                  foregroundImage: NetworkImage(
                    FirebaseAuth.instance.currentUser!.photoURL!,
                  ),
                  radius: 70.h,
                ),
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Name',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  disabledBorder: inputDecoration(),
                  enabledBorder: inputDecoration(),
                  border: inputDecoration(),
                  focusedBorder: inputDecoration(color: Colors.green),
                ),
              ),
              TextField(
                controller: _addController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: 'Tower 1',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  disabledBorder: inputDecoration(),
                  enabledBorder: inputDecoration(),
                  border: inputDecoration(),
                  focusedBorder: inputDecoration(color: Colors.green),
                ),
              ),
              TextField(
                controller: _bioController,
                decoration: InputDecoration(
                  labelText: 'Bio',
                  hintText: 'Bio',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  disabledBorder: inputDecoration(),
                  enabledBorder: inputDecoration(),
                  border: inputDecoration(),
                  focusedBorder: inputDecoration(color: Colors.green),
                ),
              ),
              Center(
                child: MaterialButton(
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
                        'Submit',
                        style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

InputBorder inputDecoration({Color color = Colors.orange}) {
  return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(10));
}
