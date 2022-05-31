import 'package:finsem_client/dummy_data/dummy_data.dart';
import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:finsem_client/ui/screens/home_screen/event_view.dart';
import 'package:finsem_client/ui/screens/txn_screen/txn_screen.dart';
import 'package:finsem_client/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
        title: 'Donation',
        child: Container(
          color: FinColours.secondaryColor,
          child: Center(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: DummyData().donation.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EventView(selectedEvent: index)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 7.0, right: 10.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 5,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Row(
                            children: [
                              Container(
                                height: 80.h,
                                width: 85.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(DummyData()
                                          .donation[index]
                                          .imageLink),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              const SizedBox(width: 15),
                              SizedBox(
                                width: 160.w,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DummyData().donation[index].title,
                                      style: GoogleFonts.poppins(
                                        color: FinColours.secondaryTextColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      DummyData().donation[index].description,
                                      style: GoogleFonts.roboto(
                                        color: Colors.grey.shade800,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 3),
                                    Row(
                                      children: [
                                        const Icon(
                                          LineIcons.mapMarker,
                                          color: Color(0xffe77c42),
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          DummyData().donation[index].location,
                                          style: GoogleFonts.poppins(
                                            color: FinColours.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          DummyData().donation[index].date,
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                          ),
                                        ),
                                        DummyData().donation[index].donation
                                            ? GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const TxnScreen()));
                                                },
                                                child: Container(
                                                  height: 20,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    gradient:
                                                        const LinearGradient(
                                                      colors: [
                                                        Color(0xFFE9573A),
                                                        Color(0xFFFDC424),
                                                      ],
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Donate",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
        isBack: false);
  }
}
