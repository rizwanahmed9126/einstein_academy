import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/screens/account_verification_screen.dart';
import 'package:einstien_academy_flutter/screens/reset_screen.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/util_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/button_widget.dart';
import 'package:einstien_academy_flutter/widgets/column_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool checkbox1 = false;
  // ignore: unused_field
  bool _showPassword = false;
  // ignore: unused_field
  bool _showEmail = false;
  var navigationService = locator<NavigationService>();
  UtilService utilService = locator<UtilService>();




  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        navigationService.navigateTo(LoginScreenRoute);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              navigationService.closeScreen();
            },
            icon: Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 30.h,
              color: Colors.white,
            ),
            color: Colors.white,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          bottom: PreferredSize(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 30.w, left: 30.w),
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 30.w, left: 30.w),
                    child: Text(
                      "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          height: 1.5.h,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Container(
                    child: Row(
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
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(150.0.h),
          ),
        ),
        body: ColumnScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 30.w, right: 30.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Container(
                      width: 400.w,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        autocorrect: true,
                        style: TextStyle(
                          color: Color.fromRGBO(154, 183, 208, 1),
                          fontSize: 12,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: Icon(
                              Icons.mail_outline,
                              size: 20.h,
                              color: Color.fromRGBO(154, 183, 208, 1),
                            ),
                            onPressed: () {
                              setState(() {
                                _showEmail = true;
                              });
                            },
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                          hintText: 'Email Address',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(154, 183, 208, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(154, 183, 208, 1),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "An Message will be sent to your email address with further instruction",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40.h),
                    ButtonWidget(
                      onpreseed: (){
                        Provider.of<AuthProvider>(context,listen: false).callForGotPasswordSendOTP(emailController.text).then((value){
                          if(value=="done"){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen(email: emailController.text,)));
                          }else{
                            utilService.showToast("Please Enter correct email");
                          }
                        });

                      },
                      name: 'Recover Password',

                    )
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
