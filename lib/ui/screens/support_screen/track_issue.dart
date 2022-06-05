import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finsem_client/controller/api_helper.dart';
import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:finsem_client/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackIssues extends StatefulWidget {
  const TrackIssues({Key? key}) : super(key: key);

  @override
  State<TrackIssues> createState() => _TrackIssuesState();
}

class _TrackIssuesState extends State<TrackIssues> {
  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
        title: "Track Issues",
        isBack: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SizedBox(
              height: 700.h,
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: fetchTicket(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.red),
                      );
                    }
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 95.h,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Material(
                                borderRadius: BorderRadius.circular(15),
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Req: ${snapshot.data!.docs[index]['tBlockRoom']}",
                                            style: GoogleFonts.roboto(
                                              color:
                                                  FinColours.secondaryTextColor,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "Req Type : ${snapshot.data!.docs[index]['tType']}",
                                            style: GoogleFonts.poppins(
                                              color: FinColours.grey,
                                              fontSize: 12,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "ID: ${snapshot.data!.docs[index]['tID']}",
                                            style: GoogleFonts.poppins(
                                              color: FinColours.grey,
                                              fontSize: 12,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "Status : ${snapshot.data!.docs[index]['tstatus']}",
                                            style: GoogleFonts.poppins(
                                              color: FinColours.grey,
                                              fontSize: 12,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 60.h,
                                        child: Image.network(
                                          snapshot.data!.docs[index]['tImg'],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ),
        ));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchTicket() {
    return FirebaseFirestore.instance
        .collection('Issues')
        .where('userUid', isEqualTo: ApiHelper.loggedInUser.value.uid)
        .snapshots();
  }
}
