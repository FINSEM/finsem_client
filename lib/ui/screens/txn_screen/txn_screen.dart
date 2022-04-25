import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:finsem_client/ui/screens/txn_screen/upi_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TxnScreen extends StatefulWidget {
  const TxnScreen({Key? key}) : super(key: key);

  @override
  State<TxnScreen> createState() => _TxnScreenState();
}

class _TxnScreenState extends State<TxnScreen> {
  TextEditingController? _amountController;
  TextEditingController? _mssgController;

  @override
  void initState() {
    _amountController = TextEditingController();
    _mssgController = TextEditingController();
    super.initState();
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpiScreen(
                            amount: _amountController!.text,
                            message: _mssgController!.text,
                          )));
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
