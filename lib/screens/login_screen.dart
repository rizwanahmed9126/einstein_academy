import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/providers/teacher_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/storage_service.dart';

import 'package:einstien_academy_flutter/services/util_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/button_widget.dart';
import 'package:einstien_academy_flutter/widgets/column_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var navigationService = locator<NavigationService>();
  var storageService = locator<StorageService>();
  bool checkbox1 = false;
  bool _showPassword = false;

  var utilService = locator<UtilService>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLoadingProgress = false;

  loadData() async {



    var teacherEmail=await storageService.getData("teacherEmail");
    var studentEmail=await storageService.getData("studentEmail");
    // var data = await Provider.of<AuthProvider>(context, listen: false).getIsRemember();
    // if (data) {
    //   String? email = await this.storageService.getData("email");
    //   String? password = await this.storageService.getData("password");
    //   passwordController.text = password ?? "";
    //   emailController.text = email ?? "";
    // }
    //if(teacherEmail!=null || studentEmail!=null){
    if(SelectAccount.isTeacher){
      if(teacherEmail!=null){
        emailController.text= await storageService.getData("teacherEmail"); //setData("teacherEmail",email );
        passwordController.text= await storageService.getData("teacherPass");  //setData("teacherPass",password );
      }
    }else{
      if (studentEmail!=null){
        emailController.text= await storageService.getData("studentEmail");
        passwordController.text= await storageService.getData("studentPass");
        // await storageService.setData("studentEmail",email );
        // await storageService.setData("studentPass",password );
      }
      //}
    }




  }

  @override
  void initState() {

    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor:Colors.white, //Theme.of(context).primaryColor,
            bottom: PreferredSize(
              child: Container(
                color:Colors.white, //Theme.of(context).primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        "assets/images/splash-logo.png",
                      ),
                      // // width: 150.w,
                      height: 120.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                        padding: EdgeInsets.only(right: 30.w, left: 30.w),
                        child: Text(
                          "Welcome to Einsteins Academy",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        )
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 30.w, left: 30.w),
                      child: Text(
                        "Sign in to your account with your email",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          height: 1.5.h,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
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
              preferredSize: Size.fromHeight(200.h),
            ),
          ),
          body: Stack(
            children: [
              ColumnScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 30.0.w,
                        right: 30.0.w,
                        top: 30.h,
                      ),
                      child: Column(
                        children: [
                          Form(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: sx(500),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15.0,
                                        horizontal: 20,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Email Address',
                                      hintStyle: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.r),
                                        borderSide: BorderSide(
                                          color: Colors.black54,
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
                                SizedBox(
                                  height: sy(10),
                                ),
                                Container(
                                  width: sx(500),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: passwordController,
                                    obscureText: !_showPassword,
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 15.0,
                                        horizontal: 20,
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      // suffixIcon: !_showPassword
                                      //     ? IconButton(
                                      //         icon: Icon(
                                      //           Icons.visibility_off,
                                      //           size: sy(15),
                                      //           color: Colors.grey.shade400,
                                      //         ),
                                      //         onPressed: () {
                                      //           setState(() {
                                      //             _showPassword = true;
                                      //           });
                                      //         },
                                      //       )
                                      //     : IconButton(
                                      //         icon: Icon(
                                      //           Icons.visibility,
                                      //           size: sy(15),
                                      //           color: Colors.grey.shade400,
                                      //         ),
                                      //         onPressed: () {
                                      //           setState(() {
                                      //             _showPassword = false;
                                      //           });
                                      //         },
                                      //       ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.r),
                                        borderSide: BorderSide(
                                          color: Colors.black54,
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
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 25.w,
                                    child: Theme(
                                      data: ThemeData(),
                                      child: Checkbox(
                                        side: BorderSide(
                                            width: 1, color: Colors.grey),
                                        shape: CircleBorder(
                                          side: BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                        value: checkbox1,
                                        activeColor:
                                            Theme.of(context).primaryColor,
                                        onChanged: (value) {
                                          //value may be true or false
                                          setState(() {
                                            checkbox1 = !checkbox1;
                                            SelectAccount.isRemember=checkbox1;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Remember me',
                                    style: TextStyle(
                                      fontSize: sy(9),
                                      color: Color.fromRGBO(93, 107, 116, 1),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  navigationService.navigateTo(ForgetPasswordScreenRoute);
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: sy(
                                      9,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ButtonWidget(
                            onpreseed: () {
                              if (emailController.text == "" || passwordController.text == "") {
                                utilService.showToast("Please fill all fields");
                              } else if (!emailController.text.contains('@')) {
                                utilService.showToast("Please Enter a valid Email");
                              } else if (!emailController.text.contains('.com')) {
                                utilService.showToast("Please Enter a valid Email");
                              } else {



                                Provider.of<AuthProvider>(context, listen: false).signinWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        context: context);

                                //navigationService.closeScreen();
                              }
                            },
                            name: "Sign In",

                          ),
                          SizedBox(
                            height: sy(5),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Color.fromRGBO(93, 107, 116, 1),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              navigationService.navigateTo(SignUpScreenRoute);
                            },
                            child: Text(
                              ' SignUp',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if(isLoadingProgress)
                LoadingWidget()
            ],
          ),
        );
      },
    );
  }
}
