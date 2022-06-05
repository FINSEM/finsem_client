import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finsem_client/controller/api.dart';
import 'package:finsem_client/ui/screens/txn_screen/txn_screen.dart';
import 'package:finsem_client/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class EventView extends StatelessWidget {
  final int selectedEvent;

  const EventView({Key? key, required this.selectedEvent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<DocumentSnapshot<Map<String, dynamic>>>>(
          future: Api.fetchEvents(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Stack(
              children: [
                SizedBox(
                  width: 360.w,
                  height: 400.h,
                  child: ClipRRect(
                      //borderRadius: BorderRadius.circular(20),
                      child: FittedBox(
                    child: Image.network(
                        snap.data![selectedEvent].data()!['imgUrl']),
                    fit: BoxFit.cover,
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
                      padding: const EdgeInsets.fromLTRB(15, 3, 15, 8),
                      height: 400.h,
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
                              snap.data![selectedEvent].data()!['title'],
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
                              snap.data![selectedEvent].data()!['desc'],
                              style: TextStyle(
                                color: FinColours.secondaryTextColor,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                const SizedBox(width: 15),
                                Text(
                                  snap.data![selectedEvent].data()!['location'],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: FinColours.secondaryTextColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                ClipOval(
                                  child: Material(
                                    color:
                                        const Color(0xfff4e5df), // Button color
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
                                      snap.data![selectedEvent].data()!['date'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: FinColours.grey.withOpacity(0.7),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snap.data![selectedEvent].data()!['Time'],
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
                                snap.data![selectedEvent].data()!['donation']
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
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
