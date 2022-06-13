
import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({Key? key}) : super(key: key);

  @override
  _FollowersScreenState createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  // List<Map<String, dynamic>> followerslist = [
  //   {
  //     "image": "assets/images/001.jpeg",
  //     "name": "Bella David",
  //     "field": "Master in Bussiness & Marketing",
  //     "btitle":"Remove",
  //   },
  //   {
  //     "image": "assets/images/dummy_profile.jpg",
  //     "name": "Andrew Mathew",
  //     "field": "Master in English & Science",
  //      "btitle":"Remove",
  //   },
  //   {
  //     "image": "assets/images/003.jpeg",
  //     "name": "Emma Martin",
  //     "field": "Master in Ecnomics & Marketing",
  //      "btitle":"Remove",
  //   },
  //   {
  //     "image": "assets/images/005.jpeg",
  //     "name": "Jennifer Paul",
  //     "field": "Master in Bussiness & Science",
  //      "btitle":"Remove",
  //   },
  //   {
  //     "image": "assets/images/4.jpg",
  //     "name": "Mary Jones",
  //     "field": "Master in Bussiness & Marketing",
  //      "btitle":"Remove",
  //   },
  //   {
  //     "image": "assets/images/001.jpeg",
  //     "name": "Bella David",
  //     "field": "Master in Bussiness & Marketing",
  //      "btitle":"Remove",
  //   },
  //   {
  //     "image": "assets/images/dummy_profile.jpg",
  //     "name": "Andrew Mathew",
  //     "field": "Master in English & Science",
  //      "btitle":"Remove",
  //   },
  //   {
  //     "image": "assets/images/003.jpeg",
  //     "name": "Emma Martin",
  //     "field": "Master in Ecnomics & Marketing",
  //      "btitle":"Remove",
  //   },
  //   {
  //     "image": "assets/images/005.jpeg",
  //     "name": "Jennifer Paul",
  //     "field": "Master in Bussiness & Science",
  //      "btitle":"Remove",
  //   },
  //   {
  //     "image": "assets/images/4.jpg",
  //     "name": "Mary Jones",
  //     "field": "Master in Bussiness & Marketing",
  //      "btitle":"Remove",
  //   }
  // ];
  bool noData=false;
  getData(){
    Provider.of<AuthProvider>(context,listen: false).followersData=null;
    Provider.of<AuthProvider>(context,listen: false).callGetFollowers(Provider.of<AuthProvider>(context,listen: false).user!.id.toString()).then((value){
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
    return Consumer<AuthProvider>(
        builder: (context,i,_){
          return noData?Center(child: Text("No Followers at the moment"),):
            i.followersData!=null? Column(
            children: [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(15),
                    itemCount: i.followersData!.followers.length,
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

                                      image: NetworkImage("${i.followersData!.followers[idx].profileImg}",),
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
                                            "${i.followersData!.followers[idx].name}",

                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          // Text(
                                          //   "Follow",
                                          //   style: TextStyle(
                                          //     fontSize: 12.sp,
                                          //     fontWeight: FontWeight.bold,
                                          //     color: Color.fromRGBO(65, 150, 255, 1),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      Text(
                                        "${i.followersData!.followers[idx].type}",
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

                                          Provider.of<AuthProvider>(context,listen: false).callRemoveFollow(i.followersData!.followers[idx].id.toString()).then((value){
                                            getData();
                                          });
   Provider.of<AuthProvider>(context,listen: false).callFollowUnFollow(i.followersData!.followers[idx].id.toString()).then((value){
                                              getData();
                                            });

                                        },
                                        child:
                                        Text(
                                          "Unfollow",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(169, 176, 186, 1),
                                          ),
                                        ),
                                      )),

                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ):LoadingWidget();

        }
        );
  }
}
