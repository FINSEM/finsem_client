import 'package:get/get.dart';
import 'dart:developer' as debug;

import 'package:razorpay_flutter/razorpay_flutter.dart';

class TxnController extends GetxController {
  doTransation(
      {required Razorpay razorpay,
      double amount = 100,
      String note = 'Monthly Payment'}) async {
    var options = {
      'key': 'rzp_test_pAkUdRPOwbFrYo',
      'amount': amount * 100,
      'name': 'Finsem',
      'description': note,
      'prefill': {
        'contact': '8888888888',
        'email': 'test@razorpay.com',
      },
    };
    try {
      razorpay.open(options);
    } catch (e) {
      debug.log(e.toString());
    }
  }
}
