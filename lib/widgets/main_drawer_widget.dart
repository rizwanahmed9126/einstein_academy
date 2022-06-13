import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/providers/subject_provider.dart';
import 'package:einstien_academy_flutter/providers/teacher_provider.dart';
import 'package:einstien_academy_flutter/screens/privacy_policy_screen.dart';
import 'package:einstien_academy_flutter/screens/profile_detail.dart';
import 'package:einstien_academy_flutter/screens/setting_screen.dart';
import 'package:einstien_academy_flutter/screens/terms_condition.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/storage_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/drawer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherDrawerWidget extends StatefulWidget {
  @override
  _TeacherDrawerWidgetState createState() => _TeacherDrawerWidgetState();
}

class _TeacherDrawerWidgetState extends State<TeacherDrawerWidget> {
  List drawerlist2 = [
    {
      "id": "1",
      "title": "Settings",
    },
    {
      "id": "2",
      "title": "Logout",
    },
  ];
  List drawerlist3 = [
    {
      "id": "1",
      "title": "Privacy Policy",
    },
    {
      "id": "2",
      "title": "Terms And Conditions",
    },
  ];

  List drawerlist = [
    {"id": "1", "title": "Study Material", "image": "assets/images/Menu01.png"},
    // {"id": "2", "title": "Study Notes", "image": "assets/images/Menu02.png"},
    // {"id": "3", "title": "Past Papers", "image": "assets/images/Menu03.png"},
    {
      "id": "4",
      "title": "Discussion Board",
      "image": "assets/images/Menu04.png"
    },
    {"id": "5", "title": "Event/Session", "image": "assets/images/Menu05.png"},
  ];
  var navigationService = locator<NavigationService>();
  String tagId = ' ';
  void active(
    dynamic val,
  ) {
    setState(() {
      tagId = val;
    });
  }

  StorageService storageService = locator<StorageService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.only(left: 30.w),
          child: ListTileTheme(
            textColor: Colors.white,
            // iconColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 40.h),
                InkWell(
                  onTap: () {
                    String id=Provider.of<AuthProvider>(context,listen: false).user!.id.toString();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileDetailScreen(id: id,)));
                  },
                  child: Consumer<AuthProvider>(
                    builder: (context,i,_){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),

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
                          // CircleAvatar(
                          //   radius: 26.r,
                          //   backgroundImage: AssetImage("assets/images/001.jpeg"),
                          // ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${i.user!.name}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 8.h),
                              Text("View Profile",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ],
                      );
                    },
                  )
                ),
                SizedBox(height: 16.h),
                Divider(color: Colors.white),
                Column(
                  children: [
                    ListView.builder(
                        padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: drawerlist.length,
                        itemBuilder: (ctx, i) {
                          return DrawerList(
                            data: drawerlist[i],
                            tag: drawerlist[i]['id'],
                            action: active,
                            active: tagId == drawerlist[i]['id'] ? true : false,
                          );
                        }
                        ),
                    Divider(color: Colors.white),
                    Container(
                        padding: EdgeInsets.only(left: 10.w),
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: drawerlist2.length,
                          itemBuilder: (BuildContext context, int j) {
                            return Padding(
                              padding: EdgeInsets.fromLTRB(5.w, 14.h, 0, 14.h),
                              child: GestureDetector(
                                onTap: () async{
                                  //await this.storageService.getData("user")
                                  if(j==0){
                                    Provider.of<SubjectProvider>(context,listen: false).getData();
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
                                   // navigationService.navigateTo(SettingScreenRoute) ;
                                  }
                                  else if(j==1){
                                    var storage = await SharedPreferences.getInstance();
                                    navigationService.navigateTo(SelectAccountScreenRoute);
                                    await storage.remove("user");
                                    await storage.remove("AccountType");

                                    Provider.of<AuthProvider>(context,listen: false).callLogout(context);
                                    await storage.remove("user");
                                    await storage.remove("AccountType");
                                    await storage.remove("MaterialSwitch");
                                    await storage.remove("followingSwitch");
                                    await storage.remove("ratingSwitch");
                                    Provider.of<TeacherProvider>(context,listen: false).selectedType=null;
                                    Provider.of<TeacherProvider>(context,listen: false).selectedGrade=null;
                                    Provider.of<TeacherProvider>(context,listen: false).selectedSubject=null;

                                  }

                                  // j == 0 ? navigationService.navigateTo(SettingScreenRoute)
                                  //     : j == 1
                                  //         ? navigationService.navigateTo(SelectAccountScreenRoute)
                                  //         : Container();
                                },
                                child: Text(
                                  drawerlist2[j]['title'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            );
                          },
                        )),
                    Divider(
                      color: Colors.white,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10.w),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                          shrinkWrap: true,
                          itemCount: drawerlist3.length,
                          itemBuilder: (BuildContext context, int k) {
                            return Padding(
                              padding: EdgeInsets.fromLTRB(5.w, 8.w, 0, 8.w),
                              child: GestureDetector(
                                onTap: () {
                                  k == 0
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PrivacyPolicyScreen(

                                                  )))
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TermsConditionScreen(

                                                  )));
                                },
                                child: Text(
                                  drawerlist3[k]['title'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            );
                          },
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
