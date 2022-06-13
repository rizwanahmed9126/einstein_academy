import 'package:einstien_academy_flutter/models/following_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowingListWidget extends StatefulWidget {
  final Following data;
  const FollowingListWidget({Key? key, required this.data}) : super(key: key);

  @override
  _FollowingListWidgetState createState() => _FollowingListWidgetState();
}

class _FollowingListWidgetState extends State<FollowingListWidget> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: FadeInImage(

                image: NetworkImage("${widget.data.profileImg}",),
                placeholder: AssetImage("assets/images/placeHolder.png"),
                imageErrorBuilder: (context,i,error)=>Icon(Icons.info),
                height: 28,
                width: 28,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.data.name}",
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
                Text(
                  "${widget.data.type}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 9.sp,
                    height: 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {},
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
      ),
    );
  }
}
