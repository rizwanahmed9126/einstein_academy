

import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:einstien_academy_flutter/models/user.dart';
import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/screens/notification_screen.dart';
import 'package:einstien_academy_flutter/screens/profile_detail.dart';
import 'package:einstien_academy_flutter/screens/report_issue_screen.dart';
import 'package:einstien_academy_flutter/screens/teacher/study_material_screen.dart';

import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/exit_dailog_widget.dart';
import 'package:einstien_academy_flutter/widgets/hawk_fab_menu_widget.dart';
import 'package:einstien_academy_flutter/widgets/main_drawer_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
//import 'package:flutter_filereader/flutter_filereader.dart';
//import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_file/internet_file.dart';
import 'package:internet_file/storage_io.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

// import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeScreenTeacher extends StatefulWidget {
  const HomeScreenTeacher({Key? key}) : super(key: key);

  @override
  _HomeScreenTeacherState createState() => _HomeScreenTeacherState();
}

class _HomeScreenTeacherState extends State<HomeScreenTeacher> {
  //late User user;
  var navigationService = locator<NavigationService>();

  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  // var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = Size(50.h, 50.h);
  var childrenButtonSize = Size(50.h, 50.h);
  var selectedfABLocation = FloatingActionButtonLocation.endDocked;
  var items = [
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.endDocked,
  ];
  List homeTab = [
    {
      "Text": "Study Material",
      "image": "assets/images/Menu01.png",
      "id": "1",
    },
    {
      "image": "assets/images/Menu04.png",
      "Text": "Discussion Board",
      "id": "2",
    },
    {
      "image": "assets/images/Menu05.png",
      "Text": "Event/Session",
      "id": "3",
    },
  ];





  // Future<String> downloadFile() async {
  //   var tempDir = await getExternalStorageDirectory();
  //   String tempPath = tempDir!.path;
  //   print(tempPath);
  //
  //   HttpClient httpClient = new HttpClient();
  //   File file;
  //   String filePath = '';
  //   String myUrl = '';
  //
  //   try {
  //    // myUrl = url+'/'+fileName;
  //     var request = await httpClient.getUrl(Uri.parse("https://demo.techstirr.com/einsteinacademy/public/media/user_profile/kdTHDv24KtVDDGa4ylpO.jpg"));
  //     var response = await request.close();
  //     if(response.statusCode == 200) {
  //       var bytes = await consolidateHttpClientResponseBytes(response);
  //       filePath = '$tempPath';//'$dir/$fileName';
  //       file = File(filePath);
  //       await file.writeAsBytes(bytes);
  //     }
  //     else
  //       filePath = 'Error code: '+response.statusCode.toString();
  //   }
  //   catch(ex){
  //     filePath = 'Can not fetch url';
  //   }
  //
  //   return filePath;
  // }

  // void downloadFile() async {
  //   final status = await Permission.storage.request();
  //   if (status.isGranted) {
  //     // ignore: unused_local_variable
  //     final externalDir = await getExternalStorageDirectory();
  //     // ignore: unused_local_variable
  //     final id = await FlutterDownloader.enqueue(
  //       url: "https://demo.techstirr.com/einsteinacademy/public/media/study_material/j3yF19KXn5zeLZCTbG05.docx",
  //       // "https://firebasestorage.googleapis.com/v0/b/storage-3cff8.appspot.com/o/2020-05-29%2007-18-34.mp4?alt=media&token=841fffde-2b83-430c-87c3-2d2fd658fd41",
  //       //storage/emulated/0/Download
  //       savedDir: externalDir!.path,
  //       fileName: "fileName",
  //       showNotification: true,
  //       openFileFromNotification: true,
  //       saveInPublicStorage: true,
  //     );
  //   }
  // }




  _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => ExitAlertDialog(),
    );
  }

  final _advancedDrawerController = AdvancedDrawerController();
  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context,listen: false).callFollowCount();

    // IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
    // _port.listen((dynamic data) {
    //   String id = data[0];
    //   DownloadTaskStatus status = data[1];
    //   int progress = data[2];
    //   setState((){ });
    // });

    // FlutterDownloader.registerCallback(downloadCallback);

  }
  // @override
  // void dispose() {
  //   IsolateNameServer.removePortNameMapping('downloader_send_port');
  //   super.dispose();
  // }

  // static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
  //   final SendPort? send = IsolateNameServer.lookupPortByName('downloader_send_port');
  //   send!.send([id, status, progress]);
  // }

  // Future<void> openFile(String filePath) async {
  //   // var filePath = r'/storage/emulated/0/update.apk';
  //   // FilePickerResult result = await FilePicker.platform.pickFiles();
  //
  //   // if (result != null) {
  //   //   filePath = result.files.single.path;
  //   // } else {
  //   //   // User canceled the picker
  //   // }
  //   final _result = await OpenFile.open(filePath);
  //   print(_result.message);
  //
  //   // setState(() {
  //   //   _openResult = "type=${_result.type}  message=${_result.message}";
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
      onWillPop: () => _onBackPressed(),
      child:
      AdvancedDrawer(
        backdropColor: Colors.blueGrey,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        drawer: TeacherDrawerWidget(),
        child: Scaffold(
            backgroundColor: Color.fromRGBO(244, 247, 254, 1,),
            appBar: AppBar(
              leadingWidth: 40.w,
              centerTitle: false,
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Color.fromRGBO(30, 144, 241, 1,),
              leading: IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                        duration: Duration(milliseconds: 250),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Image(
                            image: AssetImage("assets/images/MenuButton.png"),
                            width: 45.w,
                            height: 45.h,
                            key: ValueKey<bool>(value.visible),
                          ),
                        ));
                  },
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () async{
                    final platform = Theme.of(context).platform;

                    // final storageIO = InternetFileStorageIO();
                    //
                    // await InternetFile.get(
                    //   'https://demo.techstirr.com/einsteinacademy/public/media/study_material/j3yF19KXn5zeLZCTbG05.docx',
                    //   storage: storageIO,
                    //   storageAdditional: {
                    //     'filename': 'docx_file',
                    //     'location': '',
                    //   },
                    //   process: (percentage) {
                    //     print('downloadPercentage: $percentage');
                    //   },
                    // );

                    //downloadFile();

                    //openFile("https://demo.techstirr.com/einsteinacademy/public/media/study_material/j3yF19KXn5zeLZCTbG05.docx");

                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportIssueScreen()));

                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(platform: platform,)));


                    // final taskId = await FlutterDownloader.enqueue(
                    //   url: 'https://demo.techstirr.com/einsteinacademy/public/media/user_profile/sBJL3kLjsLovj6DCxqBA.png',
                    //   savedDir: '/storage/emulated/0/Download',
                    //   showNotification: true, // show download progress in status bar (for Android)
                    //   openFileFromNotification: true, // click on notification to open downloaded file (for Android)
                    // );


                    navigationService.navigateTo(NotificationScreenRoute);
                  },
                  icon: Image.asset(
                    "assets/images/notificationalert.png",
                    scale: 4.h,
                  ),
                ),
              ],
              bottom: PreferredSize(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5.h, left: 15.w, right: 15.w, bottom: 40.h,),
                      child: Consumer<AuthProvider>(
                          builder: (context,i,_){
                            return InkWell(
                              onTap: (){
                                String id=i.user!.id.toString();
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileDetailScreen(id: id,)));

                                },
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: FadeInImage(

                                      image: NetworkImage("${i.user!.profileImg}",),
                                      placeholder: AssetImage("assets/images/placeHolder.png"),
                                      imageErrorBuilder: (context,i,error)=>Image.asset("assets/images/placeHolder.png",height: 53,width: 53,fit: BoxFit.cover,),
                                      height: 53,
                                      width: 53,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hi, ${i.user!.name}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Consumer<AuthProvider>(
                                          builder: (context,i,_){
                                            return int.parse(i.followCount)>0? Text(
                                              "${i.followCount} Followers",
                                              style: TextStyle(
                                                color: Color.fromRGBO(193, 199, 215, 1,),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ):Container();

                                          })
                                    ],
                                  )
                                ],
                              ),
                            );

                          }
                      ),


                    ),
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
                preferredSize: Size(double.infinity, 110.h),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(bottom: 15.0.h),
              child: HawkFabMenu(
                openIcon: "assets/images/plusicon.png",
                closeIcon: "assets/images/00-StudyMaterial-AddButton-02.png",
                fabColor: Theme.of(context).primaryColor,
                iconColor: Colors.white,
                items: [
                  HawkFabMenuItem(
                    color: Colors.white,
                    label: 'Add Study Material',
                    ontap: () {
                      navigationService.navigateTo(AddStudyMaterialScreenRoute);
                    },
                    icon: Image.asset(
                      "assets/images/Menu02.png",
                      fit: BoxFit.fill,
                      height: 35.h,
                    ),
                    labelColor: Colors.white,
                    labelBackgroundColor: Colors.blue,
                  ),
                  HawkFabMenuItem(
                    label: 'Add Discussion',
                    ontap: () {
                      navigationService
                          .navigateTo(AddDiscussionBoardScreenRoute);
                    },
                    labelBackgroundColor: Colors.white,
                    color: Colors.white,
                    icon: Image.asset(
                      "assets/images/Menu03.png",
                      height: 35.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                  HawkFabMenuItem(
                    color: Colors.white,
                    label: 'Add Event/Session',
                    ontap: () {
                      navigationService
                          .navigateTo(CreatEventSessionScreenRoute);
                    },
                    labelBackgroundColor: Colors.white,
                    icon: Image.asset(
                      "assets/images/Menu04.png",
                      fit: BoxFit.fill,
                      height: 35.h,
                    ),
                  ),
                ],
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(35.w),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 220,
                          childAspectRatio: 1 / 1,
                          crossAxisSpacing: 15.h,
                          mainAxisSpacing: 15.h,
                        ),
                        itemCount: homeTab.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyMaterialScreen()));
                                navigationService.navigateTo(StudyMaterialScreenRoute);
                              } else if (index == 1) {
                                navigationService.navigateTo(DiscussionBoardScreenRoute);
                              } else {
                                navigationService.navigateTo(EventAndSessionScreenRoute);
                              }
                            },
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    homeTab[index]["image"],
                                    scale: 1.r,
                                    height: 100.h,
                                  ),
                                  Text(
                                    homeTab[index]["Text"],
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
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
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

// class FileReaderPage extends StatefulWidget {
//   final String filePath;
//
//   FileReaderPage({key: Key, required this.filePath});
//
//   @override
//   _FileReaderPageState createState() => _FileReaderPageState();
// }
//
// class _FileReaderPageState extends State<FileReaderPage> {
//   Future<void> openFile() async {
//     // var filePath = r'/storage/emulated/0/update.apk';
//     // FilePickerResult result = await FilePicker.platform.pickFiles();
//
//     // if (result != null) {
//     //   filePath = result.files.single.path;
//     // } else {
//     //   // User canceled the picker
//     // }
//     final _result = await OpenFile.open(filePath);
//     print(_result.message);
//
//     // setState(() {
//     //   _openResult = "type=${_result.type}  message=${_result.message}";
//     // });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("doc"),
//       ),
//       body: OpenFile.open("/sdcard/example.txt");,
//     );
//   }
// }








// class MyHomePage extends StatefulWidget with WidgetsBindingObserver {
//   final TargetPlatform? platform;

//   MyHomePage({Key? key, this.title, this.platform}) : super(key: key);

//   final String? title;

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final _documents = [
//     {
//       'name': 'Learning Android Studio',
//       'link':
//       'http://barbra-coco.dyndns.org/student/learning_android_studio.pdf'
//     },
//     {
//       'name': 'Android Programming Cookbook',
//       'link':
//       'http://enos.itcollege.ee/~jpoial/allalaadimised/reading/Android-Programming-Cookbook.pdf'
//     },
//     {
//       'name': 'iOS Programming Guide',
//       'link':
//       'http://darwinlogic.com/uploads/education/iOS_Programming_Guide.pdf'
//     },
//     {
//       'name': 'Objective-C Programming (Pre-Course Workbook',
//       'link':
//       'https://www.bignerdranch.com/documents/objective-c-prereading-assignment.pdf'
//     },
//   ];

//   final _images = [
//     {
//       'name': 'Arches National Park',
//       'link':
//       'https://upload.wikimedia.org/wikipedia/commons/6/60/The_Organ_at_Arches_National_Park_Utah_Corrected.jpg'
//     },
//     {
//       'name': 'Canyonlands National Park',
//       'link':
//       'https://upload.wikimedia.org/wikipedia/commons/7/78/Canyonlands_National_Park%E2%80%A6Needles_area_%286294480744%29.jpg'
//     },
//     {
//       'name': 'Death Valley National Park',
//       'link':
//       'https://upload.wikimedia.org/wikipedia/commons/b/b2/Sand_Dunes_in_Death_Valley_National_Park.jpg'
//     },
//     {
//       'name': 'Gates of the Arctic National Park and Preserve',
//       'link':
//       'https://upload.wikimedia.org/wikipedia/commons/e/e4/GatesofArctic.jpg'
//     }
//   ];

//   final _videos = [
//     {
//       'name': 'Big Buck Bunny',
//       'link':
//       'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
//     },
//     {
//       'name': 'Elephant Dream',
//       'link':
//       'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4'
//     }
//   ];

//   List<_TaskInfo>? _tasks;
//   late List<_ItemHolder> _items;
//   late bool _isLoading;
//   late bool _permissionReady;
//   late String _localPath;
//   ReceivePort _port = ReceivePort();

//   @override
//   void initState() {
//     super.initState();

//     _bindBackgroundIsolate();

//     FlutterDownloader.registerCallback(downloadCallback);

//     _isLoading = true;
//     _permissionReady = false;

//     _prepare();
//   }

//   @override
//   void dispose() {
//     _unbindBackgroundIsolate();
//     super.dispose();
//   }

//   void _bindBackgroundIsolate() {
//     bool isSuccess = IsolateNameServer.registerPortWithName(
//         _port.sendPort, 'downloader_send_port');
//     if (!isSuccess) {
//       _unbindBackgroundIsolate();
//       _bindBackgroundIsolate();
//       return;
//     }
//     _port.listen((dynamic data) {
//       if (true) {
//         print('UI Isolate Callback: $data');
//       }
//       String? id = data[0];
//       DownloadTaskStatus? status = data[1];
//       int? progress = data[2];

//       if (_tasks != null && _tasks!.isNotEmpty) {
//         final task = _tasks!.firstWhere((task) => task.taskId == id);
//         setState(() {
//           task.status = status;
//           task.progress = progress;
//         });
//       }
//     });
//   }

//   void _unbindBackgroundIsolate() {
//     IsolateNameServer.removePortNameMapping('downloader_send_port');
//   }

//   static void downloadCallback(
//       String id, DownloadTaskStatus status, int progress) {
//     if (true) {
//       print(
//           'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
//     }
//     final SendPort send =
//     IsolateNameServer.lookupPortByName('downloader_send_port')!;
//     send.send([id, status, progress]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text("hello"),
//       ),
//       body: Builder(
//           builder: (context) => _isLoading
//               ? new Center(
//             child: new CircularProgressIndicator(),
//           )
//               : _permissionReady
//               ? _buildDownloadList()
//               : _buildNoPermissionWarning()),
//     );
//   }

//   Widget _buildDownloadList() => Container(
//     child: ListView(
//       padding: const EdgeInsets.symmetric(vertical: 16.0),
//       children: _items
//           .map((item) => item.task == null
//           ? _buildListSection(item.name!)
//           : DownloadItem(
//         data: item,
//         onItemClick: (task) {
//           _openDownloadedFile(task).then((success) {
//             if (!success) {
//               Scaffold.of(context).showSnackBar(SnackBar(
//                   content: Text('Cannot open this file')));
//             }
//           });
//         },
//         onActionClick: (task) {
//           if (task.status == DownloadTaskStatus.undefined) {
//             _requestDownload(task);
//           } else if (task.status == DownloadTaskStatus.running) {
//             _pauseDownload(task);
//           } else if (task.status == DownloadTaskStatus.paused) {
//             _resumeDownload(task);
//           } else if (task.status == DownloadTaskStatus.complete) {
//             _delete(task);
//           } else if (task.status == DownloadTaskStatus.failed) {
//             _retryDownload(task);
//           }
//         },
//       ))
//           .toList(),
//     ),
//   );

//   Widget _buildListSection(String title) => Container(
//     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//     child: Text(
//       title,
//       style: TextStyle(
//           fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 18.0),
//     ),
//   );

//   Widget _buildNoPermissionWarning() => Container(
//     child: Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: Text(
//               'Please grant accessing storage permission to continue -_-',
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.blueGrey, fontSize: 18.0),
//             ),
//           ),
//           SizedBox(
//             height: 32.0,
//           ),
//           FlatButton(
//               onPressed: () {
//                 _retryRequestPermission();
//               },
//               child: Text(
//                 'Retry',
//                 style: TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20.0),
//               ))
//         ],
//       ),
//     ),
//   );

//   Future<void> _retryRequestPermission() async {
//     final hasGranted = await _checkPermission();

//     if (hasGranted) {
//       await _prepareSaveDir();
//     }

//     setState(() {
//       _permissionReady = hasGranted;
//     });
//   }

//   void _requestDownload(_TaskInfo task) async {
//     task.taskId = await FlutterDownloader.enqueue(
//       url: task.link!,
//       headers: {"auth": "test_for_sql_encoding"},
//       savedDir: _localPath,
//       showNotification: true,
//       openFileFromNotification: true,
//       saveInPublicStorage: true,
//     );
//   }

//   void _cancelDownload(_TaskInfo task) async {
//     await FlutterDownloader.cancel(taskId: task.taskId!);
//   }

//   void _pauseDownload(_TaskInfo task) async {
//     await FlutterDownloader.pause(taskId: task.taskId!);
//   }

//   void _resumeDownload(_TaskInfo task) async {
//     String? newTaskId = await FlutterDownloader.resume(taskId: task.taskId!);
//     task.taskId = newTaskId;
//   }

//   void _retryDownload(_TaskInfo task) async {
//     String? newTaskId = await FlutterDownloader.retry(taskId: task.taskId!);
//     task.taskId = newTaskId;
//   }

//   Future<bool> _openDownloadedFile(_TaskInfo? task) {
//     if (task != null) {
//       return FlutterDownloader.open(taskId: task.taskId!);
//     } else {
//       return Future.value(false);
//     }
//   }

//   void _delete(_TaskInfo task) async {
//     await FlutterDownloader.remove(
//         taskId: task.taskId!, shouldDeleteContent: true);
//     await _prepare();
//     setState(() {});
//   }

//   Future<bool> _checkPermission() async {
//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//     if (widget.platform == TargetPlatform.android && androidInfo.version.sdkInt! <= 28) {
//       final status = await Permission.storage.status;
//       if (status != PermissionStatus.granted) {
//         final result = await Permission.storage.request();
//         if (result == PermissionStatus.granted) {
//           return true;
//         }
//       } else {
//         return true;
//       }
//     } else {
//       return true;
//     }
//     return false;
//   }

//   Future<Null> _prepare() async {
//     final tasks = await FlutterDownloader.loadTasks();

//     int count = 0;
//     _tasks = [];
//     _items = [];

//     _tasks!.addAll(_documents.map((document) =>
//         _TaskInfo(name: document['name'], link: document['link'])));

//     _items.add(_ItemHolder(name: 'Documents'));
//     for (int i = count; i < _tasks!.length; i++) {
//       _items.add(_ItemHolder(name: _tasks![i].name, task: _tasks![i]));
//       count++;
//     }

//     _tasks!.addAll(_images
//         .map((image) => _TaskInfo(name: image['name'], link: image['link'])));

//     _items.add(_ItemHolder(name: 'Images'));
//     for (int i = count; i < _tasks!.length; i++) {
//       _items.add(_ItemHolder(name: _tasks![i].name, task: _tasks![i]));
//       count++;
//     }

//     _tasks!.addAll(_videos
//         .map((video) => _TaskInfo(name: video['name'], link: video['link'])));

//     _items.add(_ItemHolder(name: 'Videos'));
//     for (int i = count; i < _tasks!.length; i++) {
//       _items.add(_ItemHolder(name: _tasks![i].name, task: _tasks![i]));
//       count++;
//     }

//     tasks!.forEach((task) {
//       for (_TaskInfo info in _tasks!) {
//         if (info.link == task.url) {
//           info.taskId = task.taskId;
//           info.status = task.status;
//           info.progress = task.progress;
//         }
//       }
//     });

//     _permissionReady = await _checkPermission();

//     if (_permissionReady) {
//       await _prepareSaveDir();
//     }

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   Future<void> _prepareSaveDir() async {
//     _localPath ='storage/emulated/0/Download'; //(await _findLocalPath())!;
//     final savedDir = Directory(_localPath);
//     bool hasExisted = await savedDir.exists();
//     if (!hasExisted) {
//       savedDir.create();
//     }
//   }

//   // Future<String?> _findLocalPath() async {
//   //   var externalStorageDirPath;
//   //   if (Platform.isAndroid) {
//   //     try {
//   //       externalStorageDirPath = await AndroidPathProvider.downloadsPath;
//   //     } catch (e) {
//   //       final directory = await getExternalStorageDirectory();
//   //       externalStorageDirPath = directory?.path;
//   //     }
//   //   } else if (Platform.isIOS) {
//   //     externalStorageDirPath =
//   //         (await getApplicationDocumentsDirectory()).absolute.path;
//   //   }
//   //   return externalStorageDirPath;
//   // }
// }

// class DownloadItem extends StatelessWidget {
//   final _ItemHolder? data;
//   final Function(_TaskInfo?)? onItemClick;
//   final Function(_TaskInfo)? onActionClick;

//   DownloadItem({this.data, this.onItemClick, this.onActionClick});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 16.0, right: 8.0),
//       child: InkWell(
//         onTap: data!.task!.status == DownloadTaskStatus.complete
//             ? () {
//           onItemClick!(data!.task);
//         }
//             : null,
//         child: Stack(
//           children: <Widget>[
//             Container(
//               width: double.infinity,
//               height: 64.0,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     child: Text(
//                       data!.name!,
//                       maxLines: 1,
//                       softWrap: true,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0),
//                     child: _buildActionForTask(data!.task!),
//                   ),
//                 ],
//               ),
//             ),
//             data!.task!.status == DownloadTaskStatus.running ||
//                 data!.task!.status == DownloadTaskStatus.paused
//                 ? Positioned(
//               left: 0.0,
//               right: 0.0,
//               bottom: 0.0,
//               child: LinearProgressIndicator(
//                 value: data!.task!.progress! / 100,
//               ),
//             )
//                 : Container()
//           ].toList(),
//         ),
//       ),
//     );
//   }

//   Widget? _buildActionForTask(_TaskInfo task) {
//     if (task.status == DownloadTaskStatus.undefined) {
//       return RawMaterialButton(
//         onPressed: () {
//           onActionClick!(task);
//         },
//         child: Icon(Icons.file_download),
//         shape: CircleBorder(),
//         constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
//       );
//     } else if (task.status == DownloadTaskStatus.running) {
//       return RawMaterialButton(
//         onPressed: () {
//           onActionClick!(task);
//         },
//         child: Icon(
//           Icons.pause,
//           color: Colors.red,
//         ),
//         shape: CircleBorder(),
//         constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
//       );
//     } else if (task.status == DownloadTaskStatus.paused) {
//       return RawMaterialButton(
//         onPressed: () {
//           onActionClick!(task);
//         },
//         child: Icon(
//           Icons.play_arrow,
//           color: Colors.green,
//         ),
//         shape: CircleBorder(),
//         constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
//       );
//     } else if (task.status == DownloadTaskStatus.complete) {
//       return Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Text(
//             'Ready',
//             style: TextStyle(color: Colors.green),
//           ),
//           RawMaterialButton(
//             onPressed: () {
//               onActionClick!(task);
//             },
//             child: Icon(
//               Icons.delete_forever,
//               color: Colors.red,
//             ),
//             shape: CircleBorder(),
//             constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
//           )
//         ],
//       );
//     } else if (task.status == DownloadTaskStatus.canceled) {
//       return Text('Canceled', style: TextStyle(color: Colors.red));
//     } else if (task.status == DownloadTaskStatus.failed) {
//       return Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Text('Failed', style: TextStyle(color: Colors.red)),
//           RawMaterialButton(
//             onPressed: () {
//               onActionClick!(task);
//             },
//             child: Icon(
//               Icons.refresh,
//               color: Colors.green,
//             ),
//             shape: CircleBorder(),
//             constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
//           )
//         ],
//       );
//     } else if (task.status == DownloadTaskStatus.enqueued) {
//       return Text('Pending', style: TextStyle(color: Colors.orange));
//     } else {
//       return null;
//     }
//   }
// }

// class _TaskInfo {
//   final String? name;
//   final String? link;

//   String? taskId;
//   int? progress = 0;
//   DownloadTaskStatus? status = DownloadTaskStatus.undefined;

//   _TaskInfo({this.name, this.link});
// }

// class _ItemHolder {
//   final String? name;
//   final _TaskInfo? task;

//   _ItemHolder({this.name, this.task});
// }
