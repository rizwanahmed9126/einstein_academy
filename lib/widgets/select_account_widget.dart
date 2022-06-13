import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/storage_service.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SelectAccountWidget extends StatefulWidget {
  final data;
  ValueChanged<dynamic>? action;
  String? tag;
  final active;
  final active1;
  SelectAccountWidget(
      {this.action, this.data, this.tag, this.active, this.active1});

  @override
  _SelectAccountWidgetState createState() => _SelectAccountWidgetState();
}

class _SelectAccountWidgetState extends State<SelectAccountWidget> {
  void handletap() {
    widget.action!(widget.tag!);
  }
  StorageService storageService = locator<StorageService>();

  var navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return InkWell(
        onTap: () async{
          if(widget.data['id']=="1")
          await this.storageService.setData("AccountType", "STUDENT");
          else{
            await this.storageService.setData("AccountType", "TEACHER");
          }
         // print('${widget.data['title']}  ${widget.data['id']}');
          handletap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20.r, right: 20.r, top: 10.h),
              // margin: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.w,
                    color: widget.active
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(5.r)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 80.w),
                    child: widget.active
                        ? new Icon(
                            Icons.check_circle,
                            color: Theme.of(context).primaryColor,
                            size: 20.0.h,
                          )
                        : new Icon(
                            Icons.check_circle,
                            color: Colors.grey.shade300,
                            size: 20.0.h,
                          ),
                  ),
                  Image(
                    image: AssetImage(
                      widget.data['image'],
                    ),
                    width: 50.w,
                    height: 50.h,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 100.w,
                    child: Text(
                      widget.data['title'],
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: widget.active
                            ? Theme.of(context).primaryColor
                            : Color.fromRGBO(88, 102, 115, 1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
