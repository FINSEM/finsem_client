import 'package:finsem_client/dummy_data/dummy_Events.dart';
import 'package:finsem_client/ui/screens/home_screen/event_view.dart';
import 'package:finsem_client/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  //HomeScreen({required this.event})
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
              child: SingleChildScrollView(
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
                            color: Color(0xFFEFA8C9),
                            border: Border.all(
                              color: Colors.black54,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Due Amount",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        "₹ ${"3500"}",
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Due Date",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text("${"7 Apr 2022"}",
                                          style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              minWidth: 150.0,
                              height: 35,
                              color: Color(0xFF971B69),
                              child: new Text('Pay Now',
                                  style: new TextStyle(
                                      fontSize: 16.0, color: Colors.white)),
                              onPressed: () {},
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        child: CarouselSlider.builder(
                      itemCount: 1,
                      options: CarouselOptions(
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: false,
                        aspectRatio: 16 / 6,
                        enlargeCenterPage: true,
                        autoPlay: true,
                      ),
                      itemBuilder: (ctx, index, realIdx) {
                        return Container(
                          height: 200.h,
                          width: 300.w,
                          color: Colors.grey.withOpacity(0.6),
                          child: Text(index.toString()),
                        );
                      },
                    )),
                    const SizedBox(
                      height: 15,
                    ),

                    ///Event List View
                    SizedBox(
                      height: 255.h,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,

                          ///--------------------///
                          //TODO: Update the list length with backend
                          ///--------------------///
                          itemCount: DummyData().events.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EventView(selectedEvent: index),
                                    ),
                                  );
                                },
                                child: Material(
                                  borderRadius: BorderRadius.circular(25),
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 140.h,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: FittedBox(
                                                //TODO: Network IMAGE
                                                child: Image.asset(
                                                    //TODO: Update the image url path with backend
                                                    DummyData()
                                                        .events[index]
                                                        .imagePath),
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
                                              //TODO: pass event Title from backend

                                              Text(
                                                DummyData().events[index].title,
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
                                                    //TODO: Update the time with backend
                                                    DummyData()
                                                        .events[index]
                                                        .date,
                                                    style: TextStyle(
                                                        color: FinColours.grey,
                                                        fontSize: 16.0),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    LineIcons.mapMarker,
                                                    color: Color(0xffe77c42),
                                                    size: 25,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    //TODO: Update the location with backend

                                                    DummyData()
                                                        .events[index]
                                                        .location,
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
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
