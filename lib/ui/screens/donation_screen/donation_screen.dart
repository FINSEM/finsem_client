import 'package:flutter/material.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text('Donations'),
          ),
        ),
      ),
    );
  }
}
