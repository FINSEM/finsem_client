import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:finsem_client/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
        isBack: false,
        title: "History",
        child: Container(
          color: FinColours.secondaryColor,
          child: Center(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: FinColours.transactionBackground3,
                        ),
                        height: 80,
                        width: 320.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Maintenance Feb",
                                  style: GoogleFonts.montserrat(
                                    color: FinColours.grey,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "Paid",
                                  style: GoogleFonts.montserrat(
                                    color: FinColours.green,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "₹ 14,000",
                                  style: GoogleFonts.poppins(
                                      color: FinColours.secondaryTextColor,
                                      fontSize: 18),
                                ),
                                Text(
                                  "16 Feb",
                                  style: GoogleFonts.poppins(
                                      color: FinColours.secondaryTextColor,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  );
                }),
          ),
        ));
  }
}
