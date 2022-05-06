import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:flutter/material.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(title: 'Donation', child: Container(), isBack: false);
  }
}
