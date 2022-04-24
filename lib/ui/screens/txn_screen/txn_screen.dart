import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:flutter/material.dart';

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
        children: [
          const Text('Amount'),
          TextFormField(
            controller: _amountController,
            maxLines: 1,
            initialValue: 'Enter Amount',
            keyboardType: TextInputType.number,
            autovalidateMode: AutovalidateMode.always,
          ),
          TextFormField(
            controller: _mssgController,
            maxLines: 1,
            initialValue: 'Enter Amount',
            keyboardType: TextInputType.text,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.always,
          ),
        ],
      ),
    );
  }
}
