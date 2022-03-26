import 'package:finsem_client/controller/signin/gsign.dart';
import 'package:finsem_client/controller/user_controller.dart';
import 'package:finsem_client/ui/screens/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          return const HomeScreen();
        } else {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(),
                Container(),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        SignIn.signin();
                      },
                      child: const Text(
                        'G - Sign IN',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
