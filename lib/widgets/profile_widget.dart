import 'package:einstien_academy_flutter/models/student_profile_model.dart';
import 'package:einstien_academy_flutter/models/teacher_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWidget extends StatefulWidget {
  final StudyNote data;
  ProfileWidget({Key? key, required this.data}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return
      Container(
        height: height*0.17,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
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
                          height: 90.h,
                          width: 90.w,
                                          decoration: BoxDecoration(
                                            color:widget.data.type=="pdf" || widget.data.type=="Video"? Color.fromRGBO(239, 83, 80, 1)
                                                :widget.data.type=="doc" || widget.data.type=="docx"? Colors.blue
                                                : Color.fromRGBO(225, 127, 0, 1)  ,
                                            borderRadius: BorderRadius.circular(3.r),
                                          ),
                          //padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 24.h, bottom: 24.h,),
                          child: Center(
                              child:Text(
                                widget.data.type,
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
                    Container(
                      width: width*0.55,
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                              Container(
                                width: 80,
                                //color: Colors.red,
                                child: Text(
                                  widget.data.subject.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(
                                      51,
                                      61,
                                      70,
                                      1,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "•",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color.fromRGBO(
                                    193,
                                    199,
                                    215,
                                    1,
                                  ),
                                ),
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
                                "12 Grade",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(
                                    51,
                                    61,
                                    70,
                                    1,
                                  ),
                                ),
                              ),
                            ],
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
                    // Container(
                    //     width: width/7.5,
                    //     //color: Colors.red,
                    //
                    //     child: Container()
                    //
                    // ),



                  ],
                ),
              ),







            ],
          ),
        ),
      );


    //   Container(
    //   padding: EdgeInsets.only(right:10.h,top: 10.h,bottom: 10.h),
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
    //   child: Column(
    //     children: [
    //       Row(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           Column(
    //             children: [
    //               Container(
    //                 height: 90.h,
    //                 width: 120.w,
    //                 decoration: BoxDecoration(
    //                   color:widget.data.type=="pdf" || widget.data.type=="Video"? Color.fromRGBO(239, 83, 80, 1)
    //                       :widget.data.type=="doc" || widget.data.type=="docx"? Colors.blue
    //                       : Color.fromRGBO(225, 127, 0, 1)  ,
    //                   borderRadius: BorderRadius.circular(3.r),
    //                 ),
    //                 padding: EdgeInsets.only(
    //                   left: 28.w,
    //                   right: 28.w,
    //                   top: 24.h,
    //                   bottom: 24.h,
    //                 ),
    //                 child: Center(
    //                   child: Text(
    //                     widget.data.type,
    //                     style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 20.sp,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //
    //               // Stack(
    //               //   children: [
    //               //     Container(
    //               //       height: 90.h,
    //               //       width: 120.w,
    //               //       decoration: BoxDecoration(
    //               //         color:widget.data.type=="pdf" || widget.data.type=="Video"? Color.fromRGBO(239, 83, 80, 1)
    //               //             :widget.data.type=="doc" || widget.data.type=="docx"? Colors.blue
    //               //             : Color.fromRGBO(225, 127, 0, 1)  ,
    //               //         borderRadius: BorderRadius.circular(3.r),
    //               //       ),
    //               //       padding: EdgeInsets.only(
    //               //         left: 28.w,
    //               //         right: 28.w,
    //               //         top: 24.h,
    //               //         bottom: 24.h,
    //               //       ),
    //               //       child: Center(
    //               //         child: Text(
    //               //           widget.data.type,
    //               //           style: TextStyle(
    //               //             color: Colors.white,
    //               //             fontSize: 20.sp,
    //               //             fontWeight: FontWeight.bold,
    //               //           ),
    //               //         ),
    //               //       ),
    //               //     ),
    //               //   ],
    //               // ),
    //
    //             ],
    //           ),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 widget.data.title,
    //                 style: TextStyle(
    //                   color: Color.fromRGBO(
    //                     68,
    //                     79,
    //                     84,
    //                     1,
    //                   ),
    //                   fontSize: 12.sp,
    //                   height: 1.4,
    //                   fontWeight: FontWeight.w600,
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 15.h,
    //               ),
    //               Row(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Icon(
    //                     Icons.folder,
    //                     color: Color.fromRGBO(
    //                       193,
    //                       199,
    //                       215,
    //                       1,
    //                     ),
    //                     size: 16.h,
    //                   ),
    //                   SizedBox(
    //                     width: 5.w,
    //                   ),
    //                   Text(
    //                     widget.data.subject.name,
    //                     style: TextStyle(
    //                       fontSize: 10.sp,
    //                       fontWeight: FontWeight.w500,
    //                       color: Color.fromRGBO(
    //                         51,
    //                         61,
    //                         70,
    //                         1,
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     width: 5.w,
    //                   ),
    //                   Text(
    //                     "•",
    //                     style: TextStyle(
    //                       fontSize: 12.sp,
    //                       color: Color.fromRGBO(
    //                         193,
    //                         199,
    //                         215,
    //                         1,
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     width: 5.w,
    //                   ),
    //                   Icon(
    //                     Icons.folder,
    //                     color: Color.fromRGBO(
    //                       193,
    //                       199,
    //                       215,
    //                       1,
    //                     ),
    //                     size: 16.h,
    //                   ),
    //                   SizedBox(
    //                     width: 5.w,
    //                   ),
    //                   Text(
    //                     "12 Grade",
    //                     style: TextStyle(
    //                       fontSize: 10.sp,
    //                       fontWeight: FontWeight.w500,
    //                       color: Color.fromRGBO(
    //                         51,
    //                         61,
    //                         70,
    //                         1,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
