import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationWidget extends StatefulWidget {
  final data;
  const NotificationWidget({Key? key, this.data}) : super(key: key);

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        30.w,
        20.h,
        30.w,
        20.h,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(5.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24.r,
            backgroundImage: AssetImage(
              widget.data["image"],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            widget.data["name"],
            style: TextStyle(
              color: Color.fromRGBO(
                68,
                79,
                84,
                1,
              ),
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            width: 100.w,
            child: Text(
              widget.data["field"],
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10.sp,
                height: 1.4,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          active
              ? InkWell(
                  onTap: () {
                    setState(() {
                      active = !active;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                      20.w,
                      5.h,
                      20.w,
                      5.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(
                        30,
                        144,
                        241,
                        1,
                      ),
                      borderRadius: BorderRadius.circular(
                        5.r,
                      ),
                      border: Border.all(
                        color: Color.fromRGBO(
                          30,
                          144,
                          241,
                          1,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Follow",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    setState(() {
                      active = !active;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5.w, 8.h, 5.w, 8.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          5.r,
                        ),
                        border: Border.all(
                          width: 1,
                          color: Color.fromRGBO(
                            30,
                            144,
                            241,
                            1,
                          ),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          color: Color.fromRGBO(
                            30,
                            144,
                            241,
                            1,
                          ),
                          size: 12.h,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Following",
                          style: TextStyle(
                            color: Color.fromRGBO(
                              30,
                              144,
                              241,
                              1,
                            ),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
