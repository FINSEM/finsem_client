import 'package:finsem_client/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CrowdfundingPaymentScreen extends StatelessWidget {
  const CrowdfundingPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FinColours.secondaryColor,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: FinColours.transactionBackground3,
                    ),
                    height: 80,
                    width: 300.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Smile Foundation",
                                style: TextStyle(
                                    color: FinColours.grey, fontSize: 16),
                              ),
                              Text(
                                "₹ 100",
                                style: TextStyle(
                                    color: FinColours.secondaryTextColor,
                                    fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Due",
                                style: TextStyle(
                                    color: FinColours.red, fontSize: 18),
                              ),
                              Text(
                                "14 Mar",
                                style: TextStyle(
                                    color: FinColours.red, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            );
          }),
    );
  }
}