import 'package:finsem_client/dummy_data/dummy_data.dart';
import 'package:finsem_client/ui/screens/txn_screen/txn_screen.dart';
import 'package:finsem_client/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class EventView extends StatelessWidget {
  final int selectedEvent;

  const EventView({Key? key, required this.selectedEvent}) : super(key: key);
//DummyData().events[selectedEvent].title
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 360.w,
            height: 250.h,
            child: ClipRRect(
                //borderRadius: BorderRadius.circular(20),
                child: FittedBox(
              child: Image.network(DummyData().events[selectedEvent].imageLink),
              fit: BoxFit.fill,
            )),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: Row(
                children: [
                  RawMaterialButton(
                    elevation: 20.0,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    constraints: const BoxConstraints.tightFor(
                      width: 45.0,
                      height: 45.0,
                    ),
                    shape: const CircleBorder(),
                    fillColor: FinColours.grey.withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(8, 3, 8, 8),
                height: 480.h,
                width: 360.w,
                decoration: const BoxDecoration(
                    color: Color(0xFFffffff),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          width: 80.h,
                          child: const Divider(thickness: 2),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        DummyData().events[selectedEvent].title,
                        style: TextStyle(
                            color: FinColours.secondaryTextColor,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Description",
                        style: TextStyle(
                            color: FinColours.secondaryTextColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        DummyData().events[selectedEvent].description,
                        style: TextStyle(
                          color: FinColours.secondaryTextColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          ClipOval(
                            child: Material(
                              color: const Color(0xfff4e5df), // Button color
                              child: InkWell(
                                //splashColor: Colors.red, // Splash color
                                onTap: () {},
                                child: const SizedBox(
                                    width: 45,
                                    height: 45,
                                    child: Icon(
                                      LineIcons.mapMarker,
                                      color: Color(0xffe77c42),
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            DummyData().events[selectedEvent].location,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: FinColours.secondaryTextColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          ClipOval(
                            child: Material(
                              color: const Color(0xfff4e5df), // Button color
                              child: InkWell(
                                //splashColor: Colors.red, // Splash color
                                onTap: () {},
                                child: const SizedBox(
                                    width: 45,
                                    height: 45,
                                    child: Icon(
                                      LineIcons.calendar,
                                      color: Color(0xffe77c42),
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DummyData().events[selectedEvent].date,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: FinColours.grey.withOpacity(0.7),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                DummyData().events[selectedEvent].time,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: FinColours.secondaryTextColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DummyData().events[selectedEvent].donation
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TxnScreen(
                                                    isDonation: true)));
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFFE9573A),
                                          Color(0xFFFDC424),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Donate",
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
