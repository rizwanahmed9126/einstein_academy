import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/providers/subject_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

class SelectSubjectWidget extends StatefulWidget {
  final data;
  final data1;
  SelectSubjectWidget({this.data,this.data1});
  @override
  _SelectSubjectWidgetState createState() => _SelectSubjectWidgetState();
}

class _SelectSubjectWidgetState extends State<SelectSubjectWidget> {
  bool isActive = false;
  var subjectData = [];

  void handleTap(var data,var data1) {
    setState(() {
      isActive = !isActive;

      if (SelectAccount.isTeacher) {
        if (isActive) {
          Provider.of<SubjectProvider>(context, listen: false).setLanguages(data);
          Provider.of<SubjectProvider>(context, listen: false).saveIDs(data1);
        } else {
          Provider.of<SubjectProvider>(context, listen: false).removeLanguages(data);
          Provider.of<SubjectProvider>(context, listen: false).removeIDS(data1);
        }
      } else {
        if (isActive) {
          Provider.of<SubjectProvider>(context, listen: false).setLanguages(data);
          Provider.of<SubjectProvider>(context, listen: false).saveIDs(data1);
        } else {
          Provider.of<SubjectProvider>(context, listen: false).removeLanguages(data);
          Provider.of<SubjectProvider>(context, listen: false).removeIDS(data1);
        }
      }
    });
  }

  @override
  void initState() {
    if (SelectAccount.isTeacher) {
      subjectData = Provider.of<SubjectProvider>(context, listen: false).getSubject;
      isActive = subjectData.contains(this.widget.data);
    } else {
      subjectData = Provider.of<SubjectProvider>(context, listen: false).getSubject;
      isActive = subjectData.contains(this.widget.data);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return InkWell(
      onTap: () {
        handleTap(widget.data,widget.data1);
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
                  child: Row(
                    children: [
                      Container(
                        child: Text(widget.data.toString(),
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                              // fontSize: 12.sp,
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: isActive ? Colors.green : Colors.grey[200]),
                  child: Icon(
                    Icons.check,
                    color: isActive ? Colors.white : Colors.grey,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
