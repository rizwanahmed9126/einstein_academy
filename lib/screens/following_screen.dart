import 'package:einstien_academy_flutter/models/following_model.dart';
import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/followers_list.dart';
import 'package:einstien_academy_flutter/widgets/following_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FollowingScreen extends StatefulWidget {

  const FollowingScreen({Key? key,}) : super(key: key);

  @override
  _FollowingScreenState createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  // List member = [
  //   {
  //     "image": "assets/images/001.jpeg",
  //     "name": "Bella David",
  //     "field": "Master in Bussiness & Marketing",
  //   },
  //   {
  //     "image": "assets/images/dummy_profile.jpg",
  //     "name": "Andrew Mathew",
  //     "field": "Master in English & Science",
  //   },
  //   {
  //     "image": "assets/images/003.jpeg",
  //     "name": "Emma Martin",
  //     "field": "Master in Ecnomics & Marketing",
  //   },
  //   {
  //     "image": "assets/images/005.jpeg",
  //     "name": "Jennifer Paul",
  //     "field": "Master in Bussiness & Science",
  //   },
  //   {
  //     "image": "assets/images/4.jpg",
  //     "name": "Mary Jones",
  //     "field": "Master in Bussiness & Marketing",
  //   }
  // ];
  var navigationService = locator<NavigationService>();

  bool noData=false;
  getData(){
    Provider.of<AuthProvider>(context,listen: false).followingsData=null;
    Provider.of<AuthProvider>(context,listen: false).callGetFollowings(Provider.of<AuthProvider>(context,listen: false).user!.id.toString()).then((value){
      if(value=="noData"){
        setState(() {
          noData=true;
        });
      }
    });

  }

  @override
  void initState() {
    getData();
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
      body: Consumer<AuthProvider>(
        builder: (context,i,_){
          return noData?Center(child: Text("No Following at the moment"),):
            i.followingsData!=null? SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(15),
                      itemCount: i.followingsData!.followings.length,
                      itemBuilder: (ctx, idx) {
                        return Card(
                          margin: EdgeInsets.only(top: 4),
                          child: Container(
                            padding:
                            EdgeInsets.only(bottom: 10.r, left: 10.r, right: 10.r, top: 10.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: FadeInImage(

                                        image: NetworkImage("${i..followingsData!.followings[idx].profileImg}",),
                                        placeholder: AssetImage("assets/images/placeHolder.png"),
                                        imageErrorBuilder: (context,i,error)=>Image.asset("assets/images/placeHolder.png",height: 53,width: 53,fit: BoxFit.cover,),
                                        height: 28,
                                        width: 28,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "${i.followingsData!.followings[idx].name}",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              "Follow",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(65, 150, 255, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "${i.followingsData!.followings[idx].type}",
                                          // "Masters in Busniess & Marketing",
                                          style: TextStyle(
                                              height: 1.5.h,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade600),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1, color: Colors.grey.shade400),
                                          borderRadius: BorderRadius.circular(5.r),
                                        ),
                                        child: TextButton(
                                          onPressed: (){
                                            Provider.of<AuthProvider>(context,listen: false).callFollowCount();
                                    

                                            Provider.of<AuthProvider>(context,listen: false).callRemoveFollow(i.followingsData!.followings[idx].id.toString()).then((value){
                                              getData();
                                            });

        // Provider.of<AuthProvider>(context,listen: false).callFollowUnFollow(i.followingsData!.followings[idx].id.toString()).then((value){
        //                                       getData();
        //                                     });
                                          },
                                          child:
                                          Text(
                                            "Remove",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromRGBO(169, 176, 186, 1),
                                            ),
                                          ),
                                        )
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),


                // Expanded(
                //   child: ListView.separated(
                //     physics: NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     separatorBuilder: (BuildContext context, int index) {
                //       return Divider();
                //     },
                //     itemCount: i.followingsData!.followings.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return FollowingListWidget(
                //         data: i.followingsData!.followings[index],
                //       );
                //     },
                //   ),
                // )





              ],
            ),
          ):LoadingWidget();
        },
      ),
    );
  }
}


// Container(
//   padding: EdgeInsets.all(10.h),
//   decoration: BoxDecoration(
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.1),
//         spreadRadius: 3,
//         blurRadius: 3,
//         offset: Offset(0, 0), // changes position of shadow
//       ),
//     ],
//     borderRadius: BorderRadius.circular(5.r),
//     color: Colors.white,
//   ),
//   child: ListView.separated(
//     physics: NeverScrollableScrollPhysics(),
//     shrinkWrap: true,
//     separatorBuilder: (BuildContext context, int index) {
//       return Divider();
//     },
//     itemCount: i.followingsData!.followings.length,
//     itemBuilder: (BuildContext context, int index) {
//       return FollowingListWidget(
//         data: i.followingsData!.followings[index],
//       );
//     },
//   ),
// )


// Container(
//   height: 200.h,
//   child: ListView.separated(
//     scrollDirection: Axis.horizontal,
//     shrinkWrap: true,
//     separatorBuilder: (BuildContext context, int index) {
//       return SizedBox(
//         width: 15.w,
//       );
//     },
//     itemCount: member.length,
//     itemBuilder: (BuildContext context, int i) {
//       return NotificationWidget(
//         data: member[i],
//       );
//     },
//   ),
// ),