import 'dart:async';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/providers/teacher_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/util_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/add_disscussion_list.dart';
import 'package:einstien_academy_flutter/widgets/button_widget.dart';
import 'package:einstien_academy_flutter/widgets/exit_dailog_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_zoom_sdk/zoom_options.dart';
import 'package:flutter_zoom_sdk/zoom_view.dart';

import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:provider/provider.dart';

class CreatEventSessionScreen extends StatefulWidget {
  const CreatEventSessionScreen({Key? key}) : super(key: key);

  @override
  _CreatEventSessionScreenState createState() =>
      _CreatEventSessionScreenState();
}

class _CreatEventSessionScreenState extends State<CreatEventSessionScreen> {
  // List<Map<String, dynamic>> adddiscussionList = [
  //   {
  //     "id": "1",
  //     "title": "Brandi Micheal",
  //     "img": "assets/images/dummy.jpg",
  //   },
  //   {
  //     "id": "2",
  //     "title": "Alexa Sas",
  //     "img": "assets/images/dummy1.jpg",
  //   },
  //   {
  //     "id": "3",
  //     "title": "12 Standards",
  //     "img": "assets/images/persons.png",
  //   },
  // ];
  var now = DateTime.now();
  //final format = ;
  var navigationService = locator<NavigationService>();

  final titleCnt = TextEditingController();
  final zoomPassCnt = TextEditingController();
  final descCnt = TextEditingController();
  //final dateTimeCnt=TextEditingController();

  late Timer timer;

  startMeeting(BuildContext context, String pass) {
    bool _isMeetingEnded(String status) {
      var result = false;
      if (Platform.isAndroid)
        result = status == "MEETING_STATUS_DISCONNECTING" ||
            status == "MEETING_STATUS_FAILED";
      else
        result = status == "MEETING_STATUS_IDLE";

      return result;
    }

    ZoomOptions zoomOptions = new ZoomOptions(
      domain: "zoom.us",
      appKey:
          "XKE4uWfeLwWEmh78YMbC6mqKcF8oM4YHTr9I", //API KEY FROM ZOOM -- SDK KEY
      appSecret:
          "bT7N61pQzaLXU6VLj9TVl7eYuLbqAiB0KAdb", //API SECRET FROM ZOOM -- SDK SECRET
    );
    var meetingOptions = new ZoomMeetingOptions(
        userId:
            'evilrattdeveloper@gmail.com', //'${Provider.of<AuthProvider>(context,listen: false).user!.email}', //pass host email for zoom
        userPassword:
            'Dlinkmoderm0641', //'$pass', //pass host password for zoom
        disableDialIn: "false",
        disableDrive: "false",
        disableInvite: "false",
        disableShare: "false",
        disableTitlebar: "false",
        viewOptions: "false",
        noAudio: "false",
        noDisconnectAudio: "false");

    var zoom = ZoomView();

    zoom.initZoom(zoomOptions).then((results) {
      print("this is the error: ${results[0]}");
      print("this is the error: ${results[1]}");

      if (results[0] == 0) {
        zoom.startMeeting(meetingOptions).then((loginResult) {
          print("[LoginResult] :- " + loginResult[0] + " - " + loginResult[1]);
          if (loginResult[0] == "SDK ERROR") {
            print((loginResult[1]).toString());
          } else if (loginResult[0] == "LOGIN ERROR") {
            Navigator.pop(context);
            Navigator.pop(context);
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   //duration: Duration(seconds: 5),
            //   content: Text("Wrong password"),
            // ));

            //Provider.of<TeacherProvider>(context,listen: false).saveZoomPassword(true);

            print((loginResult[1]).toString());
          } else if (loginResult[0] == "ERROR_USER_NOT_EXIST") {
            //utilService.showToast("ERROR_USER_NOT_EXIST");
            //navigationService.closeScreen();

            print((loginResult[1]).toString());
          } else {
            //print((loginResult[0]).toString());
            print("error: ${(loginResult[1]).toString()}");
          }
        });

        zoom.onMeetingStatus().listen((status) {
          print("[Meeting Status Stream] : " + status[0] + " - " + status[1]);
          if (Platform.isIOS) {
            if (status[0] == "MEETING_STATUS_ENDED") {
              print("[Meeting Status] :- Ended");
              var endMeetingID =
                  Provider.of<AuthProvider>(context, listen: false)
                      .zoomMeetingStartedID;
              Provider.of<AuthProvider>(context, listen: false)
                  .callEndZoomMeeting(endMeetingID!);

              timer.cancel();
            }
          }

          if (_isMeetingEnded(status[0])) {
            print("[Meeting Status] :- Ended");
            var endMeetingID = Provider.of<AuthProvider>(context, listen: false)
                .zoomMeetingStartedID;
            Provider.of<AuthProvider>(context, listen: false)
                .callEndZoomMeeting(endMeetingID!);

            timer.cancel();
          }
          if (status[0] == "MEETING_STATUS_INMEETING") {
            zoom.meetinDetails().then((meetingDetailsResult) {
              // setState(() {
              //   isLoadingProgress=false;
              // });
              var endMeetingID =
                  Provider.of<AuthProvider>(context, listen: false)
                      .zoomMeetingStartedID;

              Provider.of<AuthProvider>(context, listen: false)
                  .callUpdateStartZoomMeeting(
                      id: endMeetingID!,
                      meetingID: meetingDetailsResult[0].toString(),
                      pass: meetingDetailsResult[1].toString());

              print('this is meeting--${meetingDetailsResult[0].toString()}');
              print("[MeetingDetailsResult] :- " +
                  meetingDetailsResult.toString());
            });
          }
        });
      }
    }).catchError((error) {
      print("[Error Generated] : " + error);
    });
  }

  FilePickerResult? result;
  UtilService utilService = locator<UtilService>();
  bool isLoadingProgress = false;

  @override
  void initState() {
    ZoomOptions zoomOptions = new ZoomOptions(
      domain: "zoom.us",
      appKey:
          "XKE4uWfeLwWEmh78YMbC6mqKcF8oM4YHTr9I", //API KEY FROM ZOOM -- SDK KEY
      appSecret:
          "bT7N61pQzaLXU6VLj9TVl7eYuLbqAiB0KAdb", //API SECRET FROM ZOOM -- SDK SECRET
    );
    var zoom = ZoomView();

    zoom.initZoom(zoomOptions);
    // TODO: implement initState
    super.initState();
  }

  // @override
  // void initState() {
  //   ZoomOptions zoomOptions = new ZoomOptions(
  //     domain: "zoom.us",
  //     appKey: "XKE4uWfeLwWEmh78YMbC6mqKcF8oM4YHTr9I", //API KEY FROM ZOOM -- SDK KEY
  //     appSecret: "bT7N61pQzaLXU6VLj9TVl7eYuLbqAiB0KAdb", //API SECRET FROM ZOOM -- SDK SECRET
  //   );
  //   var zoom = ZoomView();
  //
  //   zoom.initZoom(zoomOptions);
  //   super.initState();
  // }

  // DateTime now = DateTime.now();
  // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(top: 23.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        navigationService.closeScreen();
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left_rounded,
                        size: 24.h,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Create Event/Session",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
            preferredSize: Size.fromHeight(0),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 25.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Container(
                          child: TextField(
                            controller: titleCnt,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 15),
                              hintText: "Event Title",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          child: TextField(
                            controller: descCnt,
                            maxLines: 3,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 15),
                              hintText: "Event Description",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        // Container(
                        //   child: DateTimeField(
                        //     format: format,
                        //     controller: dateTimeCnt,
                        //     decoration: InputDecoration(
                        //       contentPadding: EdgeInsets.symmetric(
                        //           vertical: 14, horizontal: 15),
                        //       hintText: "Event Date And Time",
                        //       suffixIcon: Icon(Icons.calendar_today_outlined),
                        //       hintStyle: TextStyle(color: Colors.grey),
                        //       border: OutlineInputBorder(),
                        //       focusedBorder: OutlineInputBorder(
                        //           borderSide: BorderSide(color: Colors.grey),
                        //           borderRadius: BorderRadius.circular(5)),
                        //       enabledBorder: OutlineInputBorder(
                        //           borderSide: BorderSide(color: Colors.grey),
                        //           borderRadius: BorderRadius.circular(5)),
                        //     ),
                        //     onShowPicker: (context, currentValue) async {
                        //       // final time = await showTimePicker(
                        //       //   context: context,
                        //       //   initialTime: TimeOfDay.fromDateTime(
                        //       //       currentValue ?? DateTime.now()),
                        //       // );
                        //       // return DateTimeField.convert(time);
                        //       final date = await showDatePicker(
                        //           context: context,
                        //           firstDate: DateTime.now(),
                        //           initialDate: currentValue ?? DateTime.now(),
                        //           lastDate: DateTime(2100));
                        //       if (date != null) {
                        //         final time = await showTimePicker(
                        //           context: context,
                        //           initialTime:
                        //           TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                        //         );
                        //         return DateTimeField.combine(date, time);
                        //       } else {
                        //         return currentValue;
                        //       }
                        //     },
                        //   ),
                        // ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 15),
                              hintText: "Add Participants",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    // Text(
                    //   "ADDED PARTICIPANTS",
                    //   style: TextStyle(
                    //     color: Colors.grey,
                    //     fontSize: 12.sp,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15.h,
                    // ),
                    // ListView.builder(
                    //     physics: NeverScrollableScrollPhysics(),
                    //     padding: EdgeInsets.only(right: 1),
                    //     shrinkWrap: true,
                    //     itemCount: adddiscussionList.length,
                    //     itemBuilder: (ctx, i) {
                    //       return AddDicussionList(
                    //         data: adddiscussionList[i],
                    //       );
                    //     }),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        var value = await FilePicker.platform.pickFiles(
                          allowMultiple: false,
                          type: FileType.image,
                          //allowedExtensions: extension,
                        );
                        if (value != null) {
                          setState(() {
                            result = value;
                          });
                        }

                        //print(result!.files.first.path);
                      },
                      child: DottedBorder(
                          dashPattern: [
                            4,
                            4,
                          ],
                          color: Colors.grey[400]!,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(9),
                          //padding: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: result != null
                                ? Container(
                                    height: height * 0.22,
                                    width: width,
                                    child: Image.file(
                                      File(result!.files.first.path!),
                                      // width: 90,
                                      // height: 90,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : InkWell(
                                    onTap: () async {
                                      var value =
                                          await FilePicker.platform.pickFiles(
                                        allowMultiple: false,
                                        type: FileType.image,
                                        //allowedExtensions: extension,
                                      );
                                      setState(() {
                                        result = value;
                                      });

                                      print(result!.files.first.path);
                                      //_settingModalBottomSheet(context);
                                    },
                                    child: Container(
                                      height: height * 0.2,
                                      width: width,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                              child: Icon(
                                            Icons.image,
                                            size: 35,
                                            color: Colors.grey,
                                          )),
                                          Text(
                                            "Upload Event/Session Image",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Max file size 2mb",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                          )),
                    ),

                    // GestureDetector(
                    //   onTap: () {
                    //     _settingModalBottomSheet(context);
                    //   },
                    //   child: Container(
                    //     child: DottedBorder(
                    //         dashPattern: [3, 2],
                    //         radius: Radius.circular(100),
                    //         color: Colors.grey,
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             SizedBox(
                    //               height: 30.h,
                    //             ),
                    //             Center(
                    //                 child: Icon(
                    //               Icons.image,
                    //               size: 35.h,
                    //               color: Colors.grey,
                    //             )),
                    //             Text(
                    //               "Upload Discussion Board Image",
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.grey),
                    //             ),
                    //             SizedBox(
                    //               height: 5,
                    //             ),
                    //             Text(
                    //               "Max file size 2mb",
                    //               style: TextStyle(
                    //                   color: Colors.grey, fontSize: 12.sp),
                    //             ),
                    //             SizedBox(
                    //               height: 30.h,
                    //             ),
                    //           ],
                    //         )),
                    //   ),
                    // ),
                    SizedBox(
                      height: 35.h,
                    ),
                    ButtonWidget(
                      name: "Create Event/Session",
                      onpreseed: () {
                        FocusScope.of(context).unfocus();

                        if (titleCnt.text.isEmpty ||
                            descCnt.text.isEmpty ||
                            result == null) {
                          utilService.showToast("The Fields can't be Empty");
                          return;
                        }
                        setState(() {
                          isLoadingProgress = true;
                        });

                        var userID =
                            Provider.of<AuthProvider>(context, listen: false)
                                .user!
                                .id;
                        Provider.of<AuthProvider>(context, listen: false)
                            .callStartZoomMeeting(
                                title: "${titleCnt.text}",
                                desc: "${descCnt.text}",
                                dateTime:
                                    "${DateFormat("yyyy-MM-dd kk:mm:ss").format(now)}",
                                userID: userID.toString(),
                                img: result!.files.first.path!)
                            .then((value) {
                          setState(() {
                            isLoadingProgress = false;
                          });
                          if (value == "done") {
                            print("this is api call $value");
                            //Navigator.pop(context);

                            startMeeting(context, zoomPassCnt.text);
                          } else if (value == "fail") {
                            utilService
                                .showToast("Can't start meeting at the moment");
                          }
                        });

                        // _displayTextInputDialog();
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    )
                  ],
                ),
              ),
            ),
          ),
          if (isLoadingProgress) LoadingWidget(),
        ],
      ),
    );
  }

  // Future<void> _displayTextInputDialog() async {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('Give Zoom Password'),
  //           content:   Container(
  //             height: 100,
  //             child: Column(
  //               //mainAxisAlignment: MainAxisAlignment.end,
  //               crossAxisAlignment: CrossAxisAlignment.end,
  //               children: [
  //                 TextField(
  //                   controller: zoomPassCnt,
  //                   decoration: InputDecoration(
  //                     contentPadding: EdgeInsets.symmetric(
  //                         vertical: 14, horizontal: 15),
  //                     hintText: "Enter Zoom Password",
  //                     hintStyle: TextStyle(color: Colors.grey),
  //                     border: OutlineInputBorder(),
  //                     focusedBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.grey),
  //                         borderRadius: BorderRadius.circular(5)),
  //                     enabledBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.grey),
  //                         borderRadius: BorderRadius.circular(5)),
  //                   ),
  //                 ),
  //                 SizedBox(height: 10,),
  //                 GestureDetector(
  //                   onTap: (){
  //                     FocusScope.of(context).unfocus();
  //                     if(zoomPassCnt.text.isEmpty){
  //                       utilService.showToast("Enter zoom password");
  //                       return;
  //
  //                     }
  //                     // setState(() {
  //                     //   isLoadingProgress=true;
  //                     // });
  //
  //                     //startMeeting(context,zoomPassCnt.text);
  //                   },
  //                     child: Text("Ok",style: TextStyle(color: Colors.blue),)
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

}
