// import 'dart:isolate';
// import 'dart:ui';


import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/providers/student_provider.dart';
import 'package:einstien_academy_flutter/screens/report_issue_screen.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/util_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/audio_bottom_sheet.dart';
import 'package:einstien_academy_flutter/widgets/image_viewer.dart';
import 'package:einstien_academy_flutter/widgets/pdf_view_widget.dart';
import 'package:einstien_academy_flutter/widgets/study_materails_details_widget.dart';
import 'package:einstien_academy_flutter/widgets/video_player.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class StudyNotesDetailsScreen extends StatefulWidget {
  final String id;
  const StudyNotesDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  _StudyNotesDetailsScreenState createState() =>
      _StudyNotesDetailsScreenState();
}

class _StudyNotesDetailsScreenState extends State<StudyNotesDetailsScreen> {
  List<Map<String, dynamic>> addStudymaterialsDetailsList = [
    {
      "id": "1",
      "title": "marketing_material.pdf",
      "img": "assets/images/pdf.png",
    },
    {
      "id": "2",
      "title": "marketing_material.pdf",
      "img": "assets/images/PPT.png",
    },
    {
      "id": "3",
      "title": "marketing_material.pdf",
      "img": "assets/images/VideoPDF.png",
    },
  ];
  String tagId = ' ';
  void active(
    dynamic val,
  ) {
    setState(() {
      tagId = val;
    });
  }

  getData() async {
    Provider.of<StudentProvider>(context, listen: false).studentNotesDetail =
        null;
    await Provider.of<StudentProvider>(context, listen: false)
        .callGetStudentNotesDetail(widget.id);
  }

  //ReceivePort _port = ReceivePort();
  @override
  void initState() {
    getData();

    // IsolateNameServer.registerPortWithName(
    //     _port.sendPort, 'downloader_send_port');
    // _port.listen((dynamic data) {
    //   String id = data[0];
    //   DownloadTaskStatus status = data[1];
    //   int progress = data[2];
    //   setState(() {});
    // });

    // FlutterDownloader.registerCallback(downloadCallback);
    super.initState();
  }

  // @override
  // void dispose() {
  //   IsolateNameServer.removePortNameMapping('downloader_send_port');
  //   super.dispose();
  // }

  // static void downloadCallback(
  //     String id, DownloadTaskStatus status, int progress) {
  //   final SendPort? send =
  //       IsolateNameServer.lookupPortByName('downloader_send_port');
  //   send!.send([id, status, progress]);
  // }

  // void downloadFile(String url) async {
  //   final status = await Permission.storage.request();
  //   if (status.isGranted) {
  //     // ignore: unused_local_variable
  //     final externalDir = await getExternalStorageDirectory();
  //     print("downloadhjhj${externalDir!.absolute.path}");
  //     // ignore: unused_local_variable
  //     final id = await FlutterDownloader.enqueue(
  //
  //       url:
  //       "https://www.einsteins-academy.com/einsteinacademy/public/media/study_notes/LWKMl2WZS623VBk5dft2.docx",
  //        //"https://www.einsteins-academy.com/einsteinacademy/public/media/study_notes/sImOcgYTTB4JspQTo4TT.pptx",
  //       //storage/emulated/0/Download
  //       savedDir: "/storage/emulated/0/Download",//externalDir.absolute.path,
  //       fileName: "testDownload23",
  //       showNotification: true,
  //       openFileFromNotification: true,
  //       saveInPublicStorage: true,
  //     );
  //   }
  // }
  downloadFile(String value) async {
    String url = value;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final utilService = locator<UtilService>();

  var navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(
        244,
        247,
        254,
        1,
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(top: 23.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigationService.closeScreen();

                        //navigationService.navigateTo(StudyMaterialScreenRoute);
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left_rounded,
                        size: 30.h,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Student Notes Detail",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
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
      body: Consumer<StudentProvider>(
        builder: (context, i, _) {
          return i.studentNotesDetail != null
              ? SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(15.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "All Study Materials",
                              style: TextStyle(
                                color: Color.fromRGBO(
                                  68,
                                  79,
                                  84,
                                  1,
                                ),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Card(
                          color: Colors.white,
                          child: Container(
                            padding: EdgeInsets.all(15.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Title",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade500),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "${i.studentNotesDetail!.title}",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "Subject & Grade",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade300),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
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
                                      "${i.studentNotesDetail!.subject.name}",
                                      style: TextStyle(
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade800),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "•",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.grey.shade500),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
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
                                      "${i.studentNotesDetail!.grade.name}",
                                      style: TextStyle(
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade800),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  "Material",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade400),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.only(right: 1),
                                    shrinkWrap: true,
                                    itemCount:
                                        i.studentNotesDetail!.medias.length,
                                    itemBuilder: (ctx, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Image(
                                                image: AssetImage(i
                                                            .studentNotesDetail!
                                                            .type ==
                                                        "pdf"
                                                    ? "assets/images/pdf.png"
                                                    //:i.studentNotesDetail!.type=="Video"? "assets/images/mp4.png"
                                                    : i.studentNotesDetail!
                                                                    .type ==
                                                                "docx" ||
                                                            i.studentNotesDetail!
                                                                    .type ==
                                                                "doc"
                                                        ? "assets/images/doc.png"
                                                        : i.studentNotesDetail!
                                                                        .type ==
                                                                    "pptx" ||
                                                                i.studentNotesDetail!
                                                                        .type ==
                                                                    "ppt"
                                                            ? "assets/images/pptx.png"
                                                            //:i.studentNotesDetail!.type=="Image"? "assets/images/img.png"

                                                            : "assets/images/img.png"),
                                                fit: BoxFit.cover,
                                                height: 30.h,
                                                width: 30.w,
                                              ),
                                            ),
                                            Container(
                                                width: width * 0.55,
                                                //color:Colors.red,

                                                child: Text(
                                                  i.studentNotesDetail!
                                                      .medias[index].name,
                                                  //i.studentNotesDetail!.medias[index].path.split('/').last ,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                )),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    // if(i.studentNotesDetail!.type=="Audio"){
                                                    //   settingModalBottomSheet(context,i.studentNotesDetail!.medias[index].path);
                                                    //
                                                    // }

                                                    // else
                                                    if (i.studentNotesDetail!
                                                            .type ==
                                                        "pdf") {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      PDFWidget(
                                                                        url: i
                                                                            .studentNotesDetail!
                                                                            .medias[index]
                                                                            .path,
                                                                      )));

                                                      //VideoPlayerWidget(url: i.teacherMaterialDetail!.medias[index].path,);

                                                    } else if (i
                                                            .studentNotesDetail!
                                                            .type ==
                                                        "Image") {
                                                      //VideoPlayerWidget(url: i.teacherMaterialDetail!.medias[index].path,);
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      ImageViewer(
                                                                        url: i
                                                                            .studentNotesDetail!
                                                                            .medias[index]
                                                                            .path,
                                                                      )));
                                                    } else {
                                                      downloadFile(
                                                        i.studentNotesDetail!
                                                            .medias[index].path,
                                                      );
                                                    }

                                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>View(url: i.studentNotesDetail!.medias[index].path,)));
                                                  },
                                                  child: Container(
                                                    height: 20,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3.r),
                                                      border: Border.all(
                                                        color: Color.fromRGBO(
                                                          30,
                                                          144,
                                                          241,
                                                          1,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        i.studentNotesDetail!
                                                                        .type ==
                                                                    "pdf" ||
                                                                i.studentNotesDetail!
                                                                        .type ==
                                                                    "Image"
                                                            ? "View"
                                                            : "Download",
                                                        style: TextStyle(
                                                            fontSize: 8.sp,
                                                            color:
                                                                Color.fromRGBO(
                                                              30,
                                                              144,
                                                              241,
                                                              1,
                                                            ),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "Uploaded By",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade400),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Center(
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: FadeInImage(
                                          image: NetworkImage(
                                            "${i.studentNotesDetail!.user.profileImg}",
                                          ),
                                          placeholder: AssetImage(
                                              "assets/images/placeHolder.png"),
                                          imageErrorBuilder:
                                              (context, i, error) =>
                                                  Image.asset(
                                            "assets/images/placeHolder.png",
                                            height: 53,
                                            width: 53,
                                            fit: BoxFit.cover,
                                          ),
                                          height: 70.h,
                                          width: 70.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        "${i.studentNotesDetail!.user.name}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp,
                                            color: Colors.grey.shade700,
                                            height: 1.h),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "${i.studentNotesDetail!.user.type}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                            color: Colors.grey.shade400),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      RatingBar.builder(
                                        initialRating: double.parse(i
                                            .studentNotesDetail!.rating
                                            .toString()),
                                        minRating: 0,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        ignoreGestures: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 2.0, vertical: 2.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),

                                      InkWell(
                                        onTap: i.studentNotesDetail!.userId ==
                                                Provider.of<AuthProvider>(
                                                        context,
                                                        listen: false)
                                                    .user!
                                                    .id
                                            ? () {
                                                utilService.showToast(
                                                    "You can't follow yourself");
                                              }
                                            : () {
                                                Provider.of<AuthProvider>(
                                                        context,
                                                        listen: false)
                                                    .callFollowUnFollow(i
                                                        .studentNotesDetail!
                                                        .user
                                                        .id
                                                        .toString())
                                                    .then((value) {
                                                  setState(() {
                                                    i.studentNotesDetail!
                                                            .isFollow =
                                                        !i.studentNotesDetail!
                                                            .isFollow;
                                                  });
                                                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportIssueScreen()));
                                                });
                                              },
                                        child: Container(
                                          height: 20,
                                          width: 60,
                                          margin: EdgeInsets.only(top: 3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.r),
                                            color:
                                                i.studentNotesDetail!.isFollow
                                                    ? Color.fromRGBO(
                                                        30,
                                                        144,
                                                        241,
                                                        1,
                                                      )
                                                    : Colors.transparent,
                                            border: Border.all(
                                              color: Color.fromRGBO(
                                                30,
                                                144,
                                                241,
                                                1,
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 3.h, bottom: 3.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                i.studentNotesDetail!.isFollow
                                                    ? Icon(
                                                        Icons.check,
                                                        color: Colors.white,
                                                        size: 10.h,
                                                      )
                                                    : Container(),
                                                i.studentNotesDetail!.isFollow
                                                    ? SizedBox(
                                                        width: 5.w,
                                                      )
                                                    : Container(),
                                                Text(
                                                  "Follow",
                                                  style: TextStyle(
                                                      fontSize: 8.sp,
                                                      color:
                                                          i.studentNotesDetail!
                                                                  .isFollow
                                                              ? Colors.white
                                                              : Color.fromRGBO(
                                                                  30,
                                                                  144,
                                                                  241,
                                                                  1,
                                                                ),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                      // InkWell(
                                      //   onTap: () {},
                                      //   child: Container(
                                      //     margin: EdgeInsets.only(top: 3),
                                      //     decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.circular(3.r),
                                      //       border: Border.all(
                                      //         color: Color.fromRGBO(30, 144, 241, 1),
                                      //       ),
                                      //     ),
                                      //     child: Padding(
                                      //       padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 6.h, bottom: 6.h),
                                      //       child: Text(
                                      //         "Follow",
                                      //         style: TextStyle(
                                      //             fontSize: 9.sp,
                                      //             color: Color.fromRGBO(30, 144, 241, 1,),
                                      //             fontWeight: FontWeight.w600),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 10.h,
                                      ),

                                      InkWell(
                                        onTap: i.studentNotesDetail!.userId ==
                                                Provider.of<AuthProvider>(
                                                        context,
                                                        listen: false)
                                                    .user!
                                                    .id
                                            ? () {
                                                utilService.showToast(
                                                    "You can't follow yourself");
                                              }
                                            : () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ReportIssueScreen(
                                                              id: i
                                                                  .studentNotesDetail!
                                                                  .id
                                                                  .toString(),
                                                              type:
                                                                  "study-notes",
                                                            )));
                                              },
                                        child: Container(
                                          height: 30,
                                          width: width * 0.5,
                                          margin: EdgeInsets.only(top: 3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.r),
                                            //color:activeFollow? Color.fromRGBO(30, 144, 241, 1,):Colors.transparent,
                                            border: Border.all(
                                              color: Color.fromRGBO(
                                                30,
                                                144,
                                                241,
                                                1,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Report Issue against this content",
                                              style: TextStyle(
                                                  fontSize: 9.sp,
                                                  color: Color.fromRGBO(
                                                    30,
                                                    144,
                                                    241,
                                                    1,
                                                  ),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
