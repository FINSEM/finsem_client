import 'package:finsem_client/dummy_data/dummy_data.dart';
import 'package:finsem_client/ui/screens/home_screen/event_view.dart';
import 'package:finsem_client/ui/screens/home_screen/noticeView.dart';
import 'package:finsem_client/ui/screens/profile_screen/show_profile.dart';
import 'package:finsem_client/ui/screens/txn_screen/txn_screen.dart';
import 'package:finsem_client/utils/colours.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  //HomeScreen({required this.event})
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
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
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            LineIcons.crown,
                            color: Color(0xffffffff),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "PrinceTown",
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ShowProfile()));
                        }),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: CircleAvatar(
                            radius: 16, // Image radius
                            backgroundImage: NetworkImage(
                                FirebaseAuth.instance.currentUser!.photoURL!),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 300.w,
                  height: 124.h,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Maintenance",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.redAccent,
                                ),
                              ),
                              Text(
                                "Due Amount",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "₹ ${"3500"}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                "Due Date",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text("7 June 2022",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Container(
                          height: 35,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.0),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFE9573A),
                                Color(0xFFFDC424),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Pay Now',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TxnScreen()));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Events',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CarouselSlider.builder(
                  itemCount: DummyData().events.length,
                  options: CarouselOptions(
                    aspectRatio: 16 / 6.5,
                    viewportFraction: 0.8.h,
                    // enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                  itemBuilder: (ctx, index, realIdx) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EventView(selectedEvent: index)));
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(bottom: 7.0, right: 10.0),
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
                                            .events[index]
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        DummyData().events[index].title,
                                        style: GoogleFonts.poppins(
                                          color: FinColours.secondaryTextColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        DummyData().events[index].description,
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
                                            DummyData().events[index].location,
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
                                            DummyData().events[index].date,
                                            style: GoogleFonts.poppins(
                                              fontSize: 10,
                                            ),
                                          ),
                                          DummyData().events[index].donation
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
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
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
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notice',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CarouselSlider.builder(
                  itemCount: DummyData().notice.length,
                  options: CarouselOptions(
                    aspectRatio: 5.5 / 3,
                    viewportFraction: 0.8.h,
                    autoPlayAnimationDuration: const Duration(seconds: 3),

                    //autoPlayInterval = Duration(seconds: 4),
                    // enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                  itemBuilder: (ctx, index, realIdx) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NoticeView(selectedNotice: index)));
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(bottom: 7.0, right: 10.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: Row(
                              children: [
                                Container(
                                  height: 150.h,
                                  width: 100.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(DummyData()
                                            .notice[index]
                                            .imageLink),
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                const SizedBox(width: 8),
                                SizedBox(
                                  width: 160.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        DummyData().notice[index].title,
                                        style: GoogleFonts.poppins(
                                          color: FinColours.secondaryTextColor,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        DummyData().notice[index].description,
                                        style: GoogleFonts.roboto(
                                          color: Colors.grey.shade800,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        maxLines: 8,
                                        overflow: TextOverflow.ellipsis,
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
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
