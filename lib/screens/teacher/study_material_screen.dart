//import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:einstien_academy_flutter/models/teacher_material_model.dart';
import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/providers/subject_provider.dart';
import 'package:einstien_academy_flutter/providers/teacher_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/anim_search_widget.dart';
import 'package:einstien_academy_flutter/widgets/student/student_filter_dialog.dart';
import 'package:einstien_academy_flutter/widgets/study_material_list.dart';
import 'package:einstien_academy_flutter/widgets/teacher/teacher_filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class StudyMaterialScreen extends StatefulWidget {
  const StudyMaterialScreen({Key? key}) : super(key: key);

  @override
  _StudyMaterialScreenState createState() => _StudyMaterialScreenState();
}

class _StudyMaterialScreenState extends State<StudyMaterialScreen> {
  // List<Map<String, dynamic>> studymaterialList = [
  //   {
  //     "type": "DOC",
  //     "title": "Sustainable Marketing Secrets\nand busniess growth",
  //     "image": "assets/images/001.jpeg",
  //     "name": "Bella David",
  //     "color": Color.fromRGBO(239, 83, 80, 1),
  //     "field": "Teacher",
  //     "num": "+9",
  //   },
  //   {
  //     "type": "assets/images/high-volume.png",
  //     "title": "Sustainable Marketing Secrets\nand busniess growth",
  //     "image": "assets/images/4.jpg",
  //     "name": "Mary Jones",
  //     "field": "Teacher",
  //     "color": Color.fromRGBO(30, 144, 241, 1),
  //     "num": "+4",
  //   },
  //   {
  //     "type": "assets/images/high-volume.png",
  //     "title": "Sustainable Marketing Secrets\nand busniess growth",
  //     "image": "assets/images/005.jpeg",
  //     "name": "Jennifer Paul",
  //     "field": "Teacher",
  //     "color": Color.fromRGBO(225, 127, 0, 1),
  //     "num": "+2",
  //   },
  //   {
  //     "type": "assets/images/play-button.png",
  //     "title": "Sustainable Marketing Secrets\nand busniess growth",
  //     "image": "assets/images/003.jpeg",
  //     "name": "Bella David",
  //     "field": "Teacher",
  //     "color": Color.fromRGBO(239, 83, 80, 1),
  //     "num": "+11",
  //   },
  // ];
  // String tagId = ' ';
  // void active(
  //   dynamic val,
  // ) {
  //   setState(() {
  //     tagId = val;
  //   });
  // }

  List games=["PDF","Audio","Video"];


  List<TeacherMaterialModel> dataList=[];
  getData()async{

    await Provider.of<TeacherProvider>(context,listen: false).callGetTeacherMaterial().then((value){

      if(value=="NoMaterial"){
        setState(() {
          noMaterial=false;
        });
      }
      dataList.addAll(Provider.of<TeacherProvider>(context,listen: false).teacherMaterialData);
      Provider.of<TeacherProvider>(context,listen: false).saveTempTeacherNotes(Provider.of<TeacherProvider>(context,listen: false).teacherMaterialData);


    });
  }


  @override
  void initState() {
    Provider.of<TeacherProvider>(context,listen: false).teacherMaterialData.clear();
    Provider.of<TeacherProvider>(context,listen: false).tempTeacherMaterials.clear();
    getData();

    super.initState();
  }

  void filterSearchResults(String query) {
    List<TeacherMaterialModel> dummySearchList = [];
    dummySearchList.addAll(Provider.of<TeacherProvider>(context,listen: false).tempTeacherMaterials);
    if(query.isNotEmpty) {
      List<TeacherMaterialModel> dummyListData = [];
      dummySearchList .forEach((item) {
        if(item.studymaterial.title.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      if(dummyListData.isNotEmpty){
          Provider.of<TeacherProvider>(context,listen: false).teacherMaterialSearch(dummyListData);

      }else{
        Provider.of<TeacherProvider>(context,listen: false).clearData();
      }
      return;
    }

  }

  var navigationService = locator<NavigationService>();
  bool noMaterial=true;

 final cnt= TextEditingController();

  bool active = true;
  callback(bool data) {
    setState(() {
      active = data;
    });
  }

  bool filterHaveData=false;
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(top:active? 23.0.h:3),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                active
                    ? Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Provider.of<TeacherProvider>(context,listen: false).teacherMaterialSearch(dataList);
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left_rounded,
                        size: 30.h,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Study Material",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
                    : Container(),




                AnimSearchBar(
                  color: Colors.transparent,
                  callback: callback,
                  width: width*0.9,


                  textController: cnt,
                  onSuffixTap: () {
                    // //Navigator.pop(context);
                    // setState(() {
                    //   active = !active;
                    // });
                  },
                  onChanged: (value){
                    filterSearchResults(value);
                    if(value.isEmpty){
                      setState(() {
                        Provider.of<TeacherProvider>(context,listen: false).teacherMaterialSearch(dataList);
                        // studymaterialList.clear();
                        // studymaterialList.addAll(abcList);
                      });


                    }
                  },

                  onPrefixTap: () {
                    setState(() {
                      active = !active;
                    });

                  },

                ),
              ],
            ),


            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //
            //
            //     Row(
            //       children: [
            //         GestureDetector(
            //           onTap: () {
            //
            //             navigationService.closeScreen();
            //             //navigationService.navigateTo(HomeScreenTeacherRoute);
            //           },
            //           child: Icon(
            //             Icons.keyboard_arrow_left_rounded,
            //             size: 30.h,
            //             color: Colors.white,
            //           ),
            //         ),
            //         SizedBox(
            //           width: 5.w,
            //         ),
            //         Text(
            //           "Study Material",
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 16.sp,
            //               fontWeight: FontWeight.bold),
            //           textAlign: TextAlign.center,
            //         ),
            //       ],
            //     ),
            //
            //
            //     IconButton(
            //       onPressed: () {
            //         navigationService.navigateTo(SearchScreenRoute);
            //       },
            //       icon: Image.asset(
            //         "assets/images/search.png",
            //         scale: 1,
            //         height: 20.h,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ],
            // ),
          ),
          bottom: PreferredSize(
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
            preferredSize: Size.fromHeight(0),
          ),
        ),
      ),
      floatingActionButton: Provider.of<AuthProvider>(context,listen: false).user!.type=="TEACHER"?
      FloatingActionButton(
        onPressed: () {
          navigationService.navigateTo(AddStudyMaterialScreenRoute);
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          child: Image(
            image: AssetImage("assets/images/plusicon.png"),
            width: 20.w,
            height: 20.h,
          ),
        ),
      ):Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Consumer<TeacherProvider>(
        builder: (context,i,_){
          return noMaterial ?  dataList.isNotEmpty? Container(
            decoration: BoxDecoration(color: Color.fromRGBO(244, 247, 254, 1)),
            child: Padding(
              padding: EdgeInsets.all(15.0.r),
              child: Column(
                children: [
                  // Container(
                  //   child: TextField(
                  //     controller: cnt,
                  //     onChanged: (value){
                  //       filterSearchResults(value);
                  //       if(value.isEmpty){
                  //         setState(() {
                  //           i.teacherSearch(dataList);
                  //           // studymaterialList.clear();
                  //           // studymaterialList.addAll(abcList);
                  //         });
                  //
                  //
                  //       }
                  //
                  //     },
                  //
                  //
                  //   ),
                  // ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0.w),
                        child: Text(
                          "All Study Material",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("left");
                          //filterByType(type: "pdf");

                          showDialog(
                              context: context,
                              builder: (BuildContext context) => TeacherFilterDialog(
                                id: '3',
                                values: Provider.of<SubjectProvider>(context,listen: false).grade,
                                selectedGender: "${i.selectedGrade}",
                              )
                          );


                        },
                        child: Container(
                          height: 22,
                          // color:Colors.blue,
                          width: 22,
                          child: Image.asset("assets/images/school.png"))
                        // Image.asset(
                        //   "assets/images/filters.png",
                        //   color: Color.fromRGBO(
                        //     68,
                        //     79,
                        //     84,
                        //     1,
                        //   ),
                        //   scale: 3,
                        // ),
                      ),
                      InkWell(
                        onTap: () {
                          print("mid");
                          //filterByType(type: "docx",subject: "Urdu");

                          showDialog(
                              context: context,
                              builder: (BuildContext context) => TeacherFilterDialog(
                                id: '2',
                                values: Provider.of<SubjectProvider>(context,listen: false).subject,
                                selectedGender: "${i.selectedSubject}",
                              )
                          );


                        },
                        child: Container(
                          height: 22,
                          // color:Colors.blue,
                          width: 22,
                          child: Image.asset("assets/images/search_book.png"))
                        // Image.asset(
                        //   "assets/images/filters.png",
                        //   color: Color.fromRGBO(
                        //     68,
                        //     79,
                        //     84,
                        //     1,
                        //   ),
                        //   scale: 3,
                        // ),
                      
                        // Image.asset(
                        //   "assets/images/filters.png",
                        //   color: Color.fromRGBO(
                        //     68,
                        //     79,
                        //     84,
                        //     1,
                        //   ),
                        //   scale: 3,
                        // ),
                      ),
                      InkWell(
                        onTap: () {
                          print("right");
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => TeacherFilterDialog(
                                id: '1',
                                values: games,//Provider.of<SubjectProvider>(context,listen: false).subject,
                                selectedGender: "${i.selectedType}",
                              )
                          );


                        },
                        child: Container(
                          height: 22,
                          // color:Colors.blue,
                          width: 22,
                          child: Image.asset("assets/images/docs.png"))
                        // Image.asset(
                        //   "assets/images/filters.png",
                        //   color: Color.fromRGBO(
                        //     68,
                        //     79,
                        //     84,
                        //     1,
                        //   ),
                        //   scale: 3,
                        // ),
                      
                      ),
                    ],
                  ),


                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.only(left: 8.0.w),
                  //       child: Text(
                  //         "All Study Materials",
                  //         style: TextStyle(fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //     InkWell(
                  //       onTap: () {
                  //         showDialog(
                  //             context: context,
                  //             builder: (BuildContext context) =>
                  //                 TeacherFilterDialog());
                  //       },
                  //       child: Image.asset(
                  //         "assets/images/filters.png",
                  //         color: Color.fromRGBO(
                  //           68,
                  //           79,
                  //           84,
                  //           1,
                  //         ),
                  //         scale: 3,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 55),
                        shrinkWrap: true,
                        itemCount:i.tempTeacherMaterials.length,
                        itemBuilder: (ctx, index) {

                          return StudyMaterialList(
                            data: i.tempTeacherMaterials[index],
                            follow: i.tempTeacherMaterials[index].isFollow,
                            rating:i.tempTeacherMaterials[index].rating,
                            onTap: (){
                              // Provider.of<AuthProvider>(context,listen: false).callFollowUnFollow(i.teacherMaterialData[index].user.id.toString()).then((value){
                              //   Provider.of<TeacherProvider>(context,listen: false).clearData();
                              //   getData();
                              // });


                            },

                          );



                          // if("${i.teacherMaterialData[index].studymaterial.type}".toLowerCase()=="${i.filterType}".toLowerCase()){
                          //   filterHaveData=true;
                          //   return StudyMaterialList(
                          //     data: i.teacherMaterialData[index],
                          //     follow: i.teacherMaterialData[index].isFollow,
                          //     onTap: (){
                          //       Provider.of<AuthProvider>(context,listen: false).callFollowUnFollow(i.teacherMaterialData[index].user.id.toString()).then((value){
                          //         Provider.of<TeacherProvider>(context,listen: false).clearData();
                          //         getData();
                          //       });
                          //
                          //
                          //     },
                          //
                          //   );
                          // }else if("${i.filterType}"=="All Study Materials"){
                          //   filterHaveData=true;
                          //   return  StudyMaterialList(
                          //     data: i.teacherMaterialData[index],
                          //     follow: i.teacherMaterialData[index].isFollow,
                          //     onTap: (){
                          //       Provider.of<AuthProvider>(context,listen: false).callFollowUnFollow(i.teacherMaterialData[index].user.id.toString()).then((value){
                          //         Provider.of<TeacherProvider>(context,listen: false).clearData();
                          //         getData();
                          //       });
                          //
                          //
                          //     },
                          //
                          //   );
                          // }
                          // else{
                          //
                          //   if(filterHaveData==true){
                          //       //filterHaveData=false;
                          //
                          //     // if( i.teacherMaterialData.last.studymaterial.id==i.teacherMaterialData[index].studymaterial.id){
                          //     //   return Center(child: Text('no data found'),)
                          //     // }else{
                          //     //
                          //     // }
                          //
                          //
                          //     return i.teacherMaterialData.last.studymaterial.id==i.teacherMaterialData[index].studymaterial.id? Center(child: Text('no data found'),):Container();
                          //   }
                          //   else{
                          //
                          //     return i.teacherMaterialData.last.studymaterial.id==i.teacherMaterialData[index].studymaterial.id? Center(child: Text('no data found'),):Container();
                          //   }
                          //
                          //
                          // }



                          // if("${i.studentNotesData[index].type}".toLowerCase()=="${i.filterType}".toLowerCase()){
                          //   filterHaveData=true;
                          //   return StudyNotesWidget(
                          //     data: i.studentNotesData[index],
                          //   );
                          // }else if("${i.filterType}"=="All Study Materials"){
                          //   filterHaveData=true;
                          //   return StudyNotesWidget(
                          //     data: i.studentNotesData[index],
                          //   );
                          // }
                          // else{
                          //   if(filterHaveData==true){
                          //     filterHaveData=false;
                          //     return Container();
                          //   }
                          //   else{
                          //     return i.studentNotesData.last.id==i.studentNotesData[index].id? Center(child: Text('no data found'),):Container();
                          //   }
                          //
                          //   //   StudyNotesWidget(
                          //   //   data: i.studentNotesData[index],
                          //   // );
                          // }





                        }),
                  ),
                ],
              ),
            ),
          )
              :LoadingWidget():Center(child: Text("No Material Found"),);
        },
      ),
    );
  }
}
