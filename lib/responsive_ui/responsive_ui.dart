import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveUi extends StatefulWidget {
  const ResponsiveUi({super.key});

  @override
  State<ResponsiveUi> createState() => _ResponsiveUiState();
}

class _ResponsiveUiState extends State<ResponsiveUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.account_circle_sharp,
              size: 25.sp,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Responsive UI",
              style: TextStyle(fontSize: 18.sp),
            ),
          ],
        ),
      ),
      body: Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          margin: EdgeInsets.only(top: 10.w, bottom: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0.w),
                child: Text(
                  "Explore latest contents",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    border: Border.all(
                      color: Colors.teal, // You can adjust the color as needed
                      width: 2.0.w,
                    ),
                  ),
                  height: 100.h,
                  width: 100.w,
                  child: Image.network(
                      "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"),
                ),
              )
            ],
          )),
    );
  }
}
