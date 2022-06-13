import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class DrawerList extends StatefulWidget {
  final data;
  bool? active;
  ValueChanged<dynamic>? action;
  final String? tag;
  DrawerList({this.data, this.active, this.action, this.tag});

  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  var navigationService = locator<NavigationService>();

  void handletap() {
    if (widget.tag == '1') {
      navigationService.navigateTo(StudyMaterialScreenRoute);
    }
    if (widget.tag == '2') {
      navigationService.navigateTo(StudyNotesScreenRoute);
    }
    if (widget.tag == '3') {
      navigationService.navigateTo(PastPaperScreenRoute);
    }
    if (widget.tag == '4') {
      navigationService.navigateTo(DiscussionBoardScreenRoute);
    }
    if (widget.tag == '5') {
      navigationService.navigateTo(EventAndSessionScreenRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handletap,
      child: Container(
        padding: EdgeInsets.fromLTRB(0.w, 2.h, 0, 2.h),
        child: Column(
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage(
                    widget.data['image'],
                  ),
                  width: 45.w,
                  height: 45.h,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(widget.data['title'],
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
