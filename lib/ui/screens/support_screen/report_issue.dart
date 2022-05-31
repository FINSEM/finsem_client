import 'dart:io';

import 'package:finsem_client/controller/api.dart';
import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as debug;

class ReportIssue extends StatefulWidget {
  const ReportIssue({Key? key}) : super(key: key);

  @override
  State<ReportIssue> createState() => _ReportIssueState();
}

class _ReportIssueState extends State<ReportIssue> {
  String issuevalue = 'Plumber';
  String issuecomment = "";

  // List of items in our dropdown menu
  var issueitems = [
    'Plumber',
    'Carpenter',
    'House Cleaning',
    'Electrician',
    'Other',
  ];
  final ImagePicker _picker = ImagePicker();
  File file = File('');
  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
        isBack: true,
        title: "Raise Issue",
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Please Select Your Issue",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1, //                   <--- border width here
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 320.w,
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        value: issuevalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: issueitems.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            issuevalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Enter Your Comments",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1, //                   <--- border width here
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    autofocus: false,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(8)
                        //labelText: 'Comments',
                        ),
                    onChanged: (text) {
                      issuecomment = text;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: file.path == ''
                      ? Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: GestureDetector(
                                onTap: () {
                                  _imgFromGallery();
                                },
                                child: Container(
                                  height: 100.h,
                                  width: 130.w,
                                  color: const Color(0xffF0F0F0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/gallery.svg',
                                        height: 30,
                                      ),
                                      const SizedBox(height: 5),
                                      const Text('Add Images')
                                    ],
                                  ),
                                ),
                              )),
                        )
                      : Container(
                          height: 100.h,
                          width: 130.w,
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: Stack(
                              children: [
                                Container(
                                    height: 100.h,
                                    width: 130.w,
                                    color: const Color(0xffF0F0F0),
                                    child: Image.file(
                                      file,
                                      fit: BoxFit.cover,
                                    )),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        file = File('');
                                      });
                                    },
                                    child: SizedBox(
                                      width: 35,
                                      height: 35,
                                      child: SvgPicture.asset(
                                        'assets/icons/deleteimage.svg',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                              Color(0xFF7B7777),
                              Color(0xFFCECCCA),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (issuevalue.isNotEmpty &&
                            issuecomment.isNotEmpty &&
                            file.path != '') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Container(
                                    color: Colors.white,
                                    height: 100,
                                    width: 100,
                                    child: const Center(
                                        child: CircularProgressIndicator()));
                              });
                          Api.uploadIssue(issuevalue, issuecomment, file)
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please complete the details");
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  _imgFromGallery() async {
    //IF PERSON CANCELS THEN THE PATH WILL BE '' -- KEEP IN MIND
    XFile? image = (await _picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 40,
        )) ??
        XFile('');

    setState(() {
      // _videoPlayerController.dispose();
      // video = File('');
      if (image.path == '') {
        debug.log('Cancelled');
      } else {
        setState(() {
          file = File(image.path);
        });
      }
    });
  }
}
