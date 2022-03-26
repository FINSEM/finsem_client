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
    return Container(
      color: Colors.white,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                width: 360.w,
                height: 305.h,
                decoration: BoxDecoration(
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
                        decoration: new BoxDecoration(
                            color: const Color(0xFFffffff)
                                .withOpacity(0.3), //here i want to add opacity

                            border: new Border.all(
                              color: Colors.black54,
                            ),
                            borderRadius: new BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Pending Payment",
                            style: TextStyle(
                                color: Color(0xffffffff), fontSize: 22),
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),

                    ///Event List View
                    Container(
                      height: 150.h,
                      child: Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  SizedBox(width: 16),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF000000)
                                            .withOpacity(
                                                0.3), //here i want to add opacity
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    width: 250.w,
                                    child: const Center(
                                        child: Text(
                                      "Events",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 36.0),
                                    )),
                                  ),
                                ],
                              );
                            }),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
