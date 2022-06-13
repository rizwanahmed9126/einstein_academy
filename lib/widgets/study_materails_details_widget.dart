import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class StudyMaterialDetailsListWidget extends StatefulWidget {
  final data;
  ValueChanged<dynamic>? action;
  final active;
  String? tag;
  StudyMaterialDetailsListWidget(
      {this.data, this.action, this.active, this.tag});

  @override
  _StudyMaterialDetailsListWidgetState createState() =>
      _StudyMaterialDetailsListWidgetState();
}

class _StudyMaterialDetailsListWidgetState
    extends State<StudyMaterialDetailsListWidget> {
  void handletap() {
    widget.action!(widget.tag!);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handletap,
      child: Container(
        margin: EdgeInsets.only(top: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  child: Image(
                    image: AssetImage(widget.data['img']),
                    fit: BoxFit.fill,
                    height: 35.h,
                    width: 30.w,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  widget.data['title'],
                  style: TextStyle(
                      color: Colors.blue.shade600,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.r),
                      border: Border.all(
                        color: Color.fromRGBO(
                          30,
                          144,
                          241,
                          1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 5.0.w, right: 5.0.w, top: 5.0.h, bottom: 5.0.h),
                      child: Text(
                        "Listen",
                        style: TextStyle(
                            fontSize: 8.sp,
                            color: Color.fromRGBO(
                              30,
                              144,
                              241,
                              1,
                            ),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.r),
                      border: Border.all(
                        color: Color.fromRGBO(
                          30,
                          144,
                          241,
                          1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 5.0.w, right: 5.0.w, top: 5.0.h, bottom: 5.0.h),
                      child: Text(
                        "Download",
                        style: TextStyle(
                            fontSize: 8.sp,
                            color: Color.fromRGBO(
                              30,
                              144,
                              241,
                              1,
                            ),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
