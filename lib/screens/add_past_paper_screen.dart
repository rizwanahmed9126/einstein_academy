// import 'package:dotted_border/dotted_border.dart';
// import 'package:einstien_academy_flutter/services/navigation_service.dart';
// import 'package:einstien_academy_flutter/utils/routes.dart';
// import 'package:einstien_academy_flutter/utils/service_locator.dart';
// import 'package:einstien_academy_flutter/widgets/add_study_list_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class AddPastPaperScreen extends StatefulWidget {
//   const AddPastPaperScreen({Key? key}) : super(key: key);
//
//   @override
//   _AddPastPaperScreenState createState() => _AddPastPaperScreenState();
// }
//
// class _AddPastPaperScreenState extends State<AddPastPaperScreen> {
//   String? valuechoose;
//   String? valueChoose1;
//   List item = ["item1", "item2", "item3", "item4"];
//   List item1 = ["item1", "item2", "item3", "item4"];
//   List<Map<String, dynamic>> addStudyList = [
//     {
//       "id": "1",
//       "title": "marketing_material_29dec.pdf",
//       "img": "assets/images/pdf.png",
//     },
//     {
//       "id": "2",
//       "title": "marketing_material_29dec.pdf",
//       "img": "assets/images/pdf.png",
//     },
//     {
//       "id": "3",
//       "title": "marketing_material_29dec.pdf",
//       "img": "assets/images/pdf.png",
//     },
//     {
//       "id": "4",
//       "title": "marketing_material_29dec.pdf",
//       "img": "assets/images/pdf.png",
//     },
//   ];
//   String tagId = ' ';
//   void active(
//     dynamic val,
//   ) {
//     setState(() {
//       tagId = val;
//     });
//   }
//
//   var navigationService = locator<NavigationService>();
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         navigationService.navigateTo(HomeScreenRoute);
//         return false;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           leadingWidth: 40.w,
//           centerTitle: false,
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           backgroundColor: Color.fromRGBO(
//             30,
//             144,
//             241,
//             1,
//           ),
//           leading: IconButton(
//             onPressed: () {},
//             icon: Image.asset(
//               "assets/images/left-arrow.png",
//               scale: 1,
//               height: 20.h,
//               color: Colors.white,
//             ),
//             color: Colors.white,
//           ),
//           title: Text(
//             "Add Past Paper",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           bottom: PreferredSize(
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     width: 50.w,
//                     height: 5.h,
//                     decoration: BoxDecoration(
//                       color: Color.fromRGBO(241, 62, 146, 1),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Color.fromRGBO(235, 210, 58, 1),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(40),
//                           bottomLeft: Radius.circular(40),
//                         )),
//                     width: 50.w,
//                     height: 5.h,
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Color.fromRGBO(33, 109, 246, 1),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(40),
//                           bottomLeft: Radius.circular(40),
//                         )),
//                     width: 50.w,
//                     height: 5.h,
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Color.fromRGBO(52, 239, 70, 1),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(40),
//                           bottomLeft: Radius.circular(40),
//                         )),
//                     width: 50.w,
//                     height: 5.h,
//                   ),
//                 ),
//               ],
//             ),
//             preferredSize: Size(double.infinity, 20.h),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 15.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 Column(
//                   children: [
//                     Container(
//                       width: 400.w,
//                       height: 40.h,
//                       child: TextField(
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 14.h, horizontal: 15.w),
//                           hintText: "Title",
//                           hintStyle: TextStyle(color: Colors.grey),
//                           border: OutlineInputBorder(),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.grey),
//                               borderRadius: BorderRadius.circular(5)),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.grey),
//                               borderRadius: BorderRadius.circular(5)),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           border: Border.all(color: Colors.grey)),
//                       child: DropdownButton(
//                         underline: SizedBox(),
//                         hint: Text("   Select Subject"),
//                         icon: Icon(Icons.keyboard_arrow_down),
//                         iconSize: 25.h,
//                         isExpanded: true,
//                         style: TextStyle(color: Colors.grey, fontSize: 16.sp),
//                         value: valuechoose,
//                         onChanged: (newValue) {
//                           setState(() {
//                             valuechoose = newValue.toString();
//                           });
//                         },
//                         items: item.map((valueitem) {
//                           return DropdownMenuItem(
//                             value: valueitem,
//                             child: Text(
//                               "   $valueitem",
//                               style: TextStyle(
//                                   fontSize: 18.sp, color: Colors.grey),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           border: Border.all(color: Colors.grey)),
//                       child: DropdownButton(
//                         underline: SizedBox(),
//                         hint: Text("   Select Grade/Standard"),
//                         icon: Icon(Icons.keyboard_arrow_down),
//                         iconSize: 25.h,
//                         isExpanded: true,
//                         style: TextStyle(color: Colors.grey, fontSize: 16.sp),
//                         value: valueChoose1,
//                         onChanged: (newValue) {
//                           setState(() {
//                             valueChoose1 = newValue.toString();
//                           });
//                         },
//                         items: item1.map((valueitem) {
//                           return DropdownMenuItem(
//                             value: valueitem,
//                             child: Text(
//                               "   $valueitem",
//                               style: TextStyle(
//                                   fontSize: 18.sp, color: Colors.grey),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15.h,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         _settingModalBottomSheet(context);
//                       },
//                       child: Container(
//                         width: 400.w,
//                         height: 120.h,
//                         child: DottedBorder(
//                             dashPattern: [3, 2],
//                             radius: Radius.circular(100),
//                             color: Colors.grey,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Center(
//                                     child: Icon(
//                                   Icons.image,
//                                   size: 35.h,
//                                   color: Colors.grey,
//                                 )),
//                                 Text(
//                                   "Upload PDF, Audio or Video",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.grey),
//                                 ),
//                                 SizedBox(
//                                   height: 5.h,
//                                 ),
//                                 Text(
//                                   "Max file size 50mb",
//                                   style: TextStyle(
//                                       color: Colors.grey, fontSize: 12.sp),
//                                 )
//                               ],
//                             )),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 25.h,
//                 ),
//                 Text(
//                   "ADDED PARTICIPANTS",
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 12.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     padding: EdgeInsets.only(right: 1),
//                     shrinkWrap: true,
//                     itemCount: addStudyList.length,
//                     itemBuilder: (ctx, i) {
//                       return AddStudyList(
//                         data: addStudyList[i],
//                         tag: addStudyList[i]['id'],
//                         action: active,
//                         active: tagId == addStudyList[i]['id'] ? true : false,
//                       );
//                     }),
//                 SizedBox(
//                   height: 35.h,
//                 ),
//                 Container(
//                     width: 400.w,
//                     height: 40.h,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       child: Text(
//                         "Add Past Paper",
//                         style: TextStyle(fontSize: 12.sp),
//                       ),
//                     )),
//                 SizedBox(
//                   height: 15.h,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _settingModalBottomSheet(context) {
//     showModalBottomSheet(
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//         ),
//         context: context,
//         builder: (BuildContext bc) {
//           return Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//             ),
//             height: 180.h,
//             child: new Wrap(
//               children: <Widget>[
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20)),
//                     color: Theme.of(context).primaryColor,
//                   ),
//                   width: 500,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(15),
//                         child: Text("   Upload Profile Picture",
//                             //'Upload Profile Picture',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.bold,
//                             )),
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               width: 50.w,
//                               height: 5.h,
//                               decoration: BoxDecoration(
//                                 color: Color.fromRGBO(241, 62, 146, 1),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Color.fromRGBO(235, 210, 58, 1),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(40),
//                                     bottomLeft: Radius.circular(40),
//                                   )),
//                               width: 50.w,
//                               height: 5.h,
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Color.fromRGBO(33, 109, 246, 1),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(40),
//                                     bottomLeft: Radius.circular(40),
//                                   )),
//                               width: 50.w,
//                               height: 5.h,
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Color.fromRGBO(52, 239, 70, 1),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(40),
//                                     bottomLeft: Radius.circular(40),
//                                   )),
//                               width: 50.w,
//                               height: 5.h,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 15,
//                 ),
//                 new ListTile(
//                   leading: Container(
//                     height: 60.h,
//                     width: 60.w,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         gradient: LinearGradient(
//                             begin: (Alignment.bottomCenter),
//                             end: (Alignment.bottomLeft),
//                             colors: [
//                               Colors.purple,
//                               Colors.purpleAccent,
//                             ])),
//                     child: new Icon(
//                       Icons.camera,
//                       color: Colors.white,
//                     ),
//                   ),
//                   title: new Text("Take Photo",
//                       // 'Take Photo',
//                       style: TextStyle(
//                           color: Colors.black, fontWeight: FontWeight.w500)),
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 10),
//                   child: new ListTile(
//                     leading: Container(
//                       margin: EdgeInsets.only(top: 3.h),
//                       height: 60.h,
//                       width: 60.w,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           gradient: LinearGradient(
//                               begin: (Alignment.bottomCenter),
//                               end: (Alignment.bottomLeft),
//                               colors: [
//                                 Colors.pink,
//                                 Colors.pinkAccent,
//                               ])),
//                       child: new Icon(
//                         Icons.image,
//                         color: Colors.white,
//                       ),
//                     ),
//                     title: new Text("Browse",
//                         // 'Browse',
//                         style: TextStyle(
//                             color: Colors.black, fontWeight: FontWeight.w500)),
//                     onTap: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
