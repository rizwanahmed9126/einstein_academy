import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/util_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/exit_dailog_widget.dart';
import 'package:einstien_academy_flutter/widgets/select_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectAccountScreen extends StatefulWidget {
  const SelectAccountScreen({Key? key}) : super(key: key);

  @override
  _SelectAccountScreenState createState() => _SelectAccountScreenState();
}

class _SelectAccountScreenState extends State<SelectAccountScreen> {
  List<Map<String, dynamic>> mystorylist = [
    {"id": "1", "title": "Student", "image": "assets/images/student.png"},
    {"id": "2", "title": "Teacher", "image": "assets/images/teacher.png"},
  ];
  String tagId1 = ' ';
  var flag = false;
  void active1(val) {
    setState(() {
      tagId1 = val;
      flag = true;
      if (val == "1") {
        SelectAccount.isTeacher = false;
      } else {
        SelectAccount.isTeacher = true;
      }
    });
  }

  _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => ExitAlertDialog(),
    );
  }

  var navigationService = locator<NavigationService>();
  var utilService = locator<UtilService>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _onBackPressed(),
        child: Scaffold(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Select that you’re \nStudent or Teacher ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          height: 1.2,
                          // wordSpacing: 3,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 30.w, left: 30.w),
                      child: Text("",
                       // "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries.",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 253, 1),
                          fontSize: 12.sp,
                          height: 1.5.h,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Column(
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
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(150.0.h),
            ),
          ),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: mystorylist.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return SelectAccountWidget(
                            data: mystorylist[index],
                            tag: mystorylist[index]['id'],
                            action: active1,
                            active: tagId1 == mystorylist[index]['id']
                                ? true
                                : false,
                          );
                        },
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 190.w,
                          childAspectRatio: 3.2.h / 3.w,
                          crossAxisSpacing: 5.h,
                        ),
                        // children: List.generate(
                        //   mystorylist.length,
                        //   (index) {},
                        // ),
                      ),
                    ],
                  ),
                  Container(
                      width: 400.w,
                      height: 40.h,
                      child: ElevatedButton(
                        onPressed: () {
                          if (flag) {
                            navigationService.navigateTo(GetStartedScreenRoute);
                          } else {
                            utilService.showToast(
                                'please select account before proceed');
                          }
                        },
                        child: Text(
                          'Proceed',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
