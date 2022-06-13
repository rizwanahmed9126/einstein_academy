import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/screens/manage-screen.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';

import 'package:einstien_academy_flutter/widgets/column_scroll_view.dart';
import 'package:einstien_academy_flutter/widgets/profile_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileDetailScreen extends StatefulWidget {
  final String id;

  const ProfileDetailScreen({
    Key? key,
    required this.id,

  }) : super(key: key);
  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  var navigationService = locator<NavigationService>();
  List pastPaperList = [
    {
      "type": "DOC",
      "title": "Sustainable Marketing Secrets\nand busniess growth",
      "color": Color.fromRGBO(239, 83, 80, 1),
      "num": "+9",
    },
    {
      "type": "PDF",
      "title": "Sustainable Marketing Secrets\nand busniess growth",
      "color": Color.fromRGBO(30, 144, 241, 1),
      "num": "+4",
    },
    {
      "type": "PPT",
      "title": "Sustainable Marketing Secrets\nand busniess growth",
      "color": Color.fromRGBO(225, 127, 0, 1),
      "num": "+2",
    },
    {
      "type": "PDF",
      "title": "Sustainable Marketing Secrets\nand busniess growth",
      "color": Color.fromRGBO(239, 83, 80, 1),
      "num": "+11",
    },
  ];

  @override
  void initState() {
    Provider.of<AuthProvider>(context,listen: false).profileData=null;
    Provider.of<AuthProvider>(context,listen: false).callUserProfile(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                      "Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
               widget.id==Provider.of<AuthProvider>(context,listen: false).user!.id.toString()? IconButton(
                  onPressed: () {
                    navigationService.navigateTo(EditProfileScreenRoute);
                  },
                  icon: Icon(
                    Icons.edit,
                    size: 20.h,
                    color: Colors.white,
                  ),
                ):Container()
              ],
            ),
          ),
          preferredSize: Size.fromHeight(0.h),
        ),
      ),
      backgroundColor: Colors.white,
      body: Consumer<AuthProvider>(
        builder: (context,i,_){
          return  i.profileData!=null? ColumnScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2.2,
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
                            top: MediaQuery.of(context).size.height * 0.01,
                            child: Container(
                              padding: EdgeInsets.all(10.h),
                              child: Card(
                                margin: EdgeInsets.only(
                                  left: 10.w,
                                  right: 10.w,
                                  bottom: 20.h,
                                ),
                                elevation: 8.r,
                                shadowColor: Colors.grey.shade300,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5.r),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 3,
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: FadeInImage(

                                          image: NetworkImage("${i.profileData!.profileImg}"),
                                          placeholder: AssetImage("assets/images/placeHolder.png"),
                                          imageErrorBuilder: (context,i,error)=>Image.asset("assets/images/placeHolder.png",height: 53,width: 53,fit: BoxFit.cover,),
                                          height: 90,
                                          width: 90,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "${i.profileData!.name}",
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        i.profileData!.type=="STUDENT"?  Text(
                                          "${i.profileData!.gradeId} Standard",
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                          ),
                                        ):Container(),

                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ManageScreen(
                                                        title: "Followers",
                                                        index: 1),
                                              ),
                                            );
                                          },
                                          child: Column(
                                            children: [
                                              Text(
                                                "${i.profileData!.userFollowing}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade600,
                                                  fontSize: 20.h,
                                                ),
                                              ),
                                              Text(
                                                "Followers",
                                                style: TextStyle(
                                                  color: Colors.grey.shade600,
                                                  fontSize: 12.h,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        i.profileData!.type=="TEACHER"?Container():   InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ManageScreen(
                                                      title: "Following",
                                                      index: 0,
                                                    ),
                                              ),
                                            );
                                          },
                                          child: Column(
                                            children: [
                                              Text(
                                                "${i.profileData!.userFollow}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade600,
                                                  fontSize: 20.h,
                                                ),
                                              ),
                                              Text(
                                                "Following",
                                                style: TextStyle(
                                                  color: Colors.grey.shade600,
                                                  fontSize: 12.h,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "${i.profileData!.studyNotes!.length}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade600,
                                                fontSize: 20.h,
                                              ),
                                            ),
                                            Text(
                                              "Total Post",
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: 12.h,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 8.r,
                      shadowColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      margin: EdgeInsets.only(left: 20.r, right: 20.r),
                      child: Container(
                        padding: EdgeInsets.all(20.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "BASIC DETAILS",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email",
                                      style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "Phone",
                                      style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "City/Country",
                                      style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    i.profileData!.institueName=="null" || i.profileData!.institueName==null?Container():    Text(
                                      "School",
                                      style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${i.profileData!.email}",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "${i.profileData!.phoneNumber}",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                      height: 15.h,
                                      width: MediaQuery.of(context).size.width*0.45,

                                      child: Text(
                                        "${i.profileData!.country}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    i.profileData!.institueName=="null" || i.profileData!.institueName==null?Container():   Text(
                                      "${i.profileData!.institueName}",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                  child: Text(
                    "SHARED MATERIALS",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                  child: ListView.separated(
                    itemCount:i.profileData!.studyNotes!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 15.h,
                      );
                    },
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return ProfileWidget(
                        data: i.profileData!.studyNotes![index],//pastPaperList[index],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ):LoadingWidget();

        },
      )
    );
  }
}
