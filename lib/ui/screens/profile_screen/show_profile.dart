import 'package:finsem_client/controller/signin/gsign.dart';
import 'package:flutter/material.dart';

class ShowProfile extends StatelessWidget {
  const ShowProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        onPressed: () {
          Navigator.pop(context);
          SignIn.signOut();
        },
        child: const Text('Sign out'),
      )),
    );
  }
}
