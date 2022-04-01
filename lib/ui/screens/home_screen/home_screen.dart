import 'package:finsem_client/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              width: 360.w,
              height: 305.h,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff56565e),
                  Color(0xff1b1f2a),
                  Color(0xff1b1f2a),
                  Color(0xff56565e),
                ],
              )),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),

                  /// APP Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            LineIcons.crown,
                            color: Color(0xffffffff),
                            size: 40,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "PrinceTown",
                            style: TextStyle(
                                color: Color(0xffffffff), fontSize: 22),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: CircleAvatar(
                          radius: 20, // Image radius
                          backgroundImage:
                              AssetImage("assets/images/profile_pic.jpg"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  /// Pending Payment

                  Container(
                      width: 300.w,
                      height: 115.h,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color(0xFFffffff)
                              .withOpacity(0.3), //here i want to add opacity

                          border: Border.all(
                            color: Colors.black54,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "Pending Payment",
                          style:
                              TextStyle(color: Color(0xffffffff), fontSize: 22),
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),

                  ///Event List View
                  SizedBox(
                    height: 255.h,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(25),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 140.h,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: FittedBox(
                                            //TODO: Network IMAGE
                                            child: Image.asset(
                                                'assets/images/event_image.jpg'),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      height: 80.h,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Event Name",
                                            style: TextStyle(
                                                color: FinColours
                                                    .secondaryTextColor,
                                                fontSize: 22.0),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                LineIcons.calendar,
                                                color: Color(0xffe77c42),
                                                size: 25,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "10-15 May 2022",
                                                style: TextStyle(
                                                    color: FinColours.grey,
                                                    fontSize: 16.0),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                LineIcons.mapMarker,
                                                color: Color(0xffe77c42),
                                                size: 25,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Orion Mall",
                                                style: TextStyle(
                                                    color: FinColours.grey,
                                                    fontSize: 15.0),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
