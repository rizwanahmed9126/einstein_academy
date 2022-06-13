import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:einstien_academy_flutter/models/join_zoom_model.dart';
import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/services/util_service.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:flutter_zoom_sdk/zoom_options.dart';
import 'package:flutter_zoom_sdk/zoom_view.dart';


class EventsAndSessionWidget extends StatefulWidget {
  final ZoomMeetingModel data;
  const EventsAndSessionWidget({Key? key, required this.data}) : super(key: key);

  @override
  _EventsAndSessionWidgetState createState() => _EventsAndSessionWidgetState();
}

class _EventsAndSessionWidgetState extends State<EventsAndSessionWidget> {
  bool active = false;

  joinMeeting(BuildContext context) {
    bool _isMeetingEnded(String status) {
      var result = false;

      if (Platform.isAndroid)
        result = status == "MEETING_STATUS_DISCONNECTING" ||
            status == "MEETING_STATUS_FAILED";
      else
        result = status == "MEETING_STATUS_IDLE";

      return result;
    }

    if (widget.data.meetingId.isNotEmpty && widget.data.meetingPass.isNotEmpty) {
      ZoomOptions zoomOptions = new ZoomOptions(
        domain: "zoom.us",
        appKey: "XKE4uWfeLwWEmh78YMbC6mqKcF8oM4YHTr9I", //API KEY FROM ZOOM
        appSecret: "bT7N61pQzaLXU6VLj9TVl7eYuLbqAiB0KAdb", //API SECRET FROM ZOOM
      );
      var meetingOptions = new ZoomMeetingOptions(
          userId: '${Provider.of<AuthProvider>(context,listen: false).user!.name}', //pass username for join meeting only --- Any name eg:- EVILRATT.
          meetingId: widget.data.meetingId, //pass meeting id for join meeting only
          meetingPassword: widget.data.meetingPass, //pass meeting password for join meeting only
          disableDialIn: "true",
          disableDrive: "true",
          disableInvite: "true",
          disableShare: "true",
          disableTitlebar: "false",
          viewOptions: "true",
          noAudio: "false",
          noDisconnectAudio: "false");

      var zoom = ZoomView();
      zoom.initZoom(zoomOptions).then((results) {
        if (results[0] == 0) {
          zoom.onMeetingStatus().listen((status) {
            print("[Meeting Status Stream] : " + status[0] + " - " + status[1]);
            if (_isMeetingEnded(status[0])) {
              print("[Meeting Status] :- Ended");
              timer.cancel();
            }
          });
          print("listen on event channel");
          zoom.joinMeeting(meetingOptions).then((joinMeetingResult) {
            timer = Timer.periodic(new Duration(seconds: 2), (timer) {
              zoom.meetingStatus(meetingOptions.meetingId!).then((status) {
                print("[Meeting Status Polling] : " +
                    status[0] +
                    " - " +
                    status[1]);
              });
            });
          });
        }
      }).catchError((error) {
        print("[Error Generated] : " + error);
      });
    } else {
      utilService.showToast("Sorry! you can't join this meeting");

    }
  }


  UtilService utilService = locator<UtilService>();
  late Timer timer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(5.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: widget.data.img==null?
              //   NetworkImage(
              //    "https://www.jotform.com/blog/wp-content/uploads/2020/04/video-conference-tools-b0d4ff-01.png",// ["urlImage"],
              //   )
              //       :
              //   CachedNetworkImage(
              //     widget.data.img,
              //   ),
              //
              // ),
            ),
            child: Stack(
              children: [

                Container(
                    height: 100.h,
                    width: double.infinity,
                  child: FadeInImage(
                    image: NetworkImage("${widget.data.img}"),
                    placeholder: AssetImage("assets/images/placeHolder.png",),
                    imageErrorBuilder: (context,url,error)=>Image.network("https://www.jotform.com/blog/wp-content/uploads/2020/04/video-conference-tools-b0d4ff-01.png",height: 53,width: 53,fit: BoxFit.cover,),
                    fit: BoxFit.cover,

                    //imageErrorBuilder: (context,url)=>Icon(),
                  )

                ),
                Padding(
                  padding: EdgeInsets.all(5.0.r),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Container(
                        padding: EdgeInsets.fromLTRB(8.w, 5.h, 8.w, 5.h,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.r),
                          color: Colors.black,
                        ),
                        child: Text("LIVE",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp,
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            widget.data.title,
            //widget.data["title"],
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(
                51,
                61,
                70,
                1,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.folder,
                        color: Color.fromRGBO(
                          193,
                          199,
                          215,
                          1,
                        ),
                        size: 16.h,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        widget.data.dateAndTime,
                        //widget.data["date"],
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(
                            51,
                            61,
                            70,
                            1,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "•",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Color.fromRGBO(
                            193,
                            199,
                            215,
                            1,
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: 5.w,
                      // ),
                      // Icon(
                      //   Icons.people,
                      //   color: Color.fromRGBO(
                      //     193,
                      //     199,
                      //     215,
                      //     1,
                      //   ),
                      //   size: 16.h,
                      // ),
                      // SizedBox(
                      //   width: 5.w,
                      // ),
                      // Text(
                      //   "21 Participants",
                      //   //widget.data["users"],
                      //   style: TextStyle(
                      //     fontSize: 9.sp,
                      //     fontWeight: FontWeight.w500,
                      //     color: Color.fromRGBO(
                      //       51,
                      //       61,
                      //       70,
                      //       1,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
              // active
              //     ? InkWell(
              //         onTap: () {
              //           setState(() {
              //             active = !active;
              //           });
              //         },
              //         child: Container(
              //           margin: EdgeInsets.only(top: 12.h),
              //           padding: EdgeInsets.fromLTRB(
              //             10.w,
              //             5.h,
              //             10.w,
              //             5.h,
              //           ),
              //           decoration: BoxDecoration(
              //             color: Color.fromRGBO(
              //               30,
              //               144,
              //               241,
              //               1,
              //             ),
              //             borderRadius: BorderRadius.circular(
              //               3.r,
              //             ),
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Icon(
              //                 Icons.check,
              //                 color: Colors.white,
              //                 size: 14.h,
              //               ),
              //               SizedBox(
              //                 width: 5.w,
              //               ),
              //               Text(
              //                 "Joining..",
              //                 style: TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 10.sp,
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       )
              //     :
              InkWell(
                      onTap: () {
                        if(widget.data.meetingPass==null){
                          utilService.showToast("You Can't join meeting at the moment");
                          return;
                        }

                        joinMeeting(context);
                        setState(() {
                          active = !active;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 12.h),
                        padding: EdgeInsets.fromLTRB(
                          10.w,
                          5.h,
                          10.w,
                          5.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.r),
                          border: Border.all(
                            width: 1.w,
                            color: Color.fromRGBO(
                              30,
                              144,
                              241,
                              1,
                            ),
                          ),
                        ),
                        child: Text(
                          "Join Event",
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(
                              30,
                              144,
                              241,
                              1,
                            ),
                          ),
                        ),
                      ),
                    )
            ],
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Event Created by ',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(
                      193,
                      199,
                      215,
                      1,
                    ),
                  ),
                ),
                TextSpan(
                  text: "${widget.data.user.name}",//widget.data["name"],
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(
                      51,
                      61,
                      70,
                      1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
