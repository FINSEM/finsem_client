import 'package:finsem_client/utils/colours.dart';
import 'package:flutter/material.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FinColours.secondaryColor,
      child: Center(child: Text("Upcoming Payment")),
    );
  }
}
