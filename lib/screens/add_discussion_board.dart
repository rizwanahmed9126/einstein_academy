import 'dart:io';

import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/providers/chat_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/util_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/add_disscussion_list.dart';
import 'package:einstien_academy_flutter/widgets/button_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddDiscussionBoardScreen extends StatefulWidget {
  const AddDiscussionBoardScreen({Key? key}) : super(key: key);

  @override
  _AddDiscussionBoardScreenState createState() =>
      _AddDiscussionBoardScreenState();
}

class _AddDiscussionBoardScreenState extends State<AddDiscussionBoardScreen> {

  final titleCnt=TextEditingController();
  final descCnt=TextEditingController();

  // List<Map<String, dynamic>> adddiscussionList = [
  //   {
  //     "id": "1",
  //     "title": "Brandi Micheal",
  //     "img": "assets/images/dummy.jpg",
  //   },
  //   {
  //     "id": "2",
  //     "title": "Brandi Micheal",
  //     "img": "assets/images/dummy1.jpg",
  //   },
  //   {
  //     "id": "3",
  //     "title": "Bradley Micheal",
  //     "img": "assets/images/dummy3.jpg",
  //   },
  //   {
  //     "id": "4",
  //     "title": "Brandi Micheal",
  //     "img": "assets/images/dummy4.jpg",
  //   },
  // ];
  String tagId = ' ';
  void active(
    dynamic val,
  ) {
    setState(() {
      tagId = val;
    });
  }

  FilePickerResult? result ;
  bool isLoadingProgress=false;

  var navigationService = locator<NavigationService>();
  UtilService utilService = locator<UtilService>();
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        bottom: PreferredSize(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left_rounded,
                        size: 24.h,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Add Discussion Board",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 50.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(241, 62, 146, 1),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(235, 210, 58, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                              )),
                          width: 50.w,
                          height: 5.h,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(33, 109, 246, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                              )),
                          width: 50.w,
                          height: 5.h,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(52, 239, 70, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                              )),
                          width: 50.w,
                          height: 5.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(30.0.h),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child:
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 25.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Column(
                        children: [
                          Container(
                            width: 450.w,
                            height: 45.h,
                            child: TextField(
                              controller: titleCnt,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 15),
                                hintText: "Discussion Board Title",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: 450.w,
                            child: TextField(
                              maxLines: 3,
                              controller: descCnt,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 15),
                                hintText: "Event Description",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),

                          SizedBox(
                            height: 15.h,
                          ),

                          InkWell(
                            onTap: ()async{
                              var value = await FilePicker.platform.pickFiles(allowMultiple: false,
                                type: FileType.image,
                                //allowedExtensions: extension,
                              );
                              if(value!=null){
                                setState(() {
                                  result=value;
                                });
                              }



                             // print(result!.files.first.path);
                            },
                            child: DottedBorder(
                                dashPattern: [4, 4,],
                                color: Colors.grey[400]!,
                                borderType: BorderType.RRect,
                                radius: Radius.circular(9),
                                //padding: EdgeInsets.all(8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                  child:
                                  result != null
                                      ? Container(
                                    height: height*0.22,
                                    width: width,

                                    child: Image.file(
                                      File(result!.files.first.path!),
                                      // width: 90,
                                      // height: 90,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                      :
                                  InkWell(
                                    onTap: ()async{
                                      var value = await FilePicker.platform.pickFiles(allowMultiple: false,
                                        type: FileType.image,
                                        //allowedExtensions: extension,
                                      );
                                      if(value!=null){
                                        setState(() {
                                          result=value;
                                        });
                                      }



                                     // print(result!.files.first.path);
                                      //_settingModalBottomSheet(context);
                                    },
                                    child: Container(
                                      height: height*0.2,
                                      width: width,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Center(
                                              child: Icon(
                                                Icons.image,
                                                size: 35,
                                                color: Colors.grey,
                                              )),
                                          Text(
                                            "Upload Discussion Board Image",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Max file size 2mb",
                                            style: TextStyle(
                                                color: Colors.grey, fontSize: 12),
                                          )
                                        ],
                                      ),


                                    ),
                                  ),
                                )
                            ),
                          ),



                        ],
                      ),

                      SizedBox(
                        height: 25.h,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ButtonWidget(
                          onpreseed: (){
                            if(titleCnt.text.isEmpty || descCnt.text.isEmpty || result==null){
                              utilService.showToast("Please Fill all Fileds");
                            }
                            else{
                              setState(() {
                                isLoadingProgress=true;
                              });
                              var userID=Provider.of<AuthProvider>(context,listen: false).user!.id;
                              Provider.of<ChatProvider>(context,listen: false).uploadDiscussionDP("$userID", File(result!.files.first.path!)).then((value){
                                if(value!="fail"){
                                  Provider.of<ChatProvider>(context,listen: false).createDiscussionBoard(titleCnt.text, descCnt.text, value).then((value){
                                    navigationService.closeScreen();
                                   // navigationService.navigateTo(DiscussionBoardScreenRoute);
                                  });
                                }
                                else{
                                  utilService.showToast("Fail to upload image");
                                }




                              });

                            }



                          },
                          name: "Create Discussion Board",

                        ),
                      ),

                    ],
                  ),
                ),


          ),
          if (isLoadingProgress)
            Center(
              //alignment: Alignment.center,
              child: LoadingWidget(),
            )
        ],
      ),
    );
  }

  // void _settingModalBottomSheet(context) {
  //   showModalBottomSheet(
  //       backgroundColor: Colors.white,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  //       ),
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  //           ),
  //           height: 180.h,
  //           child: new Wrap(
  //             children: <Widget>[
  //               Container(
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.only(
  //                       topLeft: Radius.circular(20),
  //                       topRight: Radius.circular(20)),
  //                   color: Theme.of(context).primaryColor,
  //                 ),
  //                 width: 500,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Padding(
  //                       padding: EdgeInsets.all(15),
  //                       child: Text("   Upload Profile Picture",
  //                           //'Upload Profile Picture',
  //                           style: TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 16.sp,
  //                             fontWeight: FontWeight.bold,
  //                           )),
  //                     ),
  //                     Row(
  //                       children: [
  //                         Expanded(
  //                           child: Container(
  //                             width: 50.w,
  //                             height: 5.h,
  //                             decoration: BoxDecoration(
  //                               color: Color.fromRGBO(241, 62, 146, 1),
  //                             ),
  //                           ),
  //                         ),
  //                         Expanded(
  //                           child: Container(
  //                             decoration: BoxDecoration(
  //                                 color: Color.fromRGBO(235, 210, 58, 1),
  //                                 borderRadius: BorderRadius.only(
  //                                   topLeft: Radius.circular(40),
  //                                   bottomLeft: Radius.circular(40),
  //                                 )),
  //                             width: 50.w,
  //                             height: 5.h,
  //                           ),
  //                         ),
  //                         Expanded(
  //                           child: Container(
  //                             decoration: BoxDecoration(
  //                                 color: Color.fromRGBO(33, 109, 246, 1),
  //                                 borderRadius: BorderRadius.only(
  //                                   topLeft: Radius.circular(40),
  //                                   bottomLeft: Radius.circular(40),
  //                                 )),
  //                             width: 50.w,
  //                             height: 5.h,
  //                           ),
  //                         ),
  //                         Expanded(
  //                           child: Container(
  //                             decoration: BoxDecoration(
  //                                 color: Color.fromRGBO(52, 239, 70, 1),
  //                                 borderRadius: BorderRadius.only(
  //                                   topLeft: Radius.circular(40),
  //                                   bottomLeft: Radius.circular(40),
  //                                 )),
  //                             width: 50.w,
  //                             height: 5.h,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Container(
  //                 height: 15,
  //               ),
  //               new ListTile(
  //                 leading: Container(
  //                   height: 60.h,
  //                   width: 60.w,
  //                   decoration: BoxDecoration(
  //                       shape: BoxShape.circle,
  //                       gradient: LinearGradient(
  //                           begin: (Alignment.bottomCenter),
  //                           end: (Alignment.bottomLeft),
  //                           colors: [
  //                             Colors.purple,
  //                             Colors.purpleAccent,
  //                           ])),
  //                   child: new Icon(
  //                     Icons.camera,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //                 title: new Text("Take Photo",
  //                     // 'Take Photo',
  //                     style: TextStyle(
  //                         color: Colors.black, fontWeight: FontWeight.w500)),
  //                 onTap: () {
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //               Container(
  //                 margin: EdgeInsets.only(top: 10),
  //                 child: new ListTile(
  //                   leading: Container(
  //                     margin: EdgeInsets.only(top: 3.h),
  //                     height: 60.h,
  //                     width: 60.w,
  //                     decoration: BoxDecoration(
  //                         shape: BoxShape.circle,
  //                         gradient: LinearGradient(
  //                             begin: (Alignment.bottomCenter),
  //                             end: (Alignment.bottomLeft),
  //                             colors: [
  //                               Colors.pink,
  //                               Colors.pinkAccent,
  //                             ])),
  //                     child: new Icon(
  //                       Icons.image,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                   title: new Text("Browse",
  //                       // 'Browse',
  //                       style: TextStyle(
  //                           color: Colors.black, fontWeight: FontWeight.w500)),
  //                   onTap: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  // }
}
