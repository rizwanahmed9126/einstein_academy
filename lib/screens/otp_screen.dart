import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/storage_service.dart';
import 'package:einstien_academy_flutter/services/util_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/button_widget.dart';
import 'package:einstien_academy_flutter/widgets/column_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var navigationService = locator<NavigationService>();
  StorageService? storageService = locator<StorageService>();
  UtilService? utilService = locator<UtilService>();

  TextEditingController otpController = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 4;
  bool hasError = false;
  String? errorMessage;
  var email;
  var password;

  void otpVerifi() async {
    email = await this.storageService!.getData("email");
    password = await this.storageService!.getData("password");
  }

  @override
  void initState() {
    otpVerifi();
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        navigationService.closeScreen();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 160.h,
          centerTitle: true,
          title: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                "Enter OTP",
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
                "We have sent you access code on your email for\nyour account verification",
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 253, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  height: 1.6,
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
            preferredSize: Size(double.infinity, 50.h),
          ),
        ),
        body: ColumnScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  25.w,
                  40.h,
                  25.w,
                  20.h,
                ),
                child: Column(
                  children: [
                    PinCodeTextField(
                      isCupertino: false,
                      pinBoxBorderWidth: 1.w,
                      pinBoxRadius: 5.r,
                      autofocus: true,
                      controller: otpController,
                      hideCharacter: false,
                      highlight: true, pinBoxColor: Colors.white,
                      highlightColor: Color.fromRGBO(157, 184, 221, 1),
                      defaultBorderColor: Color.fromRGBO(157, 184, 221, 1),
                      hasTextBorderColor: Color.fromRGBO(157, 184, 221, 1),
                      // highlightPinBoxColor: Colors.orange,
                      maxLength: pinLength,
                      hasError: hasError,
                      maskCharacter: "*",
                      onTextChanged: (text) {
                        setState(() {
                          hasError = false;
                        });
                      },
                      onDone: (text) {
                        print("DONE $text");
                        print("DONE CONTROLLER ${otpController.text}");
                      },
                      pinBoxWidth: 45.w,
                      pinBoxHeight: 45.h,
                      hasUnderline: false,
                      wrapAlignment: WrapAlignment.spaceBetween,
                      // pinBoxDecoration:
                      //     ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                      pinTextStyle: TextStyle(
                        fontSize: 22.sp,
                        color: Color.fromRGBO(179, 201, 222, 1),
                      ),
                      pinTextAnimatedSwitcherTransition:
                          ProvidedPinBoxTextAnimation.scalingTransition,
                      //                    pinBoxColor: Colors.green[100],
                      pinTextAnimatedSwitcherDuration:
                          Duration(milliseconds: 300),
                      //                    highlightAnimation: true,
                      highlightAnimationBeginColor: Colors.black,
                      highlightAnimationEndColor: Colors.white12,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    ButtonWidget(
                      onpreseed: () async {
                        if (otpController.text == "") {
                          utilService!.showToast("Please fill otp");
                        } else {
                          //showLoadingAnimation(context);
                          FocusScope.of(context).requestFocus(FocusNode());
                          await Provider.of<AuthProvider>(context,
                                  listen: false)
                              .otpVerification(
                            otp: otpController.text,
                            email: email,
                            password: password,
                          )
                              .then((response) {
                            navigationService.closeScreen();
                            if (response.data["message"] == "OTP not match") {
                              utilService!.showToast(response.data["message"]);
                            } else {
                              navigationService.closeScreen();
                              navigationService
                                  .navigateReplace(LoginScreenRoute);
                            }
                          });
                        }
                        // navigationService.closeScreen();
                      },
                      name: 'Continue',
                    ),
                    // Container(
                    //   width: 300.w,
                    //   height: 40.h,
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       "Continue",
                    //       style: TextStyle(
                    //         fontSize: 16.sp,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  25.w,
                  40.h,
                  25.w,
                  20.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't reveice the OTP code?",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Color.fromRGBO(69, 115, 139, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Provider.of<AuthProvider>(context, listen: false)
                            .resendOtp(
                              email: email,
                            )
                            .then((value) =>
                                utilService!.showToast("Resend otp"));
                      },
                      child: Text(
                        " Resend it",
                        style: TextStyle(
                          color: Color.fromRGBO(
                            30,
                            144,
                            241,
                            1,
                          ),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
