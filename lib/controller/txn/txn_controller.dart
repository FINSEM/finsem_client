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

  doUpiTransation(ApplicationMeta appMeta) async {
    final UpiTransactionResponse response = await UpiPay.initiateTransaction(
      amount: '100.00',
      app: appMeta.upiApplication,
      receiverName: 'Faiz',
      receiverUpiAddress: '9691406178@paytm',
      transactionRef: 'UPITXREF0001',
      transactionNote: 'Monthly payment',
    );
    debug.log(response.status.toString());
  }
}
