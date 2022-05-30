import 'package:finsem_client/controller/api_helper.dart';
import 'package:finsem_client/dummy_data/dummy_data.dart';
import 'package:finsem_client/model/housekeeping_model.dart';
import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

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
      child: FutureBuilder<List<HouseKeeping>>(
          future: ApiHelper.fetchHousekeeping(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: DummyData().houseKeeping.length,
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
                              '${DummyData().houseKeeping[ind].name}  (${DummyData().houseKeeping[ind].hkType.name})',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              DummyData().houseKeeping[ind].desc,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            makeCall(
                                mobileNo: DummyData().houseKeeping[ind].mobile);
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
