import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/button_widget.dart';
import 'package:einstien_academy_flutter/widgets/column_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountVerificationScreen extends StatefulWidget {
  const AccountVerificationScreen({Key? key}) : super(key: key);

  @override
  _AccountVerificationScreenState createState() =>
      _AccountVerificationScreenState();
}

class _AccountVerificationScreenState extends State<AccountVerificationScreen> {
  var navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(
        244,
        247,
        254,
        1,
      ),
      appBar: AppBar(
        toolbarHeight: 200.h,
        centerTitle: true,
        title: Column(
          children: [
            // SizedBox(
            //   height: 20.h,
            // ),
            Text(
              "Account\nVerification",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Please enter your email address to get OTP Code",
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 253, 1),
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 50.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(241, 62, 146, 1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(235, 210, 58, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                          )),
                      width: 50.w,
                      height: 5.h,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(33, 109, 246, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                          )),
                      width: 50.w,
                      height: 5.h,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(52, 239, 70, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                          )),
                      width: 50.w,
                      height: 5.h,
                    ),
                  ),
                ],
              ),
            ],
          ),
          preferredSize: Size.fromHeight(0.0.h),
        ),
      ),
      body: ColumnScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(35.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      // controller: emailController,
                      autocorrect: true,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.sp,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 15.0,
                        ),
                        hintText: 'Email Address',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(180, 201, 222, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                        // filled: true,
                        // fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(154, 184, 208, 1),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(154, 184, 208, 1),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30.w,
                        height: 1.h,
                        color: Color.fromRGBO(69, 113, 138, 1),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "or",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(69, 113, 138, 1),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 30.w,
                        height: 1.h,
                        color: Color.fromRGBO(69, 113, 138, 1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      // controller: emailController,
                      autocorrect: true,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.sp,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 15.0,
                        ),
                        hintText: 'Enter Phone',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(180, 201, 222, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(154, 184, 208, 1),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(154, 184, 208, 1),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                35.w,
                20,
                35.w,
                20.h,
              ),
              child: ButtonWidget(
                name: 'Continue',

              ),
            )
          ],
        ),
      ),
    );
  }
}
