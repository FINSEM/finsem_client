import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:finsem_client/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackIssues extends StatelessWidget {
  const TrackIssues({Key? key}) : super(key: key);

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
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,

                //TODO: Update the list with Firebase
                itemCount: 2,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 95.h,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ViewTicketScreen(
                          //       ticketID: index,
                          //     ),
                          //   ),
                          // );
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  //DummyData().tickets[index].tBlockRoom,
                                  "Req: " + "Tower1 " + "-" + " 1304",
                                  style: GoogleFonts.roboto(
                                    color: FinColours.secondaryTextColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Req Type : " + " Carpenter",
                                  //"${DummyData().tickets[index].tType}",
                                  style: GoogleFonts.poppins(
                                    color: FinColours.grey,
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "ID: " + " TK44569",
                                  //+ "${DummyData().tickets[index].tID}",
                                  style: GoogleFonts.poppins(
                                    color: FinColours.grey,
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Status : " + "Under Progress",
                                  //"${DummyData().tickets[index].tstatus}",
                                  style: GoogleFonts.poppins(
                                    color: FinColours.grey,
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
