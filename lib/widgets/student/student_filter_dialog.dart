import 'package:einstien_academy_flutter/providers/student_provider.dart';
import 'package:einstien_academy_flutter/providers/subject_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'student_filter.dart';

class StudentFilterDialog extends StatefulWidget {
  String selectedGender;

  String id;
  final List values;
  StudentFilterDialog(
      {Key? key,
      //required this.onChanged,
      required this.selectedGender,
      required this.values,
      required this.id})
      : super(key: key);

  @override
  _StudentFilterDialogState createState() => _StudentFilterDialogState();
}

class _StudentFilterDialogState extends State<StudentFilterDialog> {
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
  // String? tagId1;
  // void active(val) {
  //   setState(() {
  //     tagId1 = val;
  //   });
  // }
  // String _selectedGender = 'male';

  @override
  void initState() {
    // TODO: implement initState
    print("${widget.values.length}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      content: Column(
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
                Provider.of<StudentProvider>(context,listen: false).saveSelectedType();
                Provider.of<StudentProvider>(context,listen: false).filterByGrade();
                Navigator.pop(context);

              }
              if(widget.id=='2'){
                Provider.of<StudentProvider>(context,listen: false).saveSelectedSubject();
                Provider.of<StudentProvider>(context,listen: false).filterByGrade();
                Navigator.pop(context);
              }
              if(widget.id=='3'){
                Provider.of<StudentProvider>(context,listen: false).saveSelectedGrade();
                Provider.of<StudentProvider>(context,listen: false).filterByGrade();

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

          Container(
            height: MediaQuery.of(context).size.height*0.3,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              //physics: NeverScrollableScrollPhysics(),
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
                          Provider.of<StudentProvider>(context,listen: false).saveSelectedType(value:value!);
                          Provider.of<StudentProvider>(context,listen: false).filterByGrade();
                          Navigator.pop(context);

                        }
                        if(widget.id=='2'){
                          Provider.of<StudentProvider>(context,listen: false).saveSelectedSubject(value:value!);
                          Provider.of<StudentProvider>(context,listen: false).filterByGrade();
                          Navigator.pop(context);
                        }
                        if(widget.id=='3'){
                          Provider.of<StudentProvider>(context,listen: false).saveSelectedGrade(value:value!);
                          Provider.of<StudentProvider>(context,listen: false).filterByGrade();
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
          ),
        ],
      ),
    );
  }
}
