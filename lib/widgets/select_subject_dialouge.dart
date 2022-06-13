import 'package:einstien_academy_flutter/providers/subject_provider.dart';
import 'package:einstien_academy_flutter/widgets/select_subject_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

class SelectSubjectPopupDialouge extends StatefulWidget {
  ValueChanged<String>? action;

  SelectSubjectPopupDialouge({this.action});
  @override
  _SelectSubjectPopupDialougeState createState() =>
      _SelectSubjectPopupDialougeState();
}

class _SelectSubjectPopupDialougeState
    extends State<SelectSubjectPopupDialouge> {
  // ignore: unused_field
  final GlobalKey<FormState> _formKey = GlobalKey();

  List? subjectData = [];
  var locale;

  @override
  void initState() {
    subjectData = Provider.of<SubjectProvider>(context, listen: false).getSubjectApi;

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
    return AlertDialog(
        contentPadding: EdgeInsets.only(
          bottom: 0,
        ),
        scrollable: true,
        // title:
        content: Container(
          //  height: 400.h,
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          // color: Colors.blue,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Subject",
                            // AppLocalizations.of(context)!
                            //     .translate('language')!,
                            style: TextStyle(
                                fontSize: 17.sp, fontWeight: FontWeight.w700),
                          ),
                          Container(
                            width: 15.w,
                            height: 2.h,
                            color: Theme.of(context).accentColor,
                            margin: EdgeInsets.only(left: 4, top: 4),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 35.w,
                        child: IconButton(
                            onPressed: () {
                              widget.action!("");

                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.add, color: Colors.grey)),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                height: MediaQuery.of(context).size.height *
                    0.43, // Change as per your requirement
                width: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: subjectData!.length,
                  itemBuilder: (BuildContext context, int i) {
                    return SelectSubjectWidget(data: subjectData![i].name,data1: subjectData![i].id,);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
