import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finsem_client/controller/api.dart';

class CookScreen extends StatefulWidget {
  const CookScreen({Key? key}) : super(key: key);

  @override
  State<CookScreen> createState() => _CookScreenState();
}

class _CookScreenState extends State<CookScreen> {
  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
      title: 'House Keeping',
      isBack: true,
      child: FutureBuilder<List<DocumentSnapshot<Map<String, dynamic>>>>(
          //HouseKeeping
          //<List<DocumentSnapshot<Map<String, dynamic>>>>
          future: Api.fetchHouseKeeping(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snap.data!.length,
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
                              '${snap.data![ind].data()!['name']}  (${snap.data![ind].data()!['serviceType']})',
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
                                snap.data![ind].data()!['serviceDescription'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            makeCall(
                                mobileNo: snap.data![ind].data()!['mobile']);
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
          }),
    );
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
