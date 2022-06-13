// ignore_for_file: must_be_immutable

import 'package:einstien_academy_flutter/providers/student_provider.dart';
import 'package:einstien_academy_flutter/providers/teacher_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TeacherFilterWidget extends StatefulWidget {
  final data;
  ValueChanged<dynamic>? action;
  String? tag;
  final active;
  TeacherFilterWidget({this.action, this.data, this.tag, this.active});

  @override
  _TeacherFilterWidgetState createState() =>
      _TeacherFilterWidgetState();
}

class _TeacherFilterWidgetState extends State<TeacherFilterWidget> {
  void handletap() {
    widget.action!(widget.tag!);
    if(widget.active==false){
      Provider.of<TeacherProvider>(context,listen: false).saveFilterType(widget.data["name"],widget.data["id"]) ;
      print('selected value${widget.data["name"]}');
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 4.h,
        bottom: 4.h,
      ),
      child: GestureDetector(
        onTap: handletap,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.active
                  ? new Icon(
                Icons.radio_button_on_rounded,
                color: Colors.blue,
                size: 20.0,
              )
                  : new Icon(
                Icons.circle_outlined,
                color: Colors.grey,
                size: 20.0,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                widget.data["name"],
                style: TextStyle(
                  color: widget.active ? Colors.blue : Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
