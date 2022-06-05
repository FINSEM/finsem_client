import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finsem_client/controller/api.dart';
import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:finsem_client/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
        title: "Services",
        isBack: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: Api.fetchServices(),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                    itemCount: snap.data!.docs.length,
                    itemBuilder: (context, ind) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${snap.data!.docs[ind].data()['name']}',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: 260,
                                  child: Text(
                                    snap.data!.docs[ind].data()['prof'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                makeCall(
                                    mobileNo:
                                        snap.data!.docs[ind].data()['mobile']);
                              },
                              icon: const Icon(
                                Icons.phone_forwarded,
                                color: Colors.green,
                                size: 26,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
                // ListView.builder(
                //   physics: const BouncingScrollPhysics(),
                //   itemCount: snap.data!.docs.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     return Column(
                //       children: [
                //         const SizedBox(
                //           height: 5,
                //         ),
                //         Container(
                //           padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20),
                //             color: const Color(0xffbbeade),
                //           ),
                //           height: 80,
                //           width: 300.w,
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Row(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   //TODO:FIREBASE CONNECTION PENDING PAYMENT
                //                   Column(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.spaceEvenly,
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.start,
                //                     children: [
                //                       Text(
                //                         //Name of sender
                //                         //"Name",
                //                         snap.data!.docs[index].data()['name'],
                //                         style: const TextStyle(
                //                             color: Colors.black,
                //                             fontSize: 18,
                //                             fontWeight: FontWeight.bold),
                //                       ),
                //                       const SizedBox(
                //                         height: 5,
                //                       ),
                //                       Text(
                //                         //Type of Service
                //                         snap.data!.docs[index].data()['prof'],
                //                         style: TextStyle(
                //                             color:
                //                                 FinColours.secondaryTextColor,
                //                             fontSize: 16),
                //                       ),
                //                     ],
                //                   ),
                //                   Column(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.center,
                //                     children: [
                //                       MaterialButton(
                //                         shape: RoundedRectangleBorder(
                //                           borderRadius:
                //                               BorderRadius.circular(18.0),
                //                         ),
                //                         child: Container(
                //                           height: 35,
                //                           width: 80,
                //                           decoration: BoxDecoration(
                //                               borderRadius:
                //                                   BorderRadius.circular(18.0),
                //                               color: const Color(0xffa22356)),
                //                           child: Center(
                //                             child: Row(
                //                               mainAxisAlignment:
                //                                   MainAxisAlignment.center,
                //                               children: const [
                //                                 Icon(
                //                                   Icons.call,
                //                                   color: Colors.white,
                //                                   size: 16.0,
                //                                 ),
                //                                 SizedBox(
                //                                   width: 3,
                //                                 ),
                //                                 Text(
                //                                   'Call',
                //                                   style: TextStyle(
                //                                     fontSize: 16.0,
                //                                     color: Colors.white,
                //                                   ),
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                         ),
                //                         onPressed: () async {
                //                           final Uri launchUri = Uri(
                //                             scheme: 'tel',
                //                             path: snap.data!.docs[index]
                //                                 .data()['mobile'],
                //                           );
                //                           await launchUrl(launchUri);
                //                         },
                //                       ),
                //                     ],
                //                   ),
                //                 ],
                //               ),
                //               Row(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceEvenly,
                //                 children: const [],
                //               )
                //             ],
                //           ),
                //         ),
                //         const SizedBox(
                //           height: 5,
                //         ),
                //       ],
                //     );
                //   });
              }),
        ));
  }

  void makeCall({String mobileNo = ''}) async {
    Uri url = Uri.parse('tel:$mobileNo');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
