// import 'package:einstien_academy_flutter/providers/auth_provider.dart';
// import 'package:einstien_academy_flutter/providers/subject_provider.dart';
// import 'package:einstien_academy_flutter/services/navigation_service.dart';
//
// import 'package:einstien_academy_flutter/utils/routes.dart';
// import 'package:einstien_academy_flutter/utils/service_locator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:provider/provider.dart';
//
// class GetStartedScreen extends StatefulWidget {
//   @override
//   _GetStartedScreenState createState() => _GetStartedScreenState();
// }
//
// class _GetStartedScreenState extends State<GetStartedScreen> {
//   var navigationService = locator<NavigationService>();
//
//   int _current = 0;
//   List<int> listIndex = [0];
//   // var locale;
//   final List textList = [
//     'Learn, Collaborate & Discover the best study material',
//     'Learn, Collaborate & Discover the best study material',
//     'Learn, Collaborate & Discover the best study material',
//   ];
//   final List subTextList = [
//     'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
//     'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
//     'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
//   ];
//   CarouselController _controller = CarouselController();
//
//   @override
//   void initState() {
//    // SelectAccount.isTeacher?
//     //Provider.of<SubjectProvider>(context, listen: false).fetchAllSubject();
//     //:Provider.of<SubjectProvider>(context, listen: false).fetchAllGrade();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // final double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//
//         automaticallyImplyLeading: false,
//         backgroundColor:Colors.white, //Theme.of(context).primaryColor,
//         bottom: PreferredSize(
//           child: Container(
//             color:Colors.white, //Theme.of(context).primaryColor,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image(
//                   image: AssetImage(
//                     "assets/images/splash-logo.png",
//                   ),
//                   // // width: 150.w,
//                   height: 160.h,
//                 ),
//                 SizedBox(
//                   height: 45.h,
//                 ),
//                 Container(
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           width: 50.w,
//                           height: 5.h,
//                           decoration: BoxDecoration(
//                             color: Color.fromRGBO(241, 62, 146, 1),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: Color.fromRGBO(235, 210, 58, 1),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(40),
//                                 bottomLeft: Radius.circular(40),
//                               )),
//                           width: 50.w,
//                           height: 5.h,
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: Color.fromRGBO(33, 109, 246, 1),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(40),
//                                 bottomLeft: Radius.circular(40),
//                               )),
//                           width: 50.w,
//                           height: 5.h,
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: Color.fromRGBO(52, 239, 70, 1),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(40),
//                                 bottomLeft: Radius.circular(40),
//                               )),
//                           width: 50.w,
//                           height: 5.h,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           preferredSize: Size.fromHeight(200.h),
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: CarouselSlider(
//                 carouselController: _controller,
//                 options: CarouselOptions(
//                     enableInfiniteScroll: false,
//                     viewportFraction: 1,
//                     enlargeCenterPage: false,
//                     onPageChanged: (index, reason) {
//                       setState(() {
//                         if (_current == 0 && index == 1) {
//                           listIndex.add(index);
//                         } else if (_current == 1 && index == 0) {
//                           listIndex.remove(_current);
//                         } else if (_current == 1 && index == 2) {
//                           listIndex.add(index);
//                         } else if (_current == 2 && index == 1) {
//                           listIndex.remove(_current);
//                         }
//                         _current = index;
//                       });
//                     }
//                     // autoPlay: true,
//                     ),
//                 items: textList
//                     .map(
//                       (item) => Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding:
//                                 EdgeInsets.only(left: 30.w, right: 30.w),
//                             child: Text(
//                               item ==
//                                       "Learn, Collaborate & Discover the best \nstudy material"
//                                   ? "Learn, Collaborate & Discover the best \nstudy material"
//                                   : item ==
//                                           "Learn, Collaborate & Discover the best \nstudy material"
//                                       ? "Learn, Collaborate & Discover the best \nstudy material"
//                                       : item ==
//                                               "Learn, Collaborate & Discover the best \nstudy material"
//                                           ? "Learn, Collaborate & Discover the best \nstudy material"
//                                           : "Learn, Collaborate & Discover the best \nstudy material",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 24.sp,
//                                 fontWeight: FontWeight.bold,
//                                 height: 1.2,
//                                 color: Color.fromRGBO(93, 107, 116, 1),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 10.h),
//                           Padding(
//                             padding:
//                                 EdgeInsets.only(left: 30.w, right: 30.w),
//                             child: Text(
//                               item ==
//                                       "Help your colleagues in their academics by uploading your notes and get access to your favourite teachers notes"
//                                   ? "Help your colleagues in their academics by uploading your notes and get access to your favourite teachers notes"
//                                   : item ==
//                                   "Help your colleagues in their academics by uploading your notes and get access to your favourite teachers notes"
//                                       ? "Help your colleagues in their academics by uploading your notes and get access to your favourite teachers notes"
//                                       : item ==
//                                   "Help your colleagues in their academics by uploading your notes and get access to your favourite teachers notes"
//                                           ? "Help your colleagues in their academics by uploading your notes and get access to your favourite teachers notes"
//                                           : "Help your colleagues in their academics by uploading your notes and get access to your favourite teachers notes",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 12.sp,
//                                 height: 1.4.h,
//                                 fontWeight: FontWeight.w400,
//                                 color: Color.fromRGBO(93, 107, 116, 1),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                     .toList(),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: textList.asMap().entries.map((entry) {
//                 return GestureDetector(
//                   onTap: () => _controller.animateToPage(entry.key),
//                   child: Container(
//                     width: 10.w,
//                     height: 10.h,
//                     margin: EdgeInsets.symmetric(
//                         vertical: 8.0, horizontal: 4.0),
//                     decoration: BoxDecoration(
//                         border: Border.all(
//                             width: 1,
//                             color: Theme.of(context).brightness ==
//                                     Brightness.dark
//                                 ? Colors.black
//                                 : Theme.of(context).primaryColor),
//                         shape: BoxShape.circle,
//                         color:
//                             (Theme.of(context).brightness == Brightness.dark
//                                     ? Colors.black
//                                     : Theme.of(context).primaryColor
//                                 //Theme.of(context).primaryColor
//                                 )
//                                 .withOpacity(listIndex.contains(entry.key)
//                                     ? 0.7
//                                     : listIndex.contains(entry.key)
//                                         ? 0.7
//                                         : listIndex.contains(entry.key)
//                                             ? 0.7
//                                             : 0.0)),
//                   ),
//                 );
//               }).toList(),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Container(
//               width: 130.w,
//               height: 35.h,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Theme.of(context).primaryColor,
//                   elevation: 0,
//                   textStyle: TextStyle(fontWeight: FontWeight.w600),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                       side: BorderSide(
//                           color: Theme.of(context).primaryColor)),
//                 ),
//                 onPressed: () {
//                   navigationService.navigateTo(LoginScreenRoute);
//                 },
//                 child: Text(
//                   'Get Started',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 elevation: 0,
//                 textStyle: TextStyle(fontWeight: FontWeight.w600),
//                 primary: Colors.transparent,
//               ),
//               onPressed: () {
//                 navigationService.navigateTo(LoginScreenRoute);
//               },
//               child: Text(
//                 'SKIP',
//                 style: TextStyle(
//                   color: Color.fromRGBO(93, 107, 116, 1),
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';



class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  var navigationService = locator<NavigationService>();
  // final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      navigationService.navigateTo(LoginScreenRoute);
                    },
                    child: Text("Skip"))
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Expanded(
              child: IntroductionScreen(
                  pages: [


                    PageViewModel(
                      title: 'Study Material',
                      body:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      image: Center(
                          child: Image.asset(
                            "assets/images/01.png",
                          )),
                      decoration: PageDecoration(
                        titleTextStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        bodyTextStyle: TextStyle(fontSize: 14),
                        bodyPadding: EdgeInsets.only(left: 5, right: 5, top: 05),
                        bodyFlex: 1,
                        imagePadding: EdgeInsets.all(24),
                        pageColor: Colors.white,
                      ),
                    ),
                    PageViewModel(
                      title: 'Study Notes',
                      body:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      image: Center(
                          child: Image.asset(
                            "assets/images/02.png",
                          )),
                      decoration: PageDecoration(
                        titleTextStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        bodyTextStyle: TextStyle(fontSize: 14),
                        bodyPadding: EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 5
                        ),
                        bodyFlex: 1,
                        imagePadding: EdgeInsets.all(24),
                        pageColor: Colors.white,
                      ),
                    ),
                    PageViewModel(
                      title: 'Discussion Board',
                      body:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      image: Center(
                          child: Image.asset(
                            "assets/images/03.png",
                          )),
                      decoration: PageDecoration(
                        titleTextStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        bodyTextStyle: TextStyle(fontSize: 14),
                        bodyPadding: EdgeInsets.only(left: 5, right: 5, top:05),
                        bodyFlex: 1,
                        imagePadding: EdgeInsets.only(left: 14,right: 14,bottom: 24,top: 10),
                        pageColor: Colors.white,
                      ),
                      // footer: Container(
                      //   width: 300,
                      //   margin: EdgeInsets.only(top: 50, bottom: 10),
                      //   decoration: BoxDecoration(
                      //     color: Theme.of(context).accentColor,
                      //     borderRadius: BorderRadius.circular(50),
                      //     border: Border.all(
                      //       width: 1,
                      //       color: Theme.of(context).accentColor,
                      //     ),
                      //   ),
                      //   // ignore: deprecated_member_use
                      //   child: FlatButton(
                      //     onPressed: () {
                      //       //navigationService.navigateTo(SelectAccountScreenRoute);
                      //     },
                      //     child: Text(
                      //       "Get Started",
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ),
                    PageViewModel(
                      title: 'Event/Sessions',
                      body:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      image: Center(
                          child: Image.asset(
                            "assets/images/04.png",
                          )),
                      decoration: PageDecoration(
                        titleTextStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        bodyTextStyle: TextStyle(fontSize: 12),
                        bodyPadding: EdgeInsets.only(left: 5, right: 5, top: 15),
                        bodyFlex: 1,
                        imagePadding: EdgeInsets.all(24),
                        pageColor: Colors.white,
                      ),
                      // footer: Container(
                      //   width: 300,
                      //   margin: EdgeInsets.only(top: 50, bottom: 10),
                      //   decoration: BoxDecoration(
                      //     color: Theme.of(context).accentColor,
                      //     borderRadius: BorderRadius.circular(50),
                      //     border: Border.all(
                      //       width: 1,
                      //       color: Theme.of(context).accentColor,
                      //     ),
                      //   ),
                      //   // ignore: deprecated_member_use
                      //   child: FlatButton(
                      //     onPressed: () {
                      //       //navigationService.navigateTo(SelectAccountScreenRoute);
                      //     },
                      //     child: Text(
                      //       "Get Started",
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ),
                  ],
                  showDoneButton: false,
                  showNextButton: false,
                  initialPage: 0,
                  onDone: () {},
                  dotsDecorator:
                  // ?
                  DotsDecorator(
                      size: const Size.square(10.0),
                      activeSize: const Size(20.0, 10.0),
                      // activeColor: Theme.accentColor,
                      color: Colors.black26,
                      spacing: const EdgeInsets.symmetric(
                          horizontal: 3.0, vertical: 30),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)))
                // : DotsDecorator(
                //     color: Colors.transparent,
                //     activeColor: Colors.transparent),
              ),
            ),
          ],
        ));
  }



}

