import 'package:einstien_academy_flutter/models/student_notes_model.dart';
import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/providers/student_provider.dart';
import 'package:einstien_academy_flutter/providers/subject_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/anim_search_widget.dart';
import 'package:einstien_academy_flutter/widgets/student/student_filter_dialog.dart';
import 'package:einstien_academy_flutter/widgets/student/student_filter.dart';
import 'package:einstien_academy_flutter/widgets/study_notes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StudyNotesScreen extends StatefulWidget {
  const StudyNotesScreen({Key? key}) : super(key: key);

  @override
  _StudyNotesScreenState createState() => _StudyNotesScreenState();
}

class _StudyNotesScreenState extends State<StudyNotesScreen> {
  List pastPaperList = [
    {
      "type": "DOC",
      "title": "Sustainable Marketing Secrets\nand busniess growth",
      "image": "assets/images/001.jpeg",
      "name": "Bella David",
      "color": Color.fromRGBO(239, 83, 80, 1),
      "field": "Teacher",
      "num": "+9",
    },
    {
      "type": "PDF",
      "title": "Sustainable Marketing Secrets\nand busniess growth",
      "image": "assets/images/4.jpg",
      "name": "Mary Jones",
      "field": "Teacher",
      "color": Color.fromRGBO(30, 144, 241, 1),
      "num": "+4",
    },
    {
      "type": "PPT",
      "title": "Sustainable Marketing Secrets\nand busniess growth",
      "image": "assets/images/005.jpeg",
      "name": "Jennifer Paul",
      "field": "Teacher",
      "color": Color.fromRGBO(225, 127, 0, 1),
      "num": "+2",
    },
    {
      "type": "PDF",
      "title": "Sustainable Marketing Secrets\nand busniess growth",
      "image": "assets/images/003.jpeg",
      "name": "Bella David",
      "field": "Teacher",
      "color": Color.fromRGBO(239, 83, 80, 1),
      "num": "+11",
    },
  ];
  var navigationService = locator<NavigationService>();
  bool filterHaveData=false;
  List<StudentNotesModel> dataList=[];

  void filterSearchResults(String query) {
    List<StudentNotesModel> dummySearchList = [];
    dummySearchList.addAll(Provider.of<StudentProvider>(context,listen: false).tempStudentNotes);
    if(query.isNotEmpty) {
      List<StudentNotesModel> dummyListData = [];
      dummySearchList .forEach((item) {
        if(item.studynotes.title.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      if(dummyListData.isNotEmpty){
        Provider.of<StudentProvider>(context,listen: false).studentNotesSearch(dummyListData);

      }else{
        Provider.of<StudentProvider>(context,listen: false).clearStudyNotesData();
      }
      return;
    }

  }

  bool noData=false;

  getData()async{
    Provider.of<StudentProvider>(context,listen: false).studentNotesData.clear();
    Provider.of<StudentProvider>(context,listen: false).tempStudentNotes.clear();
    await Provider.of<StudentProvider>(context,listen: false).callGetStudentNotes().then((value){
      if(value=="noData"){
        setState(() {
          noData=true;
        });
      }
      dataList.addAll(Provider.of<StudentProvider>(context,listen: false).studentNotesData);
      Provider.of<StudentProvider>(context,listen: false).saveTempStudentNotes(Provider.of<StudentProvider>(context,listen: false).studentNotesData);
    });
  }
  bool active = true;
  callback(bool data) {
    setState(() {
      active = data;
    });
  }
  final cnt= TextEditingController();
  @override
  void initState() {
    getData();
    super.initState();
  }
  List games=["PDF","Image","Docx","PPTX"];

  // List games = [
  //   {
  //     "id": "1",
  //     "name": "All Study Materials",
  //   },
  //   {
  //     "id": "2",
  //     "name": "PDF",
  //   },
  //   {
  //     "id": "3",
  //     "name": "Audio",
  //   },
  //   {
  //     "id": "4",
  //     "name": "Video",
  //   },
  // ];

  // List<StudentNotesModel> mapData=[];
  //
  // filterByType(String a){
  //   mapData.clear();
  //   mapData.addAll(mapData.where((element) => element.studynotes.type=="$a"));
  // }
  // filterByGrade(String b){
  //   mapData.clear();
  //   mapData.addAll(mapData.where((element) => element.studynotes.grade.name=="$b"));
  //
  // }
  // filterBySubject(String c){
  //   mapData.clear();
  //   mapData.addAll(mapData.where((element) => element.studynotes.subject.name=="$c"));
  //
  // }

  // filterByType({String? type, String? grade, String? subject}){
  //
  //
  //   // if(type!=null && grade!=null && subject!=null){
  //   //   mapData.clear();
  //   //   mapData.addAll(Provider.of<StudentProvider>(context,listen: false).studentNotesData.where((element) => element.studynotes.type=="$type" && element.studynotes.grade.name=="$grade" && element.studynotes.subject.name=="$subject"));
  //   //
  //   // }
  //   //if(type!=null){
  //     mapData.clear();
  //     mapData.addAll(Provider.of<StudentProvider>(context,listen: false).studentNotesData.where((element) =>
  //     element.studynotes.type=="$type" && element.studynotes.subject.name=="$subject" && element.studynotes.grade.name=="$grade"
  //     // type!=null? element.studynotes.type=="$type"
  //     //     :subject!=null? element.studynotes.subject.name=="$subject"
  //     //     :grade!=null? element.studynotes.grade.name=="$grade"
  //     //     :element.studynotes.type!=""
  //     )
  //     );
  //
  //   // }
  //   // if(type!=null && grade!=null){
  //   //   mapData.clear();
  //   //   mapData.addAll(Provider.of<StudentProvider>(context,listen: false).studentNotesData.where((element) => element.studynotes.type=="$type" && element.studynotes.grade.name=="$grade"));
  //   //
  //   // }
  //
  //
  //   setState(() {});
  // }
  // filterByGrade(){
  //   mapData.clear();
  //
  //   mapData.addAll(Provider.of<StudentProvider>(context,listen: false).studentNotesData.where((element) => element.studynotes.grade.name=="4th"));
  //   setState(() {});
  // }
  // filterBySubject(){
  //   mapData.clear();
  //
  //   mapData.addAll(Provider.of<StudentProvider>(context,listen: false).studentNotesData.where((element) => element.studynotes.subject.name=="Math"));
  //   setState(() {});
  // }

  //String _selectedGender="male";

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(
        244,
        247,
        254,
        1,
      ),
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
                      "Student Notes",
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
                        Provider.of<StudentProvider>(context,listen: false).studentNotesSearch(dataList);
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
            )

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Row(
            //       children: [
            //         GestureDetector(
            //           onTap: () {
            //             navigationService.closeScreen();
            //             //navigationService.navigateTo(HomeScreenRoute);
            //           },
            //           child: Icon(
            //             Icons.keyboard_arrow_left_rounded,
            //             size: 30.h,
            //             color: Colors.white,
            //           ),
            //         ),
            //         SizedBox(
            //           width: 10.w,
            //         ),
            //         Text(
            //           "Study Notes",
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 16.sp,
            //               fontWeight: FontWeight.bold),
            //           textAlign: TextAlign.center,
            //         ),
            //       ],
            //     ),
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
      floatingActionButton: SelectAccount.isTeacher == false
          ? FloatingActionButton(
              onPressed: () {
                navigationService.navigateTo(AddStudyNotesScreenRoute);
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
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Consumer<StudentProvider>(
        builder: (context,i,_){
          return noData?Center(child: Text("No Data at the moment"),): dataList.isNotEmpty? Container(
            decoration: BoxDecoration(color: Color.fromRGBO(244, 247, 254, 1)),
            child: Padding(
              padding: EdgeInsets.all(15.0.r),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0.w),
                        child: Text(
                          "All Student Notes",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("left");
                          //filterByType(type: "pdf");

                          showDialog(
                              context: context,
                              builder: (BuildContext context) => StudentFilterDialog(
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
                              builder: (BuildContext context) => StudentFilterDialog(
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
                      ),
                      InkWell(
                        onTap: () {
                          print("right");
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => StudentFilterDialog(
                                    id: '1',
                                    values: games,//Provider.of<SubjectProvider>(context,listen: false).subject,
                                    selectedGender: "${i.selectedType}",
                              )
                          );


                        },
                        child:  Container(
                          height: 22,
                          // color:Colors.blue,
                          
                          width: 22,
                          child: Image.asset("assets/images/docs.png"))
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),


                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 55),
                        shrinkWrap: true,
                        itemCount: i.tempStudentNotes.length,
                        itemBuilder: (ctx, index) {

                          return StudyNotesWidget(
                            data: i.tempStudentNotes[index],
                            rating: i.tempStudentNotes[index].rating,
                            onTap: (){
                              // Provider.of<AuthProvider>(context,listen: false).callFollowUnFollow(mapData[index].user.id.toString()).then((value){
                              //   Provider.of<StudentProvider>(context,listen: false).clearStudyNotesData();
                              //   getData();
                              // });
                            },
                          );

                          // if("${i.studentNotesData[index].studynotes.type}".toLowerCase()=="${i.filterType}".toLowerCase()){
                          //   filterHaveData=true;
                          //   return StudyNotesWidget(
                          //     data: i.studentNotesData[index],
                          //     follow: i.studentNotesData[index].isFollow,
                          //     onTap: (){
                          //       Provider.of<AuthProvider>(context,listen: false).callFollowUnFollow(i.studentNotesData[index].user.id.toString()).then((value){
                          //         Provider.of<StudentProvider>(context,listen: false).clearStudyNotesData();
                          //         getData();
                          //       });
                          //     },
                          //   );
                          // }else if("${i.filterType}"=="All Study Materials"){
                          //   filterHaveData=true;
                          //   return StudyNotesWidget(
                          //     data: i.studentNotesData[index],
                          //     follow: i.studentNotesData[index].isFollow,
                          //     onTap: (){
                          //       Provider.of<AuthProvider>(context,listen: false).callFollowUnFollow(i.studentNotesData[index].user.id.toString()).then((value){
                          //         Provider.of<StudentProvider>(context,listen: false).clearStudyNotesData();
                          //         getData();
                          //       });
                          //     },
                          //   );
                          // }
                          // else{
                          //   if(filterHaveData==true){
                          //
                          //       filterHaveData=false;
                          //
                          //
                          //     return Container();
                          //   }
                          //   else{
                          //     return i.studentNotesData.last.studynotes.id==i.studentNotesData[index].studynotes.id? Center(child: Text('no data found'),):Container();
                          //   }
                          //
                          //   //   StudyNotesWidget(
                          //   //   data: i.studentNotesData[index],
                          //   // );
                          // }


                        }
                        ),
                  )
                ],
              ),
            ),
          ) :LoadingWidget();
        },
      ),
    );
  }


  // Widget Type(){
  //   return AlertDialog(
  //     backgroundColor: Colors.white,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
  //     content: Container(
  //       height: MediaQuery.of(context).size.height*0.65,
  //       //width: 550.w,
  //       child: Container(
  //         padding: EdgeInsets.all(10.h),
  //         child: Column(
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text(
  //                   "Filters",
  //                   style:
  //                   TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 15.h,
  //             ),
  //
  //             ListView.separated(
  //               physics: NeverScrollableScrollPhysics(),
  //               shrinkWrap: true,
  //               separatorBuilder: (BuildContext context, int i) {
  //                 return Divider(
  //                   color: Colors.transparent,
  //                 );
  //               },
  //               itemCount:Provider.of<SubjectProvider>(context,listen: false).subject.length,
  //               itemBuilder: (BuildContext context, int i) {
  //                 return
  //                   ListTile(
  //
  //
  //                     horizontalTitleGap: 1,
  //
  //
  //                     contentPadding: EdgeInsets.zero,
  //                     leading: Radio<String>(
  //                       value:Provider.of<SubjectProvider>(context,listen: false).subject[i].name, //games[i]['name'],
  //                       groupValue: _selectedGender,
  //                       onChanged: (value) {
  //                         setState(() {
  //                           _selectedGender = value!;
  //                           print(value);
  //                         });
  //                       },
  //                     ),
  //                     title: Text('${Provider.of<SubjectProvider>(context,listen: false).subject[i].name}',style: TextStyle(color: _selectedGender=='${Provider.of<SubjectProvider>(context,listen: false).subject[i].name}'?Colors.blue:Colors.black),),
  //                   );
  //
  //
  //                 //   StudentFilterWidget(
  //                 //   data: games[i],
  //                 //   tag: games[i]['id'],
  //                 //   action: active,
  //                 //   active: tagId1== games[i]['id'] ? true : false,
  //                 // );
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }



  // List games = [
  //   {
  //     "id": "1",
  //     "name": "All Study Materials",
  //   },
  //   {
  //     "id": "2",
  //     "name": "Pdf",
  //   },
  //   {
  //     "id": "3",
  //     "name": "Audio",
  //   },
  //   {
  //     "id": "4",
  //     "name": "Video",
  //   },
  // ];
  // bool value1=true;
  // bool value1=true;

  // Widget filterDialog(){
  //   return AlertDialog(
  //     backgroundColor: Colors.white,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
  //     content: Container(
  //       height: 230.h,
  //       width: 450.w,
  //       child: Container(
  //         padding: EdgeInsets.all(10.h),
  //         child: Column(
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text(
  //                   "Filters",
  //                   style:
  //                   TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 15.h,
  //             ),
  //
  //             Column(
  //               children: [
  //                 abc(
  //                   onTap: (){},
  //                   active:
  //                 )
  //
  //
  //               ],
  //             )
  //
  //
  //             // ListView.separated(
  //             //   physics: NeverScrollableScrollPhysics(),
  //             //   shrinkWrap: true,
  //             //   separatorBuilder: (BuildContext context, int i) {
  //             //     return Divider(
  //             //       color: Colors.transparent,
  //             //     );
  //             //   },
  //             //   itemCount: games.length,
  //             //   itemBuilder: (BuildContext context, int i) {
  //             //     return SelectFilterPopupWidget(
  //             //       data: games[i],
  //             //       tag: games[i]['id'],
  //             //       action: active,
  //             //       active: tagId1 == games[i]['id'] ? true : false,
  //             //     );
  //             //   },
  //             // ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  //
  // }

  // Widget abc({required VoidCallback onTap, required bool active}){
  //   return Padding(
  //     padding: EdgeInsets.only(
  //       top: 4.h,
  //       bottom: 4.h,
  //     ),
  //     child: GestureDetector(
  //       onTap: onTap,
  //       child: Container(
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             active
  //                 ? new Icon(
  //               Icons.radio_button_on_rounded,
  //               color: Colors.blue,
  //               size: 20.0,
  //             )
  //                 : new Icon(
  //               Icons.circle_outlined,
  //               color: Colors.grey,
  //               size: 20.0,
  //             ),
  //             SizedBox(
  //               width: 16,
  //             ),
  //             Text(
  //               "abc",
  //               style: TextStyle(
  //                 color: active ? Colors.blue : Colors.black,
  //                 fontSize: 16.sp,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

}
