import 'package:einstien_academy_flutter/models/past_papers_model.dart';
import 'package:einstien_academy_flutter/screens/student/past_papers_detail_screen.dart';
import 'package:einstien_academy_flutter/widgets/rate_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PastPaperWidget extends StatefulWidget {
  PastPapersModel data;
  PastPaperWidget({Key? key, required this.data}) : super(key: key);

  @override
  _PastPaperWidgetState createState() => _PastPaperWidgetState();
}

class _PastPaperWidgetState extends State<PastPaperWidget> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>PastPapersDetailsScreen(id: widget.data.id.toString(),)));


      },
      child: Container(
        height: height*0.23,
        width: width,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PastPapersDetailsScreen(id: widget.data.id.toString(),)));

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
                              color:
                              // widget.data.studynotes. type=="pdf" || widget.data.studynotes.type=="mp4"? Color.fromRGBO(239, 83, 80, 1)
                              //     :widget.data.studynotes.type=="doc"? Colors.blue
                              //     :
                              Color.fromRGBO(225, 127, 0, 1)  ,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                            //padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 24.h, bottom: 24.h,),
                            child: Center(
                                child:Text(
                                 "PDF",
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

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PastPapersDetailsScreen(id: widget.data.id.toString(),)));

                        },
                        child: Container(
                          width: width/2.8,
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
                                  "${widget.data.title}",
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
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: [
                              //     ClipRRect(
                              //       borderRadius: BorderRadius.circular(50),
                              //       child: FadeInImage(
                              //
                              //         image: NetworkImage("${widget.data.user.profileImg}",),
                              //         placeholder: AssetImage("assets/images/placeHolder.png"),
                              //         imageErrorBuilder: (context,i,error)=>Image.asset("assets/images/placeHolder.png",height: 28.h,width: 26.h,fit: BoxFit.cover,),
                              //         height: 28.h,
                              //         width: 26.h,
                              //         fit: BoxFit.cover,
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: 8.w,
                              //     ),
                              //     Column(
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       children: [
                              //         Container(
                              //           width:width/4,
                              //
                              //           child: Text(
                              //             "${ widget.data.user.name}",
                              //             overflow: TextOverflow.ellipsis,
                              //             maxLines: 1,
                              //             //widget.data["name"],
                              //             style: TextStyle(
                              //               color: Color.fromRGBO(
                              //                 68,
                              //                 79,
                              //                 84,
                              //                 1,
                              //               ),
                              //               fontSize: 11.sp,
                              //               height: 1.4,
                              //               fontWeight: FontWeight.w500,
                              //             ),
                              //           ),
                              //         ),
                              //         Text(
                              //           widget.data.user.type,
                              //           //widget.data["field"],
                              //           style: TextStyle(
                              //             color: Color.fromRGBO(
                              //               193,
                              //               199,
                              //               215,
                              //               1,
                              //             ),
                              //             fontSize: 10.sp,
                              //             height: 1.4,
                              //             fontWeight: FontWeight.w500,
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //     // SizedBox(
                              //     //   width:  30.w,
                              //     // ),
                              //
                              //
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 25.h,
                              // ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          width: width/4.5,
                          //color: Colors.red,

                          child: Container()

                      ),



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

                  // Container(
                  //   height: 40.h,
                  //   width: width,
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: GestureDetector(
                  //           onTap: () {
                  //             // showDialog(
                  //             //     context: context,
                  //             //     builder: (BuildContext context) => RateFilter(id: widget.data.studynotes.id.toString(),name: widget.data.user.name.toString(),type: "Study Notes",apiType: "study-notes",)
                  //             // );
                  //           },
                  //           child: Container(
                  //             //width: width/2.5,
                  //             height: 40.h,
                  //
                  //             decoration: BoxDecoration(
                  //                 color: Colors.white,
                  //                 borderRadius: BorderRadius.only(
                  //                     bottomLeft: Radius.circular(8)
                  //                 )
                  //             ),
                  //             child: Row(
                  //
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Icon(
                  //                   Icons.star,
                  //                   color: Colors.grey.shade400,
                  //                   size: 22,
                  //                 ),
                  //                 SizedBox(
                  //                   width: 5.w,
                  //                 ),
                  //                 Text(
                  //                   "Rate",
                  //                   style: TextStyle(
                  //                       fontSize: 12.sp, fontWeight: FontWeight.bold),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         height: 40.h,
                  //         width: 1,
                  //         color: Colors.grey[300],
                  //       ),
                  //       Expanded(
                  //         child: GestureDetector(
                  //           onTap: () {
                  //             //Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyNotesDetailsScreen(id: widget.data.studynotes.id.toString(),)));
                  //
                  //           },
                  //           child: Container(
                  //             height: 40.h,
                  //             decoration: BoxDecoration(
                  //                 color: Colors.white,
                  //                 borderRadius: BorderRadius.only(
                  //                     bottomRight: Radius.circular(8)
                  //                 )
                  //             ),
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Icon(
                  //                   // widget.data.studynotes.type=="mp3"? Icons.volume_up_outlined
                  //                   //     :widget.data.studynotes.type=="mp4"?Icons.slideshow
                  //                   //     :
                  //                   Icons.markunread_rounded,
                  //                   size: 22.sp,
                  //                   color: Colors.grey,
                  //                 ),
                  //                 SizedBox(
                  //                   width: 5.w,
                  //                 ),
                  //                 Text(
                  //                   // widget.data.studynotes.type=="mp3"? "listen"
                  //                   //     :widget.data.studynotes.type=="mp4"?"Watch"
                  //                   //     :
                  //                   "view",
                  //                   style: TextStyle(
                  //                       fontSize: 12.sp, fontWeight: FontWeight.bold),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //
                  //     ],
                  //   ),
                  // ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) => RateFilter(id: widget.data.studynotes.id.toString(),name: widget.data.user.name.toString(),type: "Study Notes",apiType: "study-notes",));
                          //
                        },
                        child: Container(
                          width: width/2.5,
                          //color: Colors.red,
                          // child: Row(
                          //
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Icon(
                          //       Icons.star,
                          //       color: Colors.grey.shade400,
                          //       size: 22,
                          //     ),
                          //     SizedBox(
                          //       width: 5.w,
                          //     ),
                          //     Text(
                          //       "Rate",
                          //       style: TextStyle(
                          //           fontSize: 12.sp, fontWeight: FontWeight.bold),
                          //     ),
                          //   ],
                          // ),
                        ),
                      ),
                      Container(
                        height: 35.h,
                        child: VerticalDivider(),
                      ),
                      GestureDetector(
                        onTap: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyNotesDetailsScreen(id: widget.data.studynotes.id.toString(),)));
                          //navigationService.navigateTo(StudyMaterialDetailsScreenRoute);
                          //_settingModalBottomSheet(context);
                        },
                        child: Container(
                          width: width/2.5,
                          //color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                // widget.data.studynotes.type=="mp3"? Icons.volume_up_outlined
                                //     :widget.data.studynotes.type=="mp4"?Icons.slideshow
                                //     :
                                Icons.markunread_rounded,
                                size: 22.sp,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                // widget.data.studynotes.type=="mp3"? "listen"
                                //     :widget.data.studynotes.type=="mp4"?"Watch"
                                //     :
                                "view",
                                style: TextStyle(
                                    fontSize: 12.sp, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  )

                ],
              )





            ],
          ),
        ),
      ),
    );


    //   GestureDetector(
    //   onTap: () {
    //    // Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyMaterialDetailsScreen(id: widget.data.id.toString())));
    //
    //   },
    //   child: Container(
    //     //margin: EdgeInsets.only(top: 10.h),
    //     child: Card(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: [
    //               Column(
    //                 children: [
    //                   SizedBox(height: 10.h),
    //                   Stack(
    //                     children: [
    //                       Container(
    //                         decoration: BoxDecoration(
    //                           color:
    //                           // widget.data.type=="pdf" || widget.data.type=="mp4"? Color.fromRGBO(239, 83, 80, 1)
    //                           //     :widget.data.type=="doc"? Colors.blue
    //                           //     :
    //                           Color.fromRGBO(225, 127, 0, 1)  ,
    //                           borderRadius: BorderRadius.circular(3.r),
    //                         ),
    //                         padding: EdgeInsets.only(
    //                           left: 28.w,
    //                           right: 28.w,
    //                           top: 24.h,
    //                           bottom: 24.h,
    //                         ),
    //                         child: Center(
    //                             child:
    //                             // widget.index == 0
    //                             //     ?
    //                             Text(
    //                               "pdf",
    //                               // widget.data["type"],
    //                               style: TextStyle(
    //                                 color: Colors.white,
    //                                 fontSize: 20.sp,
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                             )
    //
    //                         ),
    //                       ),
    //
    //                     ],
    //                   ),
    //                   SizedBox(
    //                     height: 10.h,
    //                   ),
    //                 ],
    //               ),
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   SizedBox(height: 10.h),
    //                   InkWell(
    //                     onTap: () {
    //                       //navigationService.navigateTo(StudyNotesDetailsScreenRoute);
    //                     },
    //                     child: Text(
    //                       widget.data.title,
    //                       //widget.data["title"],
    //                       style: TextStyle(
    //                         color: Color.fromRGBO(
    //                           68,
    //                           79,
    //                           84,
    //                           1,
    //                         ),
    //                         fontSize: 12.sp,
    //                         height: 1.4,
    //                         fontWeight: FontWeight.w600,
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 15.h,
    //                   ),
    //
    //                   SizedBox(
    //                     height: 25.h,
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //           Divider(),
    //
    //           Padding(
    //             padding:
    //             EdgeInsets.only( bottom: 5.h),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 // GestureDetector(
    //                 //   onTap: () {
    //                 //     // showDialog(
    //                 //     //     context: context,
    //                 //     //     builder: (BuildContext context) => RateFilter(id: widget.data.id.toString(),name: widget.data.title.toString(),type: "Past Papers")
    //                 //     // );
    //                 //   },
    //                 //   child: Container(
    //                 //     width: width/2.5,
    //                 //     //color: Colors.red,
    //                 //     child: Row(
    //                 //
    //                 //       mainAxisAlignment: MainAxisAlignment.center,
    //                 //       children: [
    //                 //         Icon(
    //                 //           Icons.star,
    //                 //           color: Colors.grey.shade400,
    //                 //           size: 22,
    //                 //         ),
    //                 //         SizedBox(
    //                 //           width: 5.w,
    //                 //         ),
    //                 //         Text(
    //                 //           "Rate",
    //                 //           style: TextStyle(
    //                 //               fontSize: 12.sp, fontWeight: FontWeight.bold),
    //                 //         ),
    //                 //       ],
    //                 //     ),
    //                 //   ),
    //                 // ),
    //                 Container(
    //                   height: 35.h,
    //                   child: VerticalDivider(),
    //                 ),
    //                 GestureDetector(
    //                   onTap: () {
    //                     //navigationService.navigateTo(StudyMaterialDetailsScreenRoute);
    //                     //_settingModalBottomSheet(context);
    //                   },
    //                   child: Container(
    //                     width: width/2.5,
    //                     //color: Colors.blue,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: [
    //                         Icon(
    //                           // widget.data.type=="mp3"? Icons.volume_up_outlined
    //                           //     :widget.data.type=="mp4"?Icons.slideshow
    //                           //     :
    //                           Icons.markunread_rounded,
    //                           size: 22.sp,
    //                           color: Colors.grey,
    //                         ),
    //                         SizedBox(
    //                           width: 5.w,
    //                         ),
    //                         Text(
    //                           // widget.data.type=="mp3"? "listen"
    //                           //     :widget.data.type=="mp4"?"Watch"
    //                           //     :
    //                           "view",
    //                           style: TextStyle(
    //                               fontSize: 12.sp, fontWeight: FontWeight.bold),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //
    //                 // Container(
    //                 //   height: 35.h,
    //                 //   child: VerticalDivider(),
    //                 // ),
    //                 // Container(
    //                 //   width: 100.w,
    //                 //   child: Row(
    //                 //     mainAxisAlignment: MainAxisAlignment.start,
    //                 //     children: [
    //                 //       Image(
    //                 //         image: AssetImage(
    //                 //             "assets/images/00-StudentNotes-Download.png"),
    //                 //         fit: BoxFit.fill,
    //                 //         height: 16.sp,
    //                 //       ),
    //                 //       SizedBox(
    //                 //         width: 5.w,
    //                 //       ),
    //                 //       Text(
    //                 //         "Download",
    //                 //         style: TextStyle(
    //                 //             fontSize: 12.sp, fontWeight: FontWeight.bold),
    //                 //       ),
    //                 //     ],
    //                 //   ),
    //                 // )
    //               ],
    //             ),
    //           ),
    //
    //
    //
    //
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }


}
