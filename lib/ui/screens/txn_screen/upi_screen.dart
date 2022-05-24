import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:flutter/material.dart';

class UpiScreen extends StatefulWidget {
  final double amount;
  final String message;
  const UpiScreen({required this.amount, required this.message, Key? key})
      : super(key: key);

  @override
  State<UpiScreen> createState() => _UpiScreenState();
}

class _UpiScreenState extends State<UpiScreen> {
  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
      title: "Upi Apps",
      isBack: true,
      child: Container(),
    );
  }
}
