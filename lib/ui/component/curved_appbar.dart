import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurvedAppBar extends StatelessWidget {
  CurvedAppBar({
    required this.title,
    required this.child,
    required this.isBack,
    this.leading,
    Key? key,
  }) : super(key: key);
  final String title;
  final Widget child;
  final bool isBack;
  Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xff212532),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50.h, left: 50.h),
                color: const Color(0xff212532),
                width: 300.h,
                height: 60.h,
              ),
              Container(
                margin: EdgeInsets.only(top: 60.h),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                width: 360.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.h),
                  ),
                ),
                child: child,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 10.h, bottom: 10.h, left: 20.w, right: 10.w),
                height: 60.h,
                width: 360.w,
                decoration: BoxDecoration(
                  color: const Color(0xff212532),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.h),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: isBack
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: isBack,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    leading == null
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.only(left: 185.w),
                            child: leading!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
