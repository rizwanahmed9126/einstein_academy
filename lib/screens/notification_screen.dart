import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:einstien_academy_flutter/providers/teacher_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  var navigationService = locator<NavigationService>();

  List member = [
    {
      "image": "assets/images/001.jpeg",
      "text": " has just followed you",
      "name": "Bella David",
      "time": "6:30 pm",
    },
    {
      "image": "assets/images/dummy_profile.jpg",
      "text": " added study material of marketing for 12 grade",
      "name": "Emma Martin",
      "time": "10:30 pm",
    },
  ];
  bool noData = false;

  @override
  void initState() {
    Provider.of<TeacherProvider>(context, listen: false)
        .notificationData
        .clear();
    Provider.of<TeacherProvider>(context, listen: false)
        .callGetNotification()
        .then((value) {
      if (value == "noData") {
        setState(() {
          noData = true;
        });
      }
    });
    super.initState();
  }

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
        leadingWidth: 40.w,
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(
          30,
          144,
          241,
          1,
        ),
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
        title: Text(
          "Notifications",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Image.asset(
        //       "assets/images/search.png",
        //       scale: 1,
        //       height: 20.h,
        //       color: Colors.white,
        //     ),
        //     color: Colors.white,
        //   ),
        // ],
        bottom: PreferredSize(
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
          preferredSize: Size(double.infinity, 20.h),
        ),
      ),
      body: Consumer<TeacherProvider>(
        builder: (context, i, _) {
          return noData
              ? Center(
                  child: Text("No Notification at the moment"),
                )
              : i.notificationData.isNotEmpty
                  ? SingleChildScrollView(
                      child: SafeArea(
                        child: Container(
                          padding: EdgeInsets.all(15.h),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(5.r),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.w, right: 10.w, top: 20.h),
                                  child: Text(
                                    "Today",
                                    style: TextStyle(
                                      color: Color.fromRGBO(
                                        193,
                                        199,
                                        215,
                                        1,
                                      ),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider();
                                  },
                                  itemCount: i.notificationData.length,
                                  itemBuilder: (BuildContext context, int idx) {
                                    Timestamp myTimeStamp = Timestamp.fromDate(i.notificationData[idx].updatedAt);

                                    DateTime messageTime =  (myTimeStamp).toDate();

                                    final time = timeago.format(DateTime.now()
                                        .subtract(DateTime.now()
                                            .difference(messageTime)));

                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.w,
                                          right: 15.w,
                                          top: 10.h,
                                          bottom: 10.h),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: FadeInImage(
                                                image: NetworkImage(
                                                    "${i.notificationData[idx].img}"),
                                                placeholder: AssetImage(
                                                  "assets/images/placeHolder.png",
                                                ),
                                                imageErrorBuilder:
                                                    (context, url, error) =>
                                                        Image.asset(
                                                  "assets/images/placeHolder.png",
                                                  height: 53,
                                                  width: 53,
                                                  fit: BoxFit.cover,
                                                ),
                                                fit: BoxFit.cover,
                                                height: 50,
                                                width: 50,
                                                //imageErrorBuilder: (context,url)=>Icon(),
                                              )),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 220.w,
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: i
                                                            .notificationData[
                                                                idx]
                                                            .title,
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Color.fromRGBO(
                                                            51,
                                                            61,
                                                            70,
                                                            1,
                                                          ),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: i
                                                            .notificationData[
                                                                idx]
                                                            .body,
                                                        style: TextStyle(
                                                          height: 1.4,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color.fromRGBO(
                                                            93,
                                                            108,
                                                            115,
                                                            1,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                time,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10.sp,
                                                  color: Color.fromRGBO(
                                                    193,
                                                    201,
                                                    204,
                                                    1,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),

                                // Divider(),
                                //
                                //
                                // Padding(
                                //   padding: EdgeInsets.only(
                                //       left: 15.w, right: 15.w, top: 15.h, bottom: 10.h),
                                //   child: Text(
                                //     "Yesterday",
                                //     style: TextStyle(
                                //       color: Color.fromRGBO(
                                //         193,
                                //         199,
                                //         215,
                                //         1,
                                //       ),
                                //       fontSize: 16.sp,
                                //       fontWeight: FontWeight.bold,
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 10.h,
                                // ),
                                // ListView.separated(
                                //   physics: NeverScrollableScrollPhysics(),
                                //   shrinkWrap: true,
                                //   separatorBuilder: (BuildContext context, int index) {
                                //     return Divider();
                                //   },
                                //   itemCount: member.length,
                                //   itemBuilder: (BuildContext context, int i) {
                                //     return Padding(
                                //       padding: EdgeInsets.only(
                                //           left: 15.w,
                                //           right: 15.w,
                                //           top: 5.h,
                                //           bottom: 10.h),
                                //       child: Row(
                                //         crossAxisAlignment: CrossAxisAlignment.center,
                                //         children: [
                                //           CircleAvatar(
                                //             radius: 22.r,
                                //             backgroundImage: AssetImage(
                                //               member[i]["image"],
                                //             ),
                                //           ),
                                //           SizedBox(
                                //             width: 15.w,
                                //           ),
                                //           Column(
                                //             crossAxisAlignment: CrossAxisAlignment.start,
                                //             mainAxisAlignment: MainAxisAlignment.center,
                                //             children: [
                                //               Container(
                                //                 width: 220.w,
                                //                 child: RichText(
                                //                   text: TextSpan(
                                //                     children: <TextSpan>[
                                //                       TextSpan(
                                //                         text: member[i]["name"],
                                //                         style: TextStyle(
                                //                           fontSize: 12.sp,
                                //                           fontWeight: FontWeight.w900,
                                //                           color: Color.fromRGBO(
                                //                             51,
                                //                             61,
                                //                             70,
                                //                             1,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                       TextSpan(
                                //                         text: member[i]["text"],
                                //                         style: TextStyle(
                                //                           height: 1.4,
                                //                           fontSize: 12.sp,
                                //                           fontWeight: FontWeight.w500,
                                //                           color: Color.fromRGBO(
                                //                             93,
                                //                             108,
                                //                             115,
                                //                             1,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //               ),
                                //               SizedBox(
                                //                 height: 5.h,
                                //               ),
                                //               Text(
                                //                 member[i]["time"],
                                //                 style: TextStyle(
                                //                   fontWeight: FontWeight.w500,
                                //                   fontSize: 10.sp,
                                //                   color: Color.fromRGBO(
                                //                     193,
                                //                     201,
                                //                     204,
                                //                     1,
                                //                   ),
                                //                 ),
                                //               )
                                //             ],
                                //           )
                                //         ],
                                //       ),
                                //     );
                                //   },
                                // ),
                                // Divider(),
                                // Padding(
                                //   padding: EdgeInsets.only(
                                //       left: 15.w, right: 15.w, top: 15.h, bottom: 10.h),
                                //   child: Text(
                                //     "27 Oct, 2021",
                                //     style: TextStyle(
                                //       color: Color.fromRGBO(
                                //         193,
                                //         199,
                                //         215,
                                //         1,
                                //       ),
                                //       fontSize: 16.sp,
                                //       fontWeight: FontWeight.bold,
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 10.h,
                                // ),
                                // ListView.separated(
                                //   physics: NeverScrollableScrollPhysics(),
                                //   shrinkWrap: true,
                                //   separatorBuilder: (BuildContext context, int index) {
                                //     return Divider();
                                //   },
                                //   itemCount: member.length,
                                //   itemBuilder: (BuildContext context, int i) {
                                //     return Padding(
                                //       padding: EdgeInsets.only(
                                //         left: 15.w,
                                //         right: 15.w,
                                //         top: 5.h,
                                //         bottom: 10.h,
                                //       ),
                                //       child: Row(
                                //         crossAxisAlignment: CrossAxisAlignment.center,
                                //         children: [
                                //           CircleAvatar(
                                //             radius: 22.r,
                                //             backgroundImage: AssetImage(
                                //               member[i]["image"],
                                //             ),
                                //           ),
                                //           SizedBox(
                                //             width: 15.w,
                                //           ),
                                //           Column(
                                //             crossAxisAlignment: CrossAxisAlignment.start,
                                //             mainAxisAlignment: MainAxisAlignment.center,
                                //             children: [
                                //               Container(
                                //                 width: 220.w,
                                //                 child: RichText(
                                //                   text: TextSpan(
                                //                     children: <TextSpan>[
                                //                       TextSpan(
                                //                         text: member[i]["name"],
                                //                         style: TextStyle(
                                //                           fontSize: 12.sp,
                                //                           fontWeight: FontWeight.w900,
                                //                           color: Color.fromRGBO(
                                //                             51,
                                //                             61,
                                //                             70,
                                //                             1,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                       TextSpan(
                                //                         text: member[i]["text"],
                                //                         style: TextStyle(
                                //                           height: 1.4,
                                //                           fontSize: 12.sp,
                                //                           fontWeight: FontWeight.w500,
                                //                           color: Color.fromRGBO(
                                //                             93,
                                //                             108,
                                //                             115,
                                //                             1,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //               ),
                                //               SizedBox(
                                //                 height: 5.h,
                                //               ),
                                //               Text(
                                //                 member[i]["time"],
                                //                 style: TextStyle(
                                //                   fontWeight: FontWeight.w500,
                                //                   fontSize: 10.sp,
                                //                   color: Color.fromRGBO(
                                //                     193,
                                //                     201,
                                //                     204,
                                //                     1,
                                //                   ),
                                //                 ),
                                //               )
                                //             ],
                                //           )
                                //         ],
                                //       ),
                                //     );
                                //   },
                                // ),
                                // SizedBox(
                                //   height: 10.h,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : LoadingWidget();
        },
      ),
    );
  }
}
