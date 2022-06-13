import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/util_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/button_widget.dart';
import 'package:einstien_academy_flutter/widgets/csc_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var navigationService = locator<NavigationService>();

  UtilService utilService = locator<UtilService>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  String? countryValue;
  String? stateValue;
  String? cityValue;
  final key = GlobalKey();
  final ImagePicker _picker = ImagePicker();

  XFile? _image;
  Future getImagefromcamera() async {
    var image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      print(_image!.path);
    });

  }

  Future getImagefromGallery() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;

      print('file path----${_image!.path}');
    });

  }
  String? imgUrl;


  @override
  void initState() {
    firstnameController = TextEditingController(text: "${Provider.of<AuthProvider>(context,listen: false).user!.name}");
    schoolController = TextEditingController(text: "${Provider.of<AuthProvider>(context,listen: false).user!.institueName}");
    numberController = TextEditingController(text: "${Provider.of<AuthProvider>(context,listen: false).user!.phoneNumber}");
    countryValue="${Provider.of<AuthProvider>(context,listen: false).user!.country}";
    imgUrl="${Provider.of<AuthProvider>(context,listen: false).user!.profileImg}";


    super.initState();
  }

  bool isLoading = false;
  //TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return AbsorbPointer(
        absorbing: isLoading,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).primaryColor,
            bottom: PreferredSize(
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
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
                          "Edit Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Container(
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
                                  )
                              ),
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
                                  )
                              ),
                              width: 50.w,
                              height: 5.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(20.0.h),
            ),
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 35.w, right: 35.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          _settingModalBottomSheet(context);
                        },
                        child: _image!=null?
                            ClipRRect(
                              borderRadius:BorderRadius.circular(50),
                              child: Image.file(
                                  File(_image!.path),
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ):
                        imgUrl!=null || imgUrl!="null"?
                            
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: FadeInImage(

                            image: NetworkImage("${imgUrl!}",),
                            placeholder: AssetImage("assets/images/placeHolder.png"),
                            imageErrorBuilder: (context,i,error)=>Image.asset("assets/images/placeHolder.png",height: 53,width: 53,fit: BoxFit.cover,),
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        )
                        :ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset("assets/images/placeHolder.png",height: 53,width: 53,fit: BoxFit.cover,)
                        ),


                        // CircleAvatar(
                        //   radius: 55.r,
                        //   backgroundColor: Colors.blue.shade700.withOpacity(0.2),
                        //   child: CircleAvatar(
                        //     radius: 49.r,
                        //     backgroundColor: Colors.transparent,
                        //     backgroundImage: AssetImage(
                        //       "assets/images/001.jpeg",
                        //     ),
                        //   ),
                        // ),
                      ),
                      Form(
                        key: key,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20.h),
                            Container(
                              width: 400.w,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: firstnameController,
                                autocorrect: true,
                                style: TextStyle(
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                  fontSize: 12,
                                ),
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                    horizontal: 20,
                                  ),
                                  hintText: 'Enter Name',
                                  hintStyle: TextStyle(
                                    color: Color.fromRGBO(154, 183, 208, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(154, 183, 208, 1),
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 15.h,
                            // ),
                            // Container(
                            //   width: 400.w,
                            //   child: TextFormField(
                            //     keyboardType: TextInputType.text,
                            //     controller: schoolController,
                            //     autocorrect: true,
                            //     style: TextStyle(
                            //       color: Color.fromRGBO(154, 183, 208, 1),
                            //       fontSize: 12,
                            //     ),
                            //     decoration: InputDecoration(
                            //       isDense: true,
                            //       contentPadding: EdgeInsets.symmetric(
                            //         vertical: 15.0,
                            //         horizontal: 20,
                            //       ),
                            //       hintText: 'Institute Name (Optional)',
                            //       hintStyle: TextStyle(
                            //         color: Color.fromRGBO(154, 183, 208, 1),
                            //         fontWeight: FontWeight.w500,
                            //         fontSize: 12,
                            //       ),
                            //       filled: true,
                            //       fillColor: Colors.white,
                            //       enabledBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(5.r),
                            //         borderSide: BorderSide(
                            //           color: Color.fromRGBO(154, 183, 208, 1),
                            //           width: 1,
                            //         ),
                            //       ),
                            //       focusedBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(5.r),
                            //         borderSide: BorderSide(
                            //           color: Theme.of(context).primaryColor,
                            //           width: 1,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 15.h,
                            // ),
                            // Container(
                            //   width: 500,
                            //   child: TextFormField(
                            //     keyboardType: TextInputType.emailAddress,
                            //     controller: emailController,
                            //     autocorrect: true,
                            //     style: TextStyle(
                            //       color: Color.fromRGBO(154, 183, 208, 1),
                            //       fontSize: 12,
                            //     ),
                            //     decoration: InputDecoration(
                            //       isDense: true,
                            //       contentPadding: const EdgeInsets.symmetric(
                            //         vertical: 15.0,
                            //         horizontal: 20,
                            //       ),
                            //       hintText: 'Email Address',
                            //       hintStyle: TextStyle(
                            //         color: Color.fromRGBO(154, 183, 208, 1),
                            //         fontWeight: FontWeight.w500,
                            //         fontSize: 12,
                            //       ),
                            //       filled: true,
                            //       fillColor: Colors.white,
                            //       enabledBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(5.r),
                            //         borderSide: BorderSide(
                            //           color: Color.fromRGBO(154, 183, 208, 1),
                            //           width: 1,
                            //         ),
                            //       ),
                            //       focusedBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(5.r),
                            //         borderSide: BorderSide(
                            //           color: Theme.of(context).primaryColor,
                            //           width: 1,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // ),
                            SizedBox(
                              height: 15.h,
                            ),
                            // Container(
                            //   width: 400.w,
                            //   child: TextFormField(
                            //     keyboardType: TextInputType.text,
                            //     controller: passwordController,
                            //     obscureText: !_showPassword,
                            //     autocorrect: true,
                            //     style: TextStyle(
                            //       color: Color.fromRGBO(154, 183, 208, 1),
                            //       fontSize: 12,
                            //     ),
                            //     decoration: InputDecoration(
                            //       isDense: true,
                            //       contentPadding: EdgeInsets.symmetric(
                            //         vertical: 15.0,
                            //         horizontal: 20,
                            //       ),
                            //       hintText: '***********',
                            //       hintStyle: TextStyle(
                            //         color: Color.fromRGBO(154, 183, 208, 1),
                            //         fontWeight: FontWeight.w500,
                            //         fontSize: 12,
                            //       ),
                            //       filled: true,
                            //       fillColor: Colors.white,
                            //       suffixIcon: !_showPassword
                            //           ? IconButton(
                            //               icon: Icon(
                            //                 Icons.visibility_off,
                            //                 size: 15,
                            //                 color: Colors.grey.shade400,
                            //               ),
                            //               onPressed: () {
                            //                 setState(() {
                            //                   _showPassword = true;
                            //                 });
                            //               },
                            //             )
                            //           : IconButton(
                            //               icon: Icon(
                            //                 Icons.visibility,
                            //                 size: 15,
                            //                 color: Colors.grey.shade400,
                            //               ),
                            //               onPressed: () {
                            //                 setState(() {
                            //                   _showPassword = false;
                            //                 });
                            //               },
                            //             ),
                            //       enabledBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(5.r),
                            //         borderSide: BorderSide(
                            //           color: Color.fromRGBO(154, 183, 208, 1),
                            //           width: 1,
                            //         ),
                            //       ),
                            //       focusedBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(5.r),
                            //         borderSide: BorderSide(
                            //           color: Theme.of(context).primaryColor,
                            //           width: 1,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 15.h,
                            // ),

                            Container(
                              width: 400.w,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: numberController,
                                autocorrect: true,
                                style: TextStyle(
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                  fontSize: 12,
                                ),
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                    horizontal: 20,
                                  ),
                                  hintText: 'Phone Number',
                                  hintStyle: TextStyle(
                                    color: Color.fromRGBO(154, 183, 208, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(154, 183, 208, 1),
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                           //  Provider.of<AuthProvider>(context,listen: false).user!.gradeId==null || Provider.of<AuthProvider>(context,listen: false).user!.gradeId=="null" ?
                           //  Container(
                           //    alignment: Alignment.centerLeft,
                           //    child: Wrap(
                           //      alignment: WrapAlignment.start,
                           //      spacing: 7,
                           //      children: [
                           //        for (var j = 0; j < getSubjectata!.length; j++)
                           //          Chip(
                           //            shape: RoundedRectangleBorder(
                           //                borderRadius:
                           //                BorderRadius.only(
                           //                    topRight: Radius
                           //                        .circular(0),
                           //                    bottomRight:
                           //                    Radius.circular(
                           //                        0))),
                           //            deleteIcon: Icon(
                           //              Icons.close,
                           //              color: Color.fromRGBO(
                           //                  182, 189, 203, 1),
                           //              size: 15,
                           //            ),
                           //            backgroundColor: Color.fromRGBO(
                           //                242, 243, 245, 1),
                           //            label: Text(
                           //              getSubjectata![j].toString(),
                           //              style: TextStyle(
                           //                color: Colors.black,
                           //                // fontWeight: FontWeight.bold,
                           //              ),
                           //            ),
                           //            onDeleted: () {
                           //              setState(() {
                           //                // ignore: unnecessary_statements
                           //                removeData(getSubjectata![j]);
                           //              });
                           //            },
                           //          ),
                           //      ],
                           //    ),
                           //  )
                           //
                           // :
                            Container(
                              width: 400.w,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: schoolController,
                                autocorrect: true,
                                style: TextStyle(
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                  fontSize: 12,
                                ),
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0,
                                    horizontal: 20,
                                  ),
                                  hintText: 'Institute Name',
                                  hintStyle: TextStyle(
                                    color: Color.fromRGBO(154, 183, 208, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(154, 183, 208, 1),
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),


                            CSPickerWidget(
                              showStates: true,
                              showCities: true,
                              selectedCountry: countryValue,




                              dropdownDecoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.r),
                                ),
                              ),
                              disabledDropdownDecoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Colors.white),
                              selectedItemStyle: TextStyle(
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                              dropdownItemStyle: TextStyle(
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              dropdownDialogRadius: 5.0,
                              searchBarRadius: 5.0,

                              onCountryChanged: (value) {
                                setState(() {
                                  countryValue = value;
                                });
                              },
                              onStateChanged: (value) {
                                setState(() {
                                  stateValue = value;
                                });
                              },
                              onCityChanged: (value) {
                                setState(() {
                                  cityValue = value;
                                });
                              },

                            ),


                            SizedBox(
                              height: 15.h,
                            ),
                            ButtonWidget(
                              onpreseed: (){
                                if(firstnameController.text.isEmpty || numberController.text.isEmpty || schoolController.text.isEmpty ){
                                  utilService.showToast("The Field can't be empty");
                                  return;
                                }


                                if(_image!=null){
                                  setState(() {
                                    isLoading=true;
                                  });
                                  Provider.of<AuthProvider>(context,listen: false).callUpdateProfilePic(_image!.path).then((value){
                                    Provider.of<AuthProvider>(context,listen: false).callUpdateProfileData(context,firstnameController.text,numberController.text,schoolController.text,countryValue!).then((value){
                                      setState(() {
                                        isLoading=false;
                                      });
                                      if(value=="fail"){
                                        utilService.showToast("Fail to updated data");


                                      }
                                      else{
                                        utilService.showToast("Profile updated successfully");
                                      }
                                    });
                                  });
                                }


                                else{
                                  setState(() {
                                    isLoading=true;
                                  });
                                  Provider.of<AuthProvider>(context,listen: false).callUpdateProfileData(context,firstnameController.text,numberController.text,schoolController.text,countryValue!).then((value){
                                    setState(() {
                                      isLoading=false;
                                    });
                                    if(value=="fail"){
                                      utilService.showToast("Fail to updated data");


                                    }
                                    else{
                                      utilService.showToast("Profile updated successfully");
                                    }
                                  });
                                }



                              },
                              name: "Update Profile",

                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20.h,
                      ),
                      // Container(
                      //   // ignore: deprecated_member_use
                      //   child: RaisedButton(
                      //     highlightElevation: 3.0,
                      //     elevation: 3.0,
                      //     onPressed: () {
                      //       // navigationService.navigateTo(LoginScreenRoute);
                      //     },
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(5.0),
                      //     ),
                      //     padding: EdgeInsets.all(0.0),
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //         color: Theme.of(context).primaryColor,
                      //         borderRadius: BorderRadius.circular(
                      //           5.0,
                      //         ),
                      //       ),
                      //       constraints: BoxConstraints(
                      //         maxWidth: 300.w,
                      //         minHeight: 45.h,
                      //       ),
                      //       alignment: Alignment.center,
                      //       child: Text(
                      //         "Update Profile",
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //             fontSize: 14.sp,
                      //             fontWeight: FontWeight.w700,
                      //             color: Colors.white),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),

                if(isLoading)
                  Positioned.fill(child: LoadingWidget())
              ],
            ),
          ),
        ),
      );
    });
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            height: 200.h,
            child: new Wrap(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Theme.of(context).primaryColor,
                  ),
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text("   Upload Profile Picture",
                            //'Upload Profile Picture',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Row(
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
                    ],
                  ),
                ),
                Container(
                  height: 15,
                ),
                new ListTile(
                  leading: Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: (Alignment.bottomCenter),
                            end: (Alignment.bottomLeft),
                            colors: [
                              Colors.purple,
                              Colors.purpleAccent,
                            ])),
                    child: new Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                  ),
                  title: new Text("Take Photo",
                      // 'Take Photo',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  onTap: () {
                    getImagefromcamera();

                    Navigator.of(context).pop();
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 15),
                  child: new ListTile(
                    leading: Container(
                      margin: EdgeInsets.only(top: 3.h),
                      height: 60.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: (Alignment.bottomCenter),
                              end: (Alignment.bottomLeft),
                              colors: [
                                Colors.pink,
                                Colors.pinkAccent,
                              ])),
                      child: new Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                    ),
                    title: new Text("Browse",
                        // 'Browse',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onTap: () {
                      getImagefromGallery();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
