import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:flutter/material.dart';
import 'package:upi_pay/upi_pay.dart';
import 'package:finsem_client/controller/txn/txn_controller.dart';
import 'package:get/get.dart';

class UpiScreen extends StatefulWidget {
  const UpiScreen({Key? key}) : super(key: key);

  @override
  State<UpiScreen> createState() => _UpiScreenState();
}

class _UpiScreenState extends State<UpiScreen> {
  final TxnController _txnController = Get.find<TxnController>();

  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
      title: "Upi Apps",
      isBack: true,
      child: FutureBuilder<List<ApplicationMeta>>(
        future: _txnController.getApps(),
        builder: (context, appMetaList) => ListView.builder(
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
