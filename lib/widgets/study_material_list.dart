import 'package:einstien_academy_flutter/models/teacher_material_model.dart';
import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/providers/teacher_provider.dart';
import 'package:einstien_academy_flutter/screens/profile_detail.dart';
import 'package:einstien_academy_flutter/screens/teacher/study_materials_details_screen.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/util_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/audio_player_bottom_modal_sheet.dart';
import 'package:einstien_academy_flutter/widgets/rate_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class StudyMaterialList extends StatefulWidget {
  TeacherMaterialModel data;
  final VoidCallback onTap;
   bool follow;
   dynamic rating;

  StudyMaterialList({required this.data,required this.follow,required this.onTap,this.rating});


  @override
  _StudyMaterialListState createState() => _StudyMaterialListState();
}

class _StudyMaterialListState extends State<StudyMaterialList> {
  var navigationService = locator<NavigationService>();

  final utilService = locator<UtilService>();

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;

    return Container(
      height: height*0.23,
      width: width,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyMaterialDetailsScreen(id: widget.data.studymaterial.id.toString())));

              },
              child: Container(
                height: height*0.14,
                width: width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Container(
                      width: width/3.5,
                      //color: Colors.grey,

                      child: Center(
                      child:   Container(
                        height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            color:widget.data.studymaterial.type=="pdf" || widget.data.studymaterial.type=="Video"? Color.fromRGBO(239, 83, 80, 1)
                                //:widget.data.studymaterial.type=="doc"? Colors.blue
                                : Color.fromRGBO(225, 127, 0, 1)  ,
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          //padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 24.h, bottom: 24.h,),
                          child: Center(
                              child:Text(
                                widget.data.studymaterial.type,
                                // widget.data["type"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileDetailScreen(id:"${widget.data.user.id}",)));

                      },
                      child: Container(
                        width: width/1.8,
                        //color: Colors.yellow,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            InkWell(
                              onTap: () {
                                //navigationService.navigateTo(StudyNotesDetailsScreenRoute);
                              },
                              child: Text(
                                "${widget.data.studymaterial.title}",
                                //widget.data["title"],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Color.fromRGBO(
                                    68,
                                    79,
                                    84,
                                    1,
                                  ),
                                  fontSize: 12.sp,
                                  height: 1.4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: FadeInImage(

                                    //image: NetworkImage("${widget.data.user.profileImg}",),
                                    image: NetworkImage("http://einsteins-academy.com/einsteinacademy/public/media/user_profile/eCfIoozJAXXlQ2t1cKWv.png",),
                                    placeholder: AssetImage("assets/images/placeHolder.png"),
                                    imageErrorBuilder: (context,i,error)=>Image.asset("assets/images/placeHolder.png",height: 53,width: 53,fit: BoxFit.cover,),
                                    height: 28.h,
                                    width: 26.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width:width/4,
                                     // color: Colors.red,

                                      child: Text(
                                        "${widget.data.user.name}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        //widget.data["name"],
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                            68,
                                            79,
                                            84,
                                            1,
                                          ),
                                          fontSize: 11.sp,
                                          height: 1.4,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${widget.data.user.type}",

                                      style: TextStyle(
                                        color: Color.fromRGBO(
                                          193,
                                          199,
                                          215,
                                          1,
                                        ),
                                        fontSize: 10.sp,
                                        height: 1.4,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),



                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          initialRating:widget.rating=="null" || widget.rating==null?0.0: double.parse(widget.rating.toString()),
                                          minRating: 0,
                                          itemSize: 13,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          ignoreGestures: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        Text("(${widget.rating=="null" || widget.rating==null?0.0:double.parse(widget.rating.toString()).toStringAsFixed(1)})",style: TextStyle(fontSize: 11),)
                                      ],
                                    ),
                                  ],
                                ),



                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   width: width/2.8,
                    //   color: Colors.red,
                    //
                    //
                    //   child: Container()
                    //
                    //   // Center(
                    //   //       child: InkWell(
                    //   //   onTap:widget.data.user.id==Provider.of<AuthProvider>(context,listen: false).user!.id?(){}:  widget.onTap,
                    //   //
                    //   //   child: Container(
                    //   //     height: 20,
                    //   //       width: 60,
                    //   //       margin: EdgeInsets.only(top: 3),
                    //   //       decoration: BoxDecoration(
                    //   //         borderRadius: BorderRadius.circular(3.r),
                    //   //        color:
                    //   //        widget.follow? Color.fromRGBO(30, 144, 241, 1,):Colors.transparent
                    //   //            ,
                    //   //         border: Border.all(
                    //   //           color:widget.data.user.id==Provider.of<AuthProvider>(context,listen: false).user!.id?Colors.grey:  Color.fromRGBO(30, 144, 241, 1,),
                    //   //         ),
                    //   //       ),
                    //   //       child: Padding(
                    //   //         padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 3.h, bottom: 3.h),
                    //   //         child: Row(
                    //   //           children: [
                    //   //             widget.follow?  Icon(
                    //   //               Icons.check,
                    //   //               color: Colors.white,
                    //   //               size: 10.h,
                    //   //             ):Container(),
                    //   //             widget.follow? SizedBox(
                    //   //               width: 5.w,
                    //   //             ):Container(),
                    //   //
                    //   //
                    //   //
                    //   //             Text(
                    //   //               "Follow",
                    //   //               style: TextStyle(
                    //   //                   fontSize: 8.sp,
                    //   //                   color: widget.follow? Colors.white:Color.fromRGBO(30, 144, 241, 1,),
                    //   //                   fontWeight: FontWeight.w600),
                    //   //             ),
                    //   //           ],
                    //   //         ),
                    //   //       ),
                    //   //   ),
                    //   // ),
                    //   //     ),
                    // ),



                  ],
                ),
              ),
            ),


            //Divider(),
            Column(
              children: [
                Container(
                  height: 1,
                  width: width,
                  color: Colors.grey[300],
                ),

                Container(
                  height: 40.h,
                  width: width,
                  //color: Colors.green,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap:widget.data.studymaterial.userId==Provider.of<AuthProvider>(context,listen:false).user!.id?(){
                            utilService.showToast("You can't rate yourself");
                          }:
                              () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => RateFilter(id: widget.data.studymaterial.id.toString(),name: widget.data.user.name.toString(),type: "Study Material",apiType: "study-material",));
                          },
                          child: Container(
                            height: 40.h,

                           // color: Colors.red,
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.grey.shade400,
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "Rate",
                                  style: TextStyle(
                                      fontSize: 12.sp, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40.h,
                        width: 1,
                        color: Colors.grey[300],
                      ),
                      Expanded(
                          child:  GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyMaterialDetailsScreen(id: widget.data.studymaterial.id.toString())));

                            },
                            child: Container(
                              height: 40.h,
                              //color: Colors.blue,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    widget.data.studymaterial.type=="Audio"? Icons.volume_up_outlined
                                        :widget.data.studymaterial.type=="Video"?Icons.slideshow
                                        :Icons.visibility,
                                    size: 22.sp,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    widget.data.studymaterial.type=="Audio"? "listen"
                                        :widget.data.studymaterial.type=="Video"?"Watch"
                                        :"view",
                                    style: TextStyle(
                                        fontSize: 12.sp, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )
                      )


                    ],
                  ),
                )

                // Container(
                //   height: 40,
                //   //color: Colors.green,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       GestureDetector(
                //         onTap:widget.data.studymaterial.userId==Provider.of<AuthProvider>(context,listen:false).user!.id?(){
                //           utilService.showToast("You can't rate yourself");
                //         }:
                //             () {
                //           showDialog(
                //               context: context,
                //               builder: (BuildContext context) => RateFilter(id: widget.data.studymaterial.id.toString(),name: widget.data.user.name.toString(),type: "Study Material",apiType: "study-material",));
                //         },
                //         child: Container(
                //           width: width*0.43,
                //           height: 35.h,
                //           //color: Colors.red,
                //           child: Row(
                //
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Icon(
                //                 Icons.star,
                //                 color: Colors.grey.shade400,
                //                 size: 22,
                //               ),
                //               SizedBox(
                //                 width: 5.w,
                //               ),
                //               Text(
                //                 "Rate",
                //                 style: TextStyle(
                //                     fontSize: 12.sp, fontWeight: FontWeight.bold),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       // Container()
                //       // Container(
                //       //   height: 35.h,
                //       //   child: VerticalDivider(),
                //       // ),
                //       GestureDetector(
                //         onTap: () {
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyMaterialDetailsScreen(id: widget.data.studymaterial.id.toString())));
                //           //navigationService.navigateTo(StudyMaterialDetailsScreenRoute);
                //           //_settingModalBottomSheet(context);
                //         },
                //         child: Container(
                //           width: width*0.43,
                //           height: 35.h,
                //
                //           //color: Colors.blue,
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Icon(
                //                 widget.data.studymaterial.type=="mp3"? Icons.volume_up_outlined
                //                     :widget.data.studymaterial.type=="mp4"?Icons.slideshow
                //                     :Icons.markunread_rounded,
                //                 size: 22.sp,
                //                 color: Colors.grey,
                //               ),
                //               SizedBox(
                //                 width: 5.w,
                //               ),
                //               Text(
                //                 widget.data.studymaterial.type=="mp3"? "listen"
                //                     :widget.data.studymaterial.type=="mp4"?"Watch"
                //                     :"view",
                //                 style: TextStyle(
                //                     fontSize: 12.sp, fontWeight: FontWeight.bold),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //
                //     ],
                //   ),
                // )
              ],
            )

          ],
        ),
      ),
    );
  }

}
