import 'package:einstien_academy_flutter/models/student_notes_model.dart';
import 'package:einstien_academy_flutter/models/teacher_material_model.dart';
import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/screens/profile_detail.dart';
import 'package:einstien_academy_flutter/screens/student/study_notes_details.dart';
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
class StudyNotesWidget extends StatefulWidget {
  StudentNotesModel data;
  final VoidCallback onTap;
  dynamic rating;

  StudyNotesWidget(
      {required this.data,required this.onTap,required this.rating});


  @override
  _StudyNotesWidgetState createState() => _StudyNotesWidgetState();
}

class _StudyNotesWidgetState extends State<StudyNotesWidget> {
  var navigationService = locator<NavigationService>();

  final utilService = locator<UtilService>();


  bool active = false;
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;

    return
      Container(
      height: height*0.23,
      width: width,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyNotesDetailsScreen(id: widget.data.studynotes.id.toString(),)));

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
                            color:widget.data.studynotes. type=="pdf" || widget.data.studynotes.type=="pptx"? Color.fromRGBO(239, 83, 80, 1)
                                :widget.data.studynotes.type=="docx"? Colors.blue
                                : Color.fromRGBO(225, 127, 0, 1)  ,
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          //padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 24.h, bottom: 24.h,),
                          child: Center(
                              child:Text(
                                widget.data.studynotes.type,
                                // widget.data["type"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
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
                        // color: Colors.yellow,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            InkWell(
                              onTap: () {
                                //navigationService.navigateTo(StudyNotesDetailsScreenRoute);
                              },
                              child: Text(
                                "${widget.data.studynotes.title}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                //widget.data["title"],
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

                                    image: NetworkImage("${widget.data.user.profileImg}",),
                                    placeholder: AssetImage("assets/images/placeHolder.png"),
                                    imageErrorBuilder: (context,i,error)=>Image.asset("assets/images/placeHolder.png",height: 28.h,width: 26.h,fit: BoxFit.cover,),
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

                                      child: Text(
                                       "${ widget.data.user.name}",
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
                                      widget.data.user.type,
                                      //widget.data["field"],
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
                                // SizedBox(
                                //   width:  30.w,
                                // ),


                              ],
                            ),
                            // SizedBox(
                            //   height: 25.h,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   width: width/4.5,
                    //   //color: Colors.red,
                    //
                    //   child: Container()
                    //
                    // ),



                  ],
                ),
              ),
            ),

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
                  child: Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                            onTap: widget.data.studynotes.userId==Provider.of<AuthProvider>(context,listen:false).user!.id?(){
                              utilService.showToast("You can't rate yourself");
                            }:
                                () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) => RateFilter(id: widget.data.studynotes.id.toString(),name: widget.data.user.name.toString(),type: "Study Notes",apiType: "study-notes",)
                              );
                            },
                            child: Container(
                              //width: width/2.5,
                              height: 40.h,

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8)
                                )
                              ),
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyNotesDetailsScreen(id: widget.data.studynotes.id.toString(),)));

                            },
                            child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(8)
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    widget.data.studynotes.type=="mp3"? Icons.volume_up_outlined
                                        :widget.data.studynotes.type=="mp4"?Icons.slideshow
                                        :Icons.markunread_rounded,
                                    size: 22.sp,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    widget.data.studynotes.type=="mp3"? "listen"
                                        :widget.data.studynotes.type=="mp4"?"Watch"
                                        :"view",
                                    style: TextStyle(
                                        fontSize: 12.sp, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      )

                    ],
                  ),
                )

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         showDialog(
                //             context: context,
                //             builder: (BuildContext context) => RateFilter(id: widget.data.studynotes.id.toString(),name: widget.data.user.name.toString(),type: "Study Notes",apiType: "study-notes",));
                //       },
                //       child: Container(
                //         width: width/2.5,
                //         //color: Colors.red,
                //         child: Row(
                //
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Icon(
                //               Icons.star,
                //               color: Colors.grey.shade400,
                //               size: 22,
                //             ),
                //             SizedBox(
                //               width: 5.w,
                //             ),
                //             Text(
                //               "Rate",
                //               style: TextStyle(
                //                   fontSize: 12.sp, fontWeight: FontWeight.bold),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: 35.h,
                //       child: VerticalDivider(),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyNotesDetailsScreen(id: widget.data.studynotes.id.toString(),)));
                //         //navigationService.navigateTo(StudyMaterialDetailsScreenRoute);
                //         //_settingModalBottomSheet(context);
                //       },
                //       child: Container(
                //         width: width/2.5,
                //         //color: Colors.blue,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Icon(
                //               widget.data.studynotes.type=="mp3"? Icons.volume_up_outlined
                //                   :widget.data.studynotes.type=="mp4"?Icons.slideshow
                //                   :Icons.markunread_rounded,
                //               size: 22.sp,
                //               color: Colors.grey,
                //             ),
                //             SizedBox(
                //               width: 5.w,
                //             ),
                //             Text(
                //               widget.data.studynotes.type=="mp3"? "listen"
                //                   :widget.data.studynotes.type=="mp4"?"Watch"
                //                   :"view",
                //               style: TextStyle(
                //                   fontSize: 12.sp, fontWeight: FontWeight.bold),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //
                //   ],
                // )

              ],
            )





          ],
        ),
      ),
    );
  }

}
