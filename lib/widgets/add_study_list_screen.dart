// import 'package:flutter/material.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// // ignore: must_be_immutable
// class AddStudyList extends StatefulWidget {
//   final data;
//   ValueChanged<dynamic>? action;
//   final active;
//   String? tag;
//   AddStudyList({this.data, this.action, this.active, this.tag});
//
//   @override
//   _AddStudyListState createState() => _AddStudyListState();
// }
//
// class _AddStudyListState extends State<AddStudyList> {
//   void handletap() {
//     widget.action!(widget.tag!);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: handletap,
//       child: Container(
//         margin: EdgeInsets.only(top: 14),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   child: Image(
//                     image: AssetImage(widget.data['img']),
//                     fit: BoxFit.cover,
//                     height: 35.h,
//                     width: 35.w,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10.w,
//                 ),
//                 widget.tag == '1'
//                     ? Text(
//                         widget.data['title'],
//                         style: TextStyle(color: Colors.blue.shade600),
//                       )
//                     : widget.tag == '2'
//                         ? LinearPercentIndicator(
//                             width: MediaQuery.of(context).size.width - 125,
//                             animation: true,
//                             lineHeight: 8.0,
//                             animationDuration: 9000,
//                             percent: 0.9,
//                             center: Text(
//                               "",
//                               style: TextStyle(fontSize: 8),
//                             ),
//                             linearStrokeCap: LinearStrokeCap.roundAll,
//                             progressColor: Colors.lightGreen,
//                           )
//                         : widget.tag == '3'
//                             ? LinearPercentIndicator(
//                                 width: MediaQuery.of(context).size.width - 125,
//                                 animation: true,
//                                 lineHeight: 8.0,
//                                 animationDuration: 9000,
//                                 percent: 0.7,
//                                 center: Text(
//                                   "",
//                                   style: TextStyle(fontSize: 8),
//                                 ),
//                                 linearStrokeCap: LinearStrokeCap.roundAll,
//                                 progressColor: Colors.lightGreen,
//                               )
//                             : LinearPercentIndicator(
//                                 width: MediaQuery.of(context).size.width - 125,
//                                 animation: true,
//                                 lineHeight: 8.0,
//                                 animationDuration: 9000,
//                                 percent: 0.5,
//                                 center: Text(
//                                   "",
//                                   style: TextStyle(fontSize: 8),
//                                 ),
//                                 linearStrokeCap: LinearStrokeCap.roundAll,
//                                 progressColor: Colors.lightGreen,
//                               ),
//               ],
//             ),
//             Icon(
//               Icons.close,
//               size: 18,
//               color: Colors.grey,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
