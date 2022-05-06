import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:finsem_client/ui/screens/support_screen/report_issue.dart';
import 'package:finsem_client/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
        isBack: false,
        title: "Customer Support",
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          height: 600.h,
          width: 360.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReportIssue()));
                },
                child: SizedBox(
                  width: 320.w,
                  height: 45.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Report An Issue",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.navigate_next,
                        size: 40,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 320.w,
                height: 45.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Track My Tickets",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.navigate_next,
                      size: 40,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Text("Contact Us",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: FinColours.grey.withOpacity(0.15),
                ),
                height: 100,
                width: 300.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.phone_in_talk,
                          size: 20,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "+91 9999999999",
                          style: TextStyle(
                              color: FinColours.secondaryTextColor,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.mail_rounded,
                          size: 20,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "finsem004@gmail.com",
                          style: TextStyle(
                              color: FinColours.secondaryTextColor,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
