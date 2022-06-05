import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finsem_client/controller/api.dart';
import 'package:finsem_client/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoticeView extends StatelessWidget {
  final int selectedNotice;
  const NoticeView({Key? key, required this.selectedNotice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<DocumentSnapshot<Map<String, dynamic>>>>(
          future: Api.fetchNotices(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
              child: Stack(
                children: [
                  SizedBox(
                    width: 360.w,
                    height: 420.h,
                    child: ClipRRect(
                        child: FittedBox(
                      child: Image.network(
                          snap.data![selectedNotice].data()!['imageLink']),
                      fit: BoxFit.fill,
                    )),
                  ),
                  Padding(
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 3, 15, 8),
                        height: 350.h,
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
                                snap.data![selectedNotice].data()!['title'],
                                style: TextStyle(
                                    color: FinColours.secondaryTextColor,
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                snap.data![selectedNotice].data()!['desc'],
                                style: TextStyle(
                                  color: FinColours.secondaryTextColor,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
