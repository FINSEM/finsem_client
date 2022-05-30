import 'package:finsem_client/controller/txn/txn_controller.dart';
import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:finsem_client/ui/screens/txn_screen/txn_success.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class TxnScreen extends StatefulWidget {
  const TxnScreen({Key? key}) : super(key: key);

  @override
  State<TxnScreen> createState() => _TxnScreenState();
}

class _TxnScreenState extends State<TxnScreen> {
  TextEditingController? _amountController;
  TextEditingController? _mssgController;
  static Razorpay? _razorpay;
  final TxnController _txnController = Get.find<TxnController>();

  @override
  void initState() {
    _amountController = TextEditingController();
    _mssgController = TextEditingController();
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    _amountController!.dispose();
    _mssgController!.dispose();
    _razorpay!.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Navigator.pop(context);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const TxnSuccessScreen()));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
      title: 'Transaction',
      isBack: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: _amountController,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  labelText: 'Amount',
                  hintText: "100",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                // initialValue: 'Enter Amount',
                keyboardType: TextInputType.number,
                autocorrect: false,

                autovalidateMode: AutovalidateMode.always,
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _mssgController,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  labelText: 'Message',
                  hintText: "Monthly Payment",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                // initialValue: 'Enter Amount',
                keyboardType: TextInputType.text,
                autocorrect: false,

                autovalidateMode: AutovalidateMode.always,
              ),
            ],
          ),
          MaterialButton(
            onPressed: () {
              _txnController.doTransation(
                razorpay: _razorpay!,
                amount: double.parse(_amountController!.text == ''
                    ? '100'
                    : _amountController!.text),
                note: _mssgController!.text == ''
                    ? 'Monthly Payment'
                    : _mssgController!.text,
              );
            },
            color: Colors.green,
            child: SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  'Pay Now',
                  style: GoogleFonts.ubuntu(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
