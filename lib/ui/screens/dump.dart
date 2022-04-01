import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dump extends StatelessWidget {
  const Dump({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.grey,
                    width: 140.w,
                    height: 100,
                  ),
                  //Text("BMI App"),
                  Container(
                    color: Colors.amberAccent,
                    width: 140.w,
                    height: 100,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.green,
                    width: 150.w,
                    height: 250,
                  ),
                  Container(
                    //color: Colors.blue,
                    height: 280,
                    width: 150.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.pinkAccent,
                          width: 150.w,
                          height: 180,
                        ),
                        Container(
                          color: Colors.brown,
                          width: 150.w,
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.cyan,
                width: 360.w,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
