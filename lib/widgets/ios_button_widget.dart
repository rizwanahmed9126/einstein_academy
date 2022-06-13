// import 'dart:core';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:hexcolor/hexcolor.dart';
// import 'package:relative_scale/relative_scale.dart';

// class IosButtonsWidget extends StatefulWidget {
//   @override
//   _IosButtonsWidgetState createState() => _IosButtonsWidgetState();
// }

// class _IosButtonsWidgetState extends State<IosButtonsWidget> {
//   var isLoadingProgress = false;
//   @override
//   Widget build(BuildContext context) {
//     return RelativeBuilder(
//       builder: (context, height, width, sy, sx) {
//         return Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 // padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
//                 height: sy(50),
//                 width: sx(90),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(
//                     color: Color.fromRGBO(154, 183, 208, 1),
//                     width: 1,
//                   ),
//                 ),
//                 child: Center(
//                   child: IconButton(
//                     icon: Icon(
//                       FontAwesomeIcons.facebookSquare,
//                       size: sy(20),
//                       color: Colors.white,
//                     ),
//                     onPressed: () async {
//                       // try {
//                       //   setState(() {
//                       //     isLoadingProgress = true;
//                       //   });
//                       //   await Provider.of<AuthProvider>(context, listen: false)
//                       //       .setRememberMe(true);
//                       //   await Provider.of<AuthProvider>(context, listen: false)
//                       //       .facebookAuthProvider();
//                       //   setState(() {
//                       //     isLoadingProgress = false;
//                       //   });
//                       // } catch (error) {
//                       //   await _showLocationPopUp();
//                       // }
//                       //  Navigator.of(context).pushNamed(PhoneNumberScreenRoute);
//                     },
//                   ),
//                 ),
//               ),
//               Container(
//                 // padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
//                 height: sy(40),
//                 width: sx(90),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(color: const Color(0x11000000), blurRadius: 10.0)
//                   ],
//                   color: Color.fromRGBO(66, 134, 245, 1),
//                 ),
//                 child: Center(
//                   child: IconButton(
//                     icon: Image.asset('assets/images/googleicon.png', scale: 4),
//                     // color: Colors.lightBlueAccent[300],
//                     onPressed: () async {
//                       // try {
//                       //   setState(() {
//                       //     isLoadingProgress = true;
//                       //   });
//                       //   await Provider.of<AuthProvider>(context, listen: false)
//                       //       .setRememberMe(true);
//                       //   await Provider.of<AuthProvider>(
//                       //           context, // isko un commint ker na hai
//                       //           listen: false)
//                       //       .googleAuthProvider();
//                       //   setState(() {
//                       //     isLoadingProgress = false;
//                       //   });
//                       // } catch (error) {
//                       //   await _showLocationPopUp();
//                       // }
//                       // Navigator.of(context)
//                       //     .pushNamed(PhoneNumberScreenRoute);
//                     },
//                   ),
//                 ),
//               ),
//               Container(
//                 // padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
//                 height: sy(50),
//                 width: sx(90),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(
//                     color: Color.fromRGBO(154, 183, 208, 1),
//                     width: 1,
//                   ),
//                 ),
//                 child: Center(
//                   child: IconButton(
//                     icon: Image.asset('assets/images/icon-apple.jpg',
//                         fit: BoxFit.fill, scale: 4),
//                     // color: Colors.lightBlueAccent[300],
//                     onPressed: () {},
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   // _showLocationPopUp() async {
//   //   setState(() {
//   //     isLoadingProgress = false;
//   //   });
//   //   Location location = new Location();
//   //   var _permissionGranted = await location.hasPermission();
//   //   if (_permissionGranted != PermissionStatus.granted) {
//   //     return LocationRestrictedScreen();
//   //     // showDialog(
//   //     //     context: context,
//   //     //     builder: (_) {
//   //     //       return LocationRestricted();
//   //     //     });
//   //   }
//   // }
// }
