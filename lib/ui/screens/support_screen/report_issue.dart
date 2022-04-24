import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
        isBack: true,
        title: "Raise Issue",
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
              const SizedBox(
                height: 10,
              ),
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
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Please Enter Your Comments",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
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
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
