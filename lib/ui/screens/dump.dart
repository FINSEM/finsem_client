import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dump extends StatelessWidget {
  const Dump({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Container(
              width: 300.w,
              height: 115.h,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xFFEFA8C9),
                  border: Border.all(
                    color: Colors.black54,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Due Amount",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              "₹ ${"3500"}",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Due Date",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text("${"7 Apr 2022"}",
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    minWidth: 150.0,
                    height: 35,
                    color: Color(0xFF971B69),
                    child: new Text('Pay Now',
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.white)),
                    onPressed: () {},
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
