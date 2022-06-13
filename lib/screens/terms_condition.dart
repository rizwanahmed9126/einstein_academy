// ignore_for_file: must_be_immutable

import 'package:einstien_academy_flutter/providers/teacher_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TermsConditionScreen extends StatefulWidget {

  TermsConditionScreen({Key? key,}) : super(key: key);

  @override
  _TermsConditionScreenState createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  var navigationService = locator<NavigationService>();
  bool noData=false;


  @override
  void initState() {
    Provider.of<TeacherProvider>(context,listen: false).termsCondition=null;

    Provider.of<TeacherProvider>(context,listen: false).callTermsCondition().then((value){
      if(value=="noData"){
        setState(() {
          noData=true;
        });
      }
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          child: Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.keyboard_arrow_left_rounded,
                    size: 30.h,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Terms And Conditions",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(0.h),
        ),
      ),
      backgroundColor: Colors.white,
      body: Consumer<TeacherProvider>(builder: (context,i,_){
        return noData?Center(
          child: Text("Sorry! Backend error"),
        ): i.termsCondition!=null? Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.16,
                  child: Stack(
                    children: [
                      Container(
                        color: Theme.of(context).primaryColor,
                        height: 120.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 120.h),
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
                      Positioned.fill(
                        top: MediaQuery.of(context).size.height * 0.03,
                        child: Card(
                          margin: EdgeInsets.only(left: 15.w, right: 15.w),
                          elevation: 2,
                          shadowColor: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: SingleChildScrollView(
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 15.w,
                                    right: 15.w,
                                    top: 15.h,
                                    bottom: 15.h),
                                child: Text(i.termsCondition!)

                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Container(
                              //       child: Text(
                              //         "What User Data We Collect",
                              //         style: TextStyle(
                              //             color: Colors.grey.shade800,
                              //             fontSize: 12.sp,
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       height: 10.h,
                              //     ),
                              //     Container(
                              //       width:
                              //       MediaQuery.of(context).size.width / 1,
                              //       child: Text(
                              //         "It has survived not only five centuries, but also the leap into electronic typesetting, ",
                              //         style: TextStyle(
                              //           color: Color.fromRGBO(182, 189, 194, 1),
                              //           height: 1.3.h,
                              //           fontSize: 12.sp,
                              //         ),
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       height: 10.h,
                              //     ),
                              //     Container(
                              //       width:
                              //       MediaQuery.of(context).size.width / 1.1,
                              //       child: Text(
                              //         "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est  It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              //         style: TextStyle(
                              //           color: Color.fromRGBO(182, 189, 194, 1),
                              //           height: 1.3.h,
                              //           fontSize: 12.sp,
                              //         ),
                              //         // textAlign: TextAlign.center,
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       height: 10.h,
                              //     ),
                              //     Container(
                              //       child: Text(
                              //         "Safeguarding and Securing the Data",
                              //         style: TextStyle(
                              //             color: Colors.grey.shade800,
                              //             fontSize: 12.sp,
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       height: 10.h,
                              //     ),
                              //     Container(
                              //       width:
                              //       MediaQuery.of(context).size.width / 1.1,
                              //       child: Text(
                              //         "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur",
                              //         style: TextStyle(
                              //           color: Color.fromRGBO(182, 189, 194, 1),
                              //           height: 1.3.h,
                              //           fontSize: 12.sp,
                              //         ),
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       height: 10.h,
                              //     ),
                              //     Container(
                              //       child: Text(
                              //         "Our Cookie Policy",
                              //         style: TextStyle(
                              //             color: Colors.grey.shade800,
                              //             fontSize: 12.sp,
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       height: 10.h,
                              //     ),
                              //     Container(
                              //       width:
                              //       MediaQuery.of(context).size.width / 1.1,
                              //       child: Text(
                              //         "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur",
                              //         style: TextStyle(
                              //           color: Color.fromRGBO(182, 189, 194, 1),
                              //           height: 1.3.h,
                              //           fontSize: 12.sp,
                              //         ),
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       height: 10.h,
                              //     ),
                              //     Container(
                              //       width:
                              //       MediaQuery.of(context).size.width / 1.1,
                              //       child: Text(
                              //         "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur",
                              //         style: TextStyle(
                              //           color: Color.fromRGBO(182, 189, 194, 1),
                              //           height: 1.3.h,
                              //           fontSize: 12.sp,
                              //         ),
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       height: 10.h,
                              //     ),
                              //     Container(
                              //       width:
                              //       MediaQuery.of(context).size.width / 1.1,
                              //       child: Text(
                              //         "It has survived not only five centuries, but also the leap into electronic typesetting, ",
                              //         style: TextStyle(
                              //           color: Color.fromRGBO(182, 189, 194, 1),
                              //           height: 1.3.h,
                              //           fontSize: 12.sp,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
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
              ],
            ),
          ],
        ):LoadingWidget();

      },),
    );
  }
}
