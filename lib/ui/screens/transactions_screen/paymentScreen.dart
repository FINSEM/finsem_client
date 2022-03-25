import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(title: "Payments", child: Text("hello"));
  }
}
