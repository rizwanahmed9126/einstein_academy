import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/screens/select_account_screen.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/util_service.dart';

import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/button_widget.dart';
import 'package:einstien_academy_flutter/widgets/column_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  ResetPasswordScreen({Key? key,required this.email}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool checkbox1 = false;
  bool _showPassword = false;
  // ignore: unused_field
  bool _showEmail = false;
  var navigationService = locator<NavigationService>();

  @override
  void dispose() {
    navigationService.closeScreen();
    super.dispose();
  }

  TextEditingController passController = TextEditingController();
  TextEditingController newpassController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  UtilService utilService = locator<UtilService>();
  bool isLoadingProgress=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
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
                    "Reset Password",
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
      body: Stack(
        children: [
          ColumnScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 40.w, right: 40.w),
                  child: Column(children: [
                    Form(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 60.h,
                          ),
                          Container(
                            width: 400.w,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: passController,
                              obscureText: !_showPassword,
                              autocorrect: true,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10,
                                ),
                                hintText: 'New Password',
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                                suffixIcon: !_showPassword
                                    ? IconButton(
                                        icon: Icon(
                                          Icons.visibility_off,
                                          size: 15,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _showPassword = true;
                                          });
                                        },
                                      )
                                    : IconButton(
                                        icon: Icon(
                                          Icons.visibility,
                                          size: 15,
                                          color: Theme.of(context).indicatorColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _showPassword = false;
                                          });
                                        },
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
                          Container(
                            height: 15.h,
                          ),
                          Container(
                            width: 400.w,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: newpassController,
                              obscureText: !_showPassword,
                              autocorrect: true,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10,
                                ),
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                                suffixIcon: !_showPassword
                                    ? IconButton(
                                        icon: Icon(
                                          Icons.visibility_off,
                                          size: 15,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _showPassword = true;
                                          });
                                        },
                                      )
                                    : IconButton(
                                        icon: Icon(
                                          Icons.visibility,
                                          size: 15,
                                          color: Theme.of(context).indicatorColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _showPassword = false;
                                          });
                                        },
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
                          Container(
                            height: 15.h,
                          ),

                          Container(
                            width: 400.w,
                            child: TextFormField(
                              keyboardType: TextInputType.number,

                              controller: otpController,
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
                                hintText: 'Enter the otp we have send you',
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
                        ],
                      ),
                    ),
                    Container(
                      height: 30.h,
                    ),
                    ButtonWidget(
                      onpreseed: (){
                        if(passController.text!=newpassController.text){
                          utilService.showToast("New and Confirm password should match");

                        }else if(otpController.text.length!=4){
                          utilService.showToast("OTP length should be 4");
                        }
                        else{
                          setState(() {
                            isLoadingProgress=true;
                          });


                          Provider.of<AuthProvider>(context,listen: false).callForgotPassword(widget.email,passController.text,otpController.text,).then((value){
                            if(value=="done"){
                              utilService.showToast("Password change successfully");
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectAccountScreen()));
                              setState(() {
                                isLoadingProgress=false;
                              });
                            }
                            else{
                              utilService.showToast("Enter correct OTP");
                              setState(() {
                                isLoadingProgress=false;
                              });
                            }
                          });
                        }


                      },
                      name: 'Change Password',

                    )
                  ]),
                ),
              ],
            ),
          ),
          if(isLoadingProgress)
            LoadingWidget()

        ],
      ),
    );
  }
}
