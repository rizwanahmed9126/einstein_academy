import 'package:einstien_academy_flutter/services/storage_service.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

// ignore: must_be_immutable
class NotificationSettingsWidget extends StatefulWidget {
  // final data;
  // ValueChanged<dynamic>? action;
  // String? tag;
  // final active;

  final Function(bool) onChanged;
  final String name;
    bool? isSwitched;
  NotificationSettingsWidget({
    //this.action, this.data, this.tag, this.active,
    required this.name,
    this.isSwitched,
    required this.onChanged,
  });

  @override
  _NotificationSettingsWidgetState createState() =>
      _NotificationSettingsWidgetState();
}

class _NotificationSettingsWidgetState extends State<NotificationSettingsWidget> {
  // void handletap() {
  //   widget.action!(widget.tag!);
  // }

  //bool isSwitched = false;
  var textValue = 'Switch is OFF';

  StorageService storageService = locator<StorageService>();

  // void toggleSwitch(bool value) {
  //   if (widget.isSwitched == false) {
  //     setState(() {
  //       widget.isSwitched = true;
  //       textValue = 'Switch Button is ON';
  //
  //       if(widget.data['id']=="1"){
  //         storageService.setBoolData("MaterialSwitch", widget.isSwitched!);
  //         print("material ON");
  //       }
  //       if(widget.data['id']=="2"){
  //         print("following ON");
  //         storageService.setBoolData("NotificationSwitch", widget.isSwitched!);
  //       }
  //       if(widget.data['id']=="3"){
  //         print("rating ON");
  //         storageService.setBoolData("RatingSwitch", widget.isSwitched!);
  //       }
  //
  //     });
  //
  //   } else {
  //     setState(() {
  //       widget.isSwitched = false;
  //       textValue = 'Switch Button is OFF';
  //
  //       if(widget.data['id']=="1"){
  //         storageService.setBoolData("MaterialSwitch", widget.isSwitched!);
  //         print("material OFF");
  //       }
  //       if(widget.data['id']=="2"){
  //         storageService.setBoolData("NotificationSwitch", widget.isSwitched!);
  //         print("following OFF");
  //       }
  //       if(widget.data['id']=="3"){
  //         storageService.setBoolData("RatingSwitch", widget.isSwitched!);
  //         print("rating OFF");
  //       }
  //
  //     });
  //
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return GestureDetector(
        //onTap: handletap,
        child: Container(
          // padding: EdgeInsets.all(.h),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    child: Text(
                      "${widget.name}",
                      //widget.data['title'],
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: sy(9),
                      ),
                    ),
                  ),

                  Transform.scale(
                      scale: 1,
                      child: Switch(
                        onChanged: widget.onChanged,
                        //     (value){
                        //   setState(() {
                        //     widget.isSwitched=!widget.isSwitched!;
                        //   });
                        //   print(value);
                        //
                        // },
                        value: widget.isSwitched!,
                        activeColor: Colors.greenAccent,
                        activeTrackColor: Colors.greenAccent,
                        inactiveThumbColor: Colors.grey.shade400,
                        inactiveTrackColor: Colors.grey.shade400,
                      )
                  ),

                ],
              ),

            ],
          ),
        ),
      );
    });
  }
}
