import 'package:dotted_border/dotted_border.dart';
import 'package:einstien_academy_flutter/providers/student_provider.dart';
import 'package:einstien_academy_flutter/providers/subject_provider.dart';
import 'package:einstien_academy_flutter/providers/teacher_provider.dart';
import 'package:einstien_academy_flutter/screens/student/home_screen_student.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/util_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/add_study_list_screen.dart';
import 'package:einstien_academy_flutter/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';

class AddStudyNotesScreen extends StatefulWidget {
  const AddStudyNotesScreen({Key? key}) : super(key: key);

  @override
  _AddStudyNotesScreenState createState() => _AddStudyNotesScreenState();
}

class _AddStudyNotesScreenState extends State<AddStudyNotesScreen> {
  String? valuechoose;
  String? valuechooseID;
  String? valueChoose1;
  String? valueChoose2;
  String? valueChoose1ID;
  //String? choosenFileType;
  List item = [];
  List item1 = [];
  List item2 = [];
  //List fileType = ["pdf", "doc", "jpg", "png",'mp4',];

  final titleCnt=TextEditingController();

  List<Map<String, dynamic>> addStudyList = [
    {
      "id": "1",
      "title": "marketing_material_29dec.pdf",
      "img": "assets/images/pdf.png",
    },
    {
      "id": "2",
      "title": "marketing_material_29dec.pdf",
      "img": "assets/images/pdf.png",
    },
    {
      "id": "3",
      "title": "marketing_material_29dec.pdf",
      "img": "assets/images/PPT.png",
    },
    {
      "id": "4",
      "title": "marketing_material_29dec.pdf",
      "img": "assets/images/VideoPDF.png",
    },
  ];
  String tagId = ' ';
  void active(
      dynamic val,
      ) {
    setState(() {
      tagId = val;
    });
  }
  FilePickerResult? result ;

  var navigationService = locator<NavigationService>();

  UtilService utilService = locator<UtilService>();

  bool isLoadingProgress=false;
  var focusNode = FocusNode();

  getData(){
    Provider.of<SubjectProvider>(context,listen: false).subject.forEach((element) {
      setState(() {
        item.add(element);
      });


    });
    Provider.of<SubjectProvider>(context,listen: false).grade.forEach((element) {
      setState(() {
        item1.add(element);
      });


    });

    Provider.of<SubjectProvider>(context,listen: false).syllabus.forEach((element) {
      setState(() {
        item2.add(element);
      });


    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(


      backgroundColor: Color.fromRGBO(244, 247, 254, 1),
      appBar: AppBar(
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
                        navigationService.closeScreen();
                        //navigationService.navigateTo(HomeScreenTeacherRoute);
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
                      "Add Student Notes",
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
          SafeArea(
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 25),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Column(
                        children: [
                          Container(
                            width: 400.w,
                            height: 40.h,
                            child: TextField(
                              controller: titleCnt,
                              focusNode: focusNode,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 14.h, horizontal: 15.w),
                                hintText: "Title",
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                ),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(154, 183, 208, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(154, 183, 208, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                  width: 1,
                                )),
                            child: DropdownButton(
                              onTap: (){
                              //  valuechooseID = newValue.id.toString();
                                focusNode.unfocus();
                                },
                              underline: SizedBox(),
                              hint: Text("   Select Subject"),
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 25.h,
                              isExpanded: true,
                              style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                              value: valuechoose,
                              onChanged: (newValue) {
                                focusNode.unfocus();
                                setState(() {
                                  valuechoose = newValue.toString();
                                  print(valuechoose);
                                 // valuechooseID =(item.indexOf(newValue)+1).toString();

                                  print(valuechooseID);
                                });
                              },//Provider.of<SubjectProvider>(context,listen: false).subject
                              items: item.map((valueitem) {
                                //valuechooseID=valueitem.toString();
                                return DropdownMenuItem(
                                  value: valueitem.id.toString(),
                                  child: Text(
                                    "   ${valueitem.name}",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Color.fromRGBO(154, 183, 208, 1),
                                    ),
                                  ),
                                );
                              }).toList(),

                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                  width: 1,
                                )),
                            child: DropdownButton(
                              onTap: (){
                                focusNode.unfocus();
                                },
                              underline: SizedBox(),
                              hint: Text("   Select Grade/Standard"),
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 25.h,
                              isExpanded: true,
                              style: TextStyle(
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                  fontSize: 16.sp),
                              value: valueChoose1,
                              onChanged: (newValue) {
                                focusNode.unfocus();
                                setState(() {
                                  valueChoose1 = newValue.toString();
                                  //valueChoose1ID=(item1.indexOf(newValue)+1).toString();
                                });
                              },
                              items: item1.map((valueitem) {
                                //valueChoose1ID=valueitem.toString();
                                return DropdownMenuItem(
                                  value: valueitem.id.toString(),
                                  child: Text(
                                    // ignore: unnecessary_brace_in_string_interps
                                    "   ${valueitem.name}",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Color.fromRGBO(154, 183, 208, 1),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),

                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                  width: 1,
                                )),
                            child: DropdownButton(
                              onTap: (){
                                focusNode.unfocus();
                              },
                              underline: SizedBox(),
                              hint: Text("   Select Syllabus"),
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 25.h,
                              isExpanded: true,
                              style: TextStyle(
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                  fontSize: 16.sp),
                              value: valueChoose2,
                              onChanged: (newValue) {
                                focusNode.unfocus();
                                setState(() {
                                  valueChoose2 = newValue.toString();
                                  //valueChoose1ID=(item1.indexOf(newValue)+1).toString();
                                });
                              },
                              items: item2.map((valueitem) {
                                //valueChoose1ID=valueitem.toString();
                                return DropdownMenuItem(
                                  value: valueitem.id.toString(),
                                  child: Text(
                                    // ignore: unnecessary_brace_in_string_interps
                                    "   ${valueitem.name}",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Color.fromRGBO(154, 183, 208, 1),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),




                          // Container(
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(5),
                          //       border: Border.all(
                          //         color: Color.fromRGBO(154, 183, 208, 1),
                          //         width: 1,
                          //       )),
                          //   child: DropdownButton(
                          //     underline: SizedBox(),
                          //     hint: Text("  Select File type"),
                          //     icon: Icon(Icons.keyboard_arrow_down),
                          //     iconSize: 25.h,
                          //     isExpanded: true,
                          //     style: TextStyle(
                          //         color: Color.fromRGBO(154, 183, 208, 1),
                          //         fontSize: 16.sp),
                          //     value: choosenFileType,
                          //     onChanged: (newValue) {
                          //       setState(() {
                          //         choosenFileType = newValue.toString();
                          //       });
                          //     },
                          //     items: fileType.map((valueitem) {
                          //       return DropdownMenuItem(
                          //         value: valueitem,
                          //         child: Text(
                          //           // ignore: unnecessary_brace_in_string_interps
                          //           "   ${valueitem}",
                          //           style: TextStyle(
                          //             fontSize: 18.sp,
                          //             color: Color.fromRGBO(154, 183, 208, 1),
                          //           ),
                          //         ),
                          //       );
                          //     }).toList(),
                          //   ),
                          // ),
                          SizedBox(
                            height: 15.h,
                          ),
                          GestureDetector(
                            onTap: () async{
                              focusNode.unfocus();

                              mediaTypeDialog();




                              // if(choosenFileType!=null){
                              //   result = await FilePicker.platform.pickFiles(allowMultiple: true,
                              //     type: FileType.custom,
                              //     allowedExtensions: [choosenFileType!],
                              //   );
                              //   setState(() {});
                              //
                              //
                              //
                              //   print(result!.files.length);
                              //   if (result != null) {
                              //     PlatformFile file = result!.files.first;
                              //
                              //     print(file.name);
                              //     print(file.bytes);
                              //     print(file.size);
                              //     print(file.extension);
                              //     print(file.path);
                              //   } else {
                              //     // User canceled the picker
                              //   }
                              // }else{
                              //   utilService.showToast("Please select File type from dropdown");
                              // }


                              //_settingModalBottomSheet(context);
                            },
                            child: Container(
                              width: 320.w,
                              height: 150.h,
                              child: DottedBorder(
                                  dashPattern: [3, 2],
                                  radius: Radius.circular(100),
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images/UploadPDF.png"),
                                          width: 80.w,
                                          height: 80.h,
                                        ),
                                      ),
                                      Text(
                                        "Upload PDF, Doc, PPT or Image",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(154, 183, 208, 1),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        "Max file size 50mb",
                                        style: TextStyle(
                                            color:
                                            Color.fromRGBO(154, 183, 208, 1),
                                            fontSize: 12.sp),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        "ADDED PARTICIPANTS",
                        style: TextStyle(
                            color: Color.fromRGBO(154, 183, 208, 1),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      result!=null? ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(right: 1,),
                          shrinkWrap: true,
                          itemCount: result!.files.length,
                          itemBuilder: (ctx, i) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Image(
                                        image: AssetImage(
                                          //'jpg','png','tiff','jpeg'
                                            result!.files[0].extension=="pdf"? "assets/images/pdf.png"

                                            : result!.files[0].extension=="doc" || result!.files[0].extension=="docx"? "assets/images/doc.png"
                                            : result!.files[0].extension=="pptx" || result!.files[0].extension=="ppt"? "assets/images/pptx.png"
                                                :"assets/images/img.png"
                                        ),
                                        fit: BoxFit.cover,
                                        height: 30.h,
                                        width: 30.w,
                                      ),
                                    ),
                                    Container(
                                        width:width*0.7,

                                        child: Text(  result!.files[i].name,overflow: TextOverflow.ellipsis,maxLines: 1,)
                                    ),
                                    InkWell(
                                      onTap:(){
                                        setState(() {
                                          result!.files.removeAt(i);
                                        });


                                      },
                                      child: Icon(
                                        Icons.close,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5,)
                              ],
                            );
                            //   AddStudyList(
                            //   data: addStudyList[i],
                            //   tag: addStudyList[i]['id'],
                            //   action: active,
                            //   active: tagId == addStudyList[i]['id'] ? true : false,
                            // );
                          }):Text(''),
                      SizedBox(
                        height: 35.h,
                      ),
                      ButtonWidget(
                        onpreseed: ()async{

                          if(result==null || valuechoose==null || valueChoose1==null || titleCnt.text.isEmpty || valueChoose2==null){

                            utilService.showToast("Please Complete all Fields");


                          }
                          else{
                            setState(() {
                              isLoadingProgress=true;
                            });
                            await Provider.of<StudentProvider>(context,listen: false).callPostStudentNotes(titleCnt.text,int.parse(valuechoose!),int.parse(valueChoose1!),int.parse(valueChoose2!),result!).then((value){
                              print("value $value");

                              if(value=="done"){
                                navigationService.navigateTo(HomeScreenStudentRoute);
                              }

                              else{
                                utilService.showToast("Failed to upload data");
                              }

                              setState(() {
                                isLoadingProgress=false;
                              });
                            });
                            print("please add files");
                          }


                        },
                        name: "Add Student Notes",

                      ),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (isLoadingProgress)
            Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )),
        ],
      ),
    );


  }

  mediaTypeDialog(){
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext,
            Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              height: height*0.3,
              width: width*0.8,
              //padding: EdgeInsets.all(20),

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,

                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)
                        )
                    ),

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
                  SizedBox(height: 10,),




                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      mediaImageWidget(imgEndPnt: "pdf.png",extension: ['pdf']),

                      mediaImageWidget(imgEndPnt: "img.png",extension: ['jpg','png','tiff','jpeg']),

                      mediaImageWidget(imgEndPnt: "doc.png",extension: ["doc",'docx']),
                      mediaImageWidget(imgEndPnt: "pptx.png",extension: ["pptx",'ppt']),



                    ],
                  ),


                ],
              ),
            ),
          );
        });
  }

  mediaImageWidget({required String imgEndPnt, required List<String> extension,String? extensionOFMedia}){
    return  GestureDetector(
        onTap: ()async{
          //if(choosenFileType!=null){
          result = await FilePicker.platform.pickFiles(allowMultiple: true,
            type: FileType.custom,
            allowedExtensions: extension,//[extension],
          );
          setState(() {});



          print(result!.files.length);
          if (result != null) {
            PlatformFile file = result!.files.first;

            print(file.name);
            print(file.bytes);
            print(file.size);
            print(file.extension);
            print(file.path);
          } else {
            // User canceled the picker
          }
          Navigator.pop(context);
          // }else{
          //   utilService.showToast("Please select File type from dropdown");
          // }
        },
        child: Image.asset("assets/images/$imgEndPnt",height: 60,width: 60,)
    );
  }


}
