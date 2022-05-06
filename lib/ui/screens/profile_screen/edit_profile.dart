import 'package:finsem_client/controller/signin/gsign.dart';
import 'package:finsem_client/controller/user_controller.dart';
import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _nameController = TextEditingController.fromValue(
      TextEditingValue(text: UserController.loggedInUser.value.name));
  TextEditingController _addController = TextEditingController.fromValue(
      TextEditingValue(text: UserController.loggedInUser.value.add));
  TextEditingController _bioController = TextEditingController.fromValue(
      TextEditingValue(text: UserController.loggedInUser.value.bio));
  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
      title: 'Edit Profile',
      isBack: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: CircleAvatar(
              foregroundImage: NetworkImage(
                FirebaseAuth.instance.currentUser!.photoURL!,
              ),
              radius: 50,
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
            ),
          ),
          TextField(
            controller: _bioController,
            decoration: InputDecoration(
              labelText: 'Bio',
              hintText: 'faiz',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              disabledBorder: inputDecoration(),
              enabledBorder: inputDecoration(),
              border: inputDecoration(),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                SignIn.signOut();
              },
              child: const Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}

InputBorder inputDecoration() {
  return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.orange),
      borderRadius: BorderRadius.circular(10));
}
