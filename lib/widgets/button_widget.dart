import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatefulWidget {
  String? name;

  void Function()? onpreseed;

  ButtonWidget({Key? key, this.name, this.onpreseed})
      : super(key: key);

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  var navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return Container(
        width: 400.w,
        height: 40.h,
        child: ElevatedButton(
          onPressed: widget.onpreseed,
          child: Text(
            widget.name!,
            style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
