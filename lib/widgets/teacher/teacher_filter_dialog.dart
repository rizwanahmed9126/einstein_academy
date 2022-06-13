
import 'package:einstien_academy_flutter/providers/teacher_provider.dart';

import 'package:einstien_academy_flutter/widgets/teacher/teacher_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';



class TeacherFilterDialog extends StatefulWidget {
  String selectedGender;

  String id;
  final List values;
   TeacherFilterDialog({Key? key,required this.selectedGender,required this.values,required this.id}) : super(key: key);

  @override
  _TeacherFilterDialogState createState() => _TeacherFilterDialogState();
}

class _TeacherFilterDialogState extends State<TeacherFilterDialog> {
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
  String? tagId1;
  void active(val) {
    setState(() {
      tagId1 = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      content: Container(
        constraints: BoxConstraints(minHeight: 50,maxHeight: MediaQuery.of(context).size.height*0.7),
        //height: MediaQuery.of(context).size.height*0.6,
        // width: 550.w,
        child: Container(
          padding: EdgeInsets.all(10.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Filters",
                    style:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              InkWell(
                onTap: (){
                  if(widget.id=='1'){
                    Provider.of<TeacherProvider>(context,listen: false).saveSelectedType();
                    Provider.of<TeacherProvider>(context,listen: false).filterByGrade();
                    Navigator.pop(context);

                  }
                  if(widget.id=='2'){
                    Provider.of<TeacherProvider>(context,listen: false).saveSelectedSubject();
                    Provider.of<TeacherProvider>(context,listen: false).filterByGrade();
                    Navigator.pop(context);
                  }
                  if(widget.id=='3'){
                    Provider.of<TeacherProvider>(context,listen: false).saveSelectedGrade();
                    Provider.of<TeacherProvider>(context,listen: false).filterByGrade();

                    Navigator.pop(context);

                  }
                },
                child: Container(

                  //color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.clear,size: 14,),
                      Text("Clear Filter",style: TextStyle(fontSize: 12),),
                    ],
                  ),
                ),
              ),

              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int i) {
                  return Divider(
                    color: Colors.transparent,
                  );
                },
                itemCount:widget.values.length, //Provider.of<SubjectProvider>(context,listen: false).subject.length,
                itemBuilder: (BuildContext context, int i) {
                  return

                    ListTile(


                      horizontalTitleGap: 1,


                      contentPadding: EdgeInsets.zero,
                      leading: Radio<String>(
                        value:widget.id=='1'?widget.values[i]: widget.values[i].name,
                        //Provider.of<SubjectProvider>(context,listen: false).subject[i].name, /
                        groupValue:
                        widget.selectedGender,
                        //_selectedGender,
                        onChanged: (value) {
                          setState(() {
                            widget.selectedGender = value!;



                            print(value);
                          });
                          if(widget.id=='1'){
                            Provider.of<TeacherProvider>(context,listen: false).saveSelectedType(value:value!);
                            Provider.of<TeacherProvider>(context,listen: false).filterByGrade();
                            Navigator.pop(context);

                          }
                          if(widget.id=='2'){
                            Provider.of<TeacherProvider>(context,listen: false).saveSelectedSubject(value:value!);
                            Provider.of<TeacherProvider>(context,listen: false).filterByGrade();
                            Navigator.pop(context);
                          }
                          if(widget.id=='3'){
                            Provider.of<TeacherProvider>(context,listen: false).saveSelectedGrade(value:value!);
                            Provider.of<TeacherProvider>(context,listen: false).filterByGrade();
                            Navigator.pop(context);

                          }

                        },

                      ),
                      title:
                      Text('${widget.id=='1'?widget.values[i]: widget.values[i].name}',style: TextStyle(color: widget.selectedGender=='${widget.id=='1'?widget.values[i]: widget.values[i].name}'?Colors.blue:Colors.black),),
                      //Text('${Provider.of<SubjectProvider>(context,listen: false).subject[i].name}',style: TextStyle(color: widget.selectedGender=='${Provider.of<SubjectProvider>(context,listen: false).subject[i].name}'?Colors.blue:Colors.black),),

                    );

                },
              ),
            ],
          ),
        ),
      ),
    );




    //   AlertDialog(
    //   backgroundColor: Colors.white,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
    //   content: Container(
    //     height: 230.h,
    //     width: 450.w,
    //     child: Container(
    //       padding: EdgeInsets.all(10.h),
    //       child: Column(
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text(
    //                 "Filters",
    //                 style:
    //                 TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: 15.h,
    //           ),
    //           ListView.separated(
    //             physics: NeverScrollableScrollPhysics(),
    //             shrinkWrap: true,
    //             separatorBuilder: (BuildContext context, int i) {
    //               return Divider(
    //                 color: Colors.transparent,
    //               );
    //             },
    //             itemCount: games.length,
    //             itemBuilder: (BuildContext context, int i) {
    //               return TeacherFilterWidget(
    //                 data: games[i],
    //                 tag: games[i]['id'],
    //                 action: active,
    //                 active: Provider.of<TeacherProvider>(context,listen: false).id //tagId1
    //                     == games[i]['id'] ? true : false,
    //               );
    //             },
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
