import 'package:get/get.dart';
import 'package:upi_pay/upi_pay.dart';
import 'dart:developer' as debug;

class TxnController extends GetxController {
  RxList<ApplicationMeta> appMetaList = <ApplicationMeta>[].obs;

  Future<List<ApplicationMeta>> getApps() async {
    List<ApplicationMeta> appMeta = await UpiPay.getInstalledUpiApplications(
        paymentType: UpiApplicationDiscoveryAppPaymentType.nonMerchant,
        statusType: UpiApplicationDiscoveryAppStatusType.all);
    appMetaList.value = appMeta;
    return appMeta;
  }

  doUpiTransation(
      {required ApplicationMeta appMeta,
      String amount = '100.00',
      String note = 'Monthly Payment'}) async {
    final UpiTransactionResponse response = await UpiPay.initiateTransaction(
      amount: amount,
      app: appMeta.upiApplication,
      receiverName: 'Faiz',
      receiverUpiAddress: '9691406178@paytm',
      transactionRef: 'UPITXREF0001',
      transactionNote: note,
    );
    debug.log(response.status.toString());
  }
}
