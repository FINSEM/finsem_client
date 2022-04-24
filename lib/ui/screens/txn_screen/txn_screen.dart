import 'package:flutter/material.dart';
import 'package:upi_pay/upi_pay.dart';
import 'package:finsem_client/controller/txn/txn_controller.dart';
import 'package:get/get.dart';

class TxnScreen extends StatefulWidget {
  const TxnScreen({Key? key}) : super(key: key);

  @override
  State<TxnScreen> createState() => _TxnScreenState();
}

class _TxnScreenState extends State<TxnScreen> {
  final TxnController _txnController = Get.find<TxnController>();

  @override
  void initState() {
    _txnController.getApps();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: _txnController.appMetaList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: _txnController.appMetaList[index].iconImage(48),
              title: Container(
                margin: const EdgeInsets.only(top: 4),
                alignment: Alignment.center,
                child: Text(
                  _txnController.appMetaList[index].upiApplication.appName,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
