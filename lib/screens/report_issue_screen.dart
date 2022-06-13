import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/util_service.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ReportIssueScreen extends StatefulWidget {
  final String id;
  final String type;
  const ReportIssueScreen({Key? key,required this.id,required this.type}) : super(key: key);

  @override
  _ReportIssueScreenState createState() => _ReportIssueScreenState();
}

class _ReportIssueScreenState extends State<ReportIssueScreen> {
  final reportIssue=TextEditingController();
  final subject=TextEditingController();

  var navigationService = locator<NavigationService>();

  UtilService utilService = locator<UtilService>();

  bool isLoadingProgress=false;


  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(top:23.h),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);

                      },
                      child: Icon(
                        Icons.keyboard_arrow_left_rounded,
                        size: 30.h,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Report Issue",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )

              ],
            ),

          ),
          bottom: PreferredSize(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 50.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(241, 62, 146, 1),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(235, 210, 58, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                        )),
                    width: 50.w,
                    height: 5.h,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(33, 109, 246, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                        )),
                    width: 50.w,
                    height: 5.h,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(52, 239, 70, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                        )),
                    width: 50.w,
                    height: 5.h,
                  ),
                ),
              ],
            ),
            preferredSize: Size.fromHeight(0),
          ),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: width,
                      height: 40.h,
                      child: TextField(
                        controller: subject,

                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric( horizontal: 15.w),
                          hintText: "Subject",
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(154, 183, 208, 1),
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(154, 183, 208, 1),
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(154, 183, 208, 1),
                              ),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Container(
                      width: width,
                      height: height*0.25,
                      child: TextField(
                        controller: reportIssue,
                        scrollPadding: EdgeInsets.all(20.0),
                        keyboardType: TextInputType.multiline,
                        maxLines: 99999,
                        decoration: InputDecoration(
                          //contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.w),
                          hintText: "Write your issue....",
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(154, 183, 208, 1),
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(154, 183, 208, 1),
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(154, 183, 208, 1),
                              ),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),

                  ],
                ),
                ButtonWidget(
                  onpreseed: ()async{

                    if(reportIssue.text.isEmpty){

                      utilService.showToast("Please Complete all Fields");


                    }
                    else{
                      setState(() {
                        isLoadingProgress=true;
                      });
                      await Provider.of<AuthProvider>(context,listen: false).callReport(widget.id,widget.type,reportIssue.text).then((value){
                        print("value $value");

                        if(value=="done"){
                          navigationService.closeScreen();
                        }

                        else{
                          utilService.showToast("Failed to Report Issue");
                        }

                        setState(() {
                          isLoadingProgress=false;
                        });
                      });
                      print("please add files");
                    }


                  },
                  name: "Submit Issue",

                ),
              ],
            ),
            if(isLoadingProgress)
              LoadingWidget()
          ],
        ),
      ) ,
    );
  }
}
