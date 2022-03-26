import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text('Support Screen'),
          ),
        ),
      ),
    );
  }
}
