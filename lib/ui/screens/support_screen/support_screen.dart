import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:finsem_client/ui/screens/service_screen/housekeeping_screen.dart';
import 'package:finsem_client/ui/screens/support_screen/report_issue.dart';
import 'package:finsem_client/ui/screens/service_screen/services.dart';
import 'package:finsem_client/ui/screens/support_screen/track_issue.dart';
import 'package:finsem_client/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: Padding(
          padding: const EdgeInsets.only(left: 5, top: 5, right: 15, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                'Raise a ticket',
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(children: [
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Report An Issue",
                            style: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Icon(
                            Icons.navigate_next,
                            size: 40,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TrackIssues()));
                    },
                    child: SizedBox(
                      //TrackIssues
                      width: 320.w,
                      height: 45.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Track My Tickets",
                            style: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Icon(
                            Icons.navigate_next,
                            size: 40,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ]),
              ),
              Text(
                'Find a service',
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CookScreen()));
                    },
                    child: SizedBox(
                      width: 320.w,
                      height: 45.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "House Keeping",
                            style: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Icon(
                            Icons.navigate_next,
                            size: 40,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ServicesScreen()));
                    },
                    child: SizedBox(
                      width: 320.w,
                      height: 45.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Services",
                            style: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Icon(
                            Icons.navigate_next,
                            size: 40,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text("Contact Us",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                              "+91 9926758761",
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
                ]),
              ),
            ],
          ),
        ));
  }
}
