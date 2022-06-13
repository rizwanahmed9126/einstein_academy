import 'package:einstien_academy_flutter/models/user.dart';
import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/screens/profile_detail.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/exit_dailog_widget.dart';
import 'package:einstien_academy_flutter/widgets/hawk_fab_menu_widget.dart';
import 'package:einstien_academy_flutter/widgets/main_drawer_widget.dart';
import 'package:einstien_academy_flutter/widgets/student_drawer_widget.dart';
import 'package:einstien_academy_flutter/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeScreenStudent extends StatefulWidget {
  const HomeScreenStudent({Key? key}) : super(key: key);

  @override
  _HomeScreenStudentState createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  var navigationService = locator<NavigationService>();
  //late User user;
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
      "image": "assets/images/Menu02.png",
      "Text": "Student Notes",
      "id": "2",
    },
    {
      "image": "assets/images/Menu03.png",
      "Text": "Past Papers",
      "id": "3",
    },
    {
      "image": "assets/images/Menu04.png",
      "Text": "Discussion Board",
      "id": "4",
    },
    {
      "image": "assets/images/Menu05.png",
      "Text": "Event/Session",
      "id": "5",
    },
  ];
  _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => ExitAlertDialog(),
    );
  }



  // downloadFile(String url) async {
  //
  //
  //   await ALDownloader.download("https://www.einsteins-academy.com/einsteinacademy/public/media/study_notes/sImOcgYTTB4JspQTo4TT.pptx",
  //       downloaderHandlerInterface:
  //       ALDownloaderHandlerInterface(progressHandler: (progress) {
  //         debugPrint(
  //             "ALDownloader | downloading, the url = https://www.einsteins-academy.com/einsteinacademy/public/media/study_notes/sImOcgYTTB4JspQTo4TT.pptx, progress = $progress");
  //       }, successHandler: () {
  //         debugPrint("ALDownloader | download successfully, the url = https://www.einsteins-academy.com/einsteinacademy/public/media/study_notes/sImOcgYTTB4JspQTo4TT.pptx");
  //       }, failureHandler: () {
  //         debugPrint("ALDownloader | download failed, the url = https://www.einsteins-academy.com/einsteinacademy/public/media/study_notes/sImOcgYTTB4JspQTo4TT.pptx");
  //       }, pausedHandler: () {
  //         debugPrint("ALDownloader | download paused, the url = https://www.einsteins-academy.com/einsteinacademy/public/media/study_notes/sImOcgYTTB4JspQTo4TT.pptx");
  //       }));
  // }

  // @override
  // void initState() {
  //  // user = context.read<AuthProvider>().user!;
  //   super.initState();
  // }

  @override
  void initState() {
    Provider.of<AuthProvider>(context,listen: false).callFollowCount();
    super.initState();
  }

  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(),
      child: AdvancedDrawer(
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
        drawer: StudentDrawerWidget(),
        child: Scaffold(
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
                  onPressed: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoPlayerWidget(url: "",)));
                  //  _launchURL();

                    //downloadFile("");

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
                      padding: EdgeInsets.only(
                        top: 5.h,
                        left: 15.w,
                        right: 15.w,
                        bottom: 40.h,
                      ),
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


                                SizedBox(width: 15.w,),
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
                        },
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
                    label: 'Add Student Notes',
                    ontap: () {
                      navigationService.navigateTo(AddStudyNotesScreenRoute);
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
                              index == 0 ? navigationService.navigateTo(StudyMaterialScreenRoute)
                                  : index == 1 ? navigationService.navigateTo(StudyNotesScreenRoute)
                                      : index == 2 ? navigationService.navigateTo(PastPaperScreenRoute)
                                          : index == 3 ? navigationService.navigateTo(DiscussionBoardScreenRoute)
                                              : index == 4 ? navigationService.navigateTo(EventAndSessionScreenRoute)
                                                  : Container();
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
