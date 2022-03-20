import 'package:finsem_client/ui/component/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class dashboardScreen extends StatelessWidget {
  const dashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Color(0xffffffff),
            height: 130.h,
            child: Stack(
              children: [
                Container(
                  height: 83.h,
                  color: Color(0xff483c94),
                ),
                Column(
                  children: [
                    Container(
                      // decoration: const BoxDecoration(
                      //   color: Color(0xff483c94),
                      //   borderRadius:
                      //       BorderRadius.only(bottomLeft: Radius.circular(40.0)),
                      // ),
                      color: Color(0xff483c94),
                      height: 80.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    SvgIcon(
                                      color: 0xffffffff,
                                      assetPath: "assets/icon/menu-dots.svg",
                                      size: 37,
                                      //onPressed: ,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Dhiraj Gupta",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    Text(
                                      "Tower1  1304",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.white),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),

                          //display user name in dashboard

                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20, // Image radius
                                backgroundImage:
                                    AssetImage("assets/images/profile_pic.jpg"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ClipPath(
                      clipper: WaveClipperTwo(),
                      child: Container(
                        height: 50.h,
                        color: Color(0xff483c94),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
