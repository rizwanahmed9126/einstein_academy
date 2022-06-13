import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/providers/subject_provider.dart';
import 'package:einstien_academy_flutter/services/storage_service.dart';
import 'package:einstien_academy_flutter/services/util_service.dart';
import 'package:einstien_academy_flutter/widgets/notification_settings.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/button_widget.dart';
import 'package:einstien_academy_flutter/widgets/column_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String tagId = ' ';
  void active(val) {
    setState(() {
      tagId = val;
    });
  }

  List<Map<String, dynamic>> paymentlist = [
    {
      "id": "1",
      "title": "Material upload notification",
    },
    {
      "id": "2",
      "title": "User following notification",
    },
    {
      "id": "3",
      "title": "Rating notification",
    },
    {
      "id": "4",
      "title": "Instant message notification",
    },
    {
      "id": "5",
      "title": "Message request notification",
    },
    {
      "id": "6",
      "title": "Auto App Update Notification",
    },
  ];
  StorageService storageService = locator<StorageService>();
  // bool? material;
  // bool? following;
  // bool? rating;
  // // List<bool> switchONOFF=[];
  // //
  // getData()async{
  //   material=false; //await storageService.getBoolData("MaterialSwitch")==null?false:await storageService.getBoolData("MaterialSwitch");
  //   following=false;//await storageService.getBoolData("followingSwitch")==null?false:await storageService.getBoolData("followingSwitch");
  //   rating= false;//await storageService.getBoolData("ratingSwitch")==null?false:await storageService.getBoolData("ratingSwitch");
  //
  // }
  @override
  void initState() {
    //getData();
    super.initState();
  }


  var navigationService = locator<NavigationService>();
  final utilService = locator<UtilService>();

  bool _showPasswordOld = false;
  bool _showPasswordNew = false;
  bool _showPasswordConfirm = false;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          child: Container(
            child: Row(
              children: [
                GestureDetector(
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
                  "Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(10.0.h),
        ),
      ),
      backgroundColor: Colors.white,
      body: ColumnScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.2,
                  child: Stack(
                    children: [
                      Container(
                        color: Theme.of(context).primaryColor,
                        height: 120.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 120.h),
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
                      ),
                      Positioned.fill(
                        top: MediaQuery.of(context).size.height * 0.04,
                        child: Container(
                          padding: EdgeInsets.all(15.r),
                          child: Card(
                            elevation: 8.r,
                            shadowColor: Colors.grey.shade300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0.r),
                              child: Form(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "Change Password",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Center(
                                    child: Container(
                                      width: 280.w,
                                      child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: oldPasswordController,
                                        obscureText: !_showPasswordOld,
                                        autocorrect: true,
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                              154, 183, 208, 1),
                                          fontSize: 12.sp,
                                        ),
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding:
                                              EdgeInsets.symmetric(
                                            vertical: 15.0.h,
                                            horizontal: 15.0.w,
                                          ),
                                          hintText: 'Old Password',
                                          hintStyle: TextStyle(
                                            color: Color.fromRGBO(
                                                154, 183, 208, 1),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          suffixIcon: !_showPasswordOld
                                              ? IconButton(
                                                  icon: Icon(
                                                    Icons.visibility_off,
                                                    size: 15.h,
                                                    color:
                                                        Colors.grey.shade400,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _showPasswordOld = true;
                                                    });
                                                  },
                                                )
                                              : IconButton(
                                                  icon: Icon(
                                                    Icons.visibility,
                                                    size: 15.h,
                                                    color:
                                                        Colors.grey.shade400,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _showPasswordOld = false;
                                                    });
                                                  },
                                                ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  154, 183, 208, 1),
                                              width: 1,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Center(
                                    child: Container(
                                      width: 280.w,
                                      child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: newController,
                                        obscureText: !_showPasswordNew,
                                        autocorrect: true,
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                              154, 183, 208, 1),
                                          fontSize: 12.sp,
                                        ),
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding:
                                              EdgeInsets.symmetric(
                                            vertical: 15.0.h,
                                            horizontal: 15.0.w,
                                          ),
                                          hintText: 'New Password',
                                          hintStyle: TextStyle(
                                            color: Color.fromRGBO(
                                                154, 183, 208, 1),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          suffixIcon: !_showPasswordNew
                                              ? IconButton(
                                                  icon: Icon(
                                                    Icons.visibility_off,
                                                    size: 15.h,
                                                    color:
                                                        Colors.grey.shade400,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _showPasswordNew = true;
                                                    });
                                                  },
                                                )
                                              : IconButton(
                                                  icon: Icon(
                                                    Icons.visibility,
                                                    size: 15.h,
                                                    color:
                                                        Colors.grey.shade400,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _showPasswordNew = false;
                                                    });
                                                  },
                                                ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  154, 183, 208, 1),
                                              width: 1,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Center(
                                    child: Container(
                                      width: 280.w,
                                      child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: confirmPasswordController,
                                        obscureText: !_showPasswordConfirm,
                                        autocorrect: true,
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                              154, 183, 208, 1),
                                          fontSize: 12.sp,
                                        ),
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding:
                                              EdgeInsets.symmetric(
                                            vertical: 15.0.h,
                                            horizontal: 15.0.w,
                                          ),
                                          hintText: 'Confirm Password',
                                          hintStyle: TextStyle(
                                            color: Color.fromRGBO(
                                                154, 183, 208, 1),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          suffixIcon: !_showPasswordConfirm
                                              ? IconButton(
                                                  icon: Icon(
                                                    Icons.visibility_off,
                                                    size: 15.h,
                                                    color:
                                                        Colors.grey.shade400,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _showPasswordConfirm = true;
                                                    });
                                                  },
                                                )
                                              : IconButton(
                                                  icon: Icon(
                                                    Icons.visibility,
                                                    size: 15.h,
                                                    color:
                                                        Colors.grey.shade400,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _showPasswordConfirm = false;
                                                    });
                                                  },
                                                ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  154, 183, 208, 1),
                                              width: 1,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
               Consumer<SubjectProvider>(builder: (context,i,_){
                 return  Card(
                   elevation: 8.r,
                   shadowColor: Colors.grey.shade300,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(5.0),
                   ),
                   margin: EdgeInsets.only(left: 20.r, right: 20.r),
                   child: Container(

                     padding: EdgeInsets.all(20.r),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           "Notification Settings",
                           style: TextStyle(
                               color: Colors.grey,
                               fontSize: 12.sp,
                               fontWeight: FontWeight.bold),
                         ),

                         Container(
                           height: 150.h,
                           width: MediaQuery.of(context).size.width,
                           child: ListView(
                             children: [
                               NotificationSettingsWidget(isSwitched: i.material, name: paymentlist[0]['title'],onChanged: (value){

                                 i.saveMaterial(value);

                               },),
                               NotificationSettingsWidget(isSwitched: i.following, name: paymentlist[1]['title'],onChanged: (value){

                                   i.saveFollowing(value);

                               },),
                               NotificationSettingsWidget(isSwitched: i.rating, name: paymentlist[2]['title'],onChanged: (value){
                                   i.saveRating(value);
                               },),

                             ],
                           ),
                         )
                       ],
                     ),
                   ),
                 );
               }),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
            Center(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20.0, right: 20.w, bottom: 15.h),
                child: ButtonWidget(
                  onpreseed: (){
                    if(oldPasswordController.text.isNotEmpty || newController.text.isNotEmpty || confirmPasswordController.text.isNotEmpty){
                      if(newController.text!=confirmPasswordController.text){

                        utilService.showToast("New and Confirm password should be same");
                      }
                      else{
                        Provider.of<AuthProvider>(context,listen: false).callChangePassword(context,newController.text, oldPasswordController.text).then((value){
                          print("this is the value$value");
                          if(value["status"]=="success"){
                            utilService.showToast("${value["message"]}");
                            Navigator.pop(context);
                          }
                          else if(value["status"]=="error"){
                            utilService.showToast("${value["message"]}");
                          }

                        });
                      }
                    }
                    else{

                      Provider.of<AuthProvider>(context,listen: false).callNotificationSetting(context);

                    }

                  },
                  name: 'Update Settings',

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
