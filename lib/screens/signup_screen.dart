import 'dart:io';

import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/providers/subject_provider.dart';
import 'package:einstien_academy_flutter/screens/otp_screen.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/util_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/button_widget.dart';
import 'package:einstien_academy_flutter/widgets/column_scroll_view.dart';
import 'package:einstien_academy_flutter/widgets/csc_picker_widget.dart';
import 'package:einstien_academy_flutter/widgets/select_subject_dialouge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
//import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

import 'global.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _focusNode = FocusNode();
  UtilService? utilService = locator<UtilService>();
  String? valuechoose;

  bool isLoadingProgress = false;
  String? countryValue;
  String? stateValue;
  String? cityValue;
  final key = GlobalKey();
  bool _showPassword = false;
  bool _showPassword1 = false;
  Country? _selectedDialogCountry =
      CountryPickerUtils.getCountryByIsoCode('AE');
  var phoneCode = '971';
  var navigationService = locator<NavigationService>();
  bool checkbox1 = false;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController instutenameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController phoneNumberContoller = TextEditingController();

  List? getSubjectata = [];
  List? getSubjectataCopy = [];
  List? getGradeata = [];

  void getSubjectData(String value) {
    setState(() {
      getSubjectata = Provider.of<SubjectProvider>(context, listen: false).getSubject;
    });
  }

  void removeData(var subject) {
    Provider.of<SubjectProvider>(context, listen: false).removeLanguages(subject);
    setState(() {
      getSubjectata = Provider.of<SubjectProvider>(context, listen: false).getSubject;
    });
  }
  bool? noData;


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

  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }



  @override
  void initState() {
    Provider.of<SubjectProvider>(context, listen: false).fetchAllSubject().then((value){
      if(value=="fail"){
        setState(() {
          noData=true;
        });
      }else{
        getGradeata = Provider.of<SubjectProvider>(context, listen: false).getGradeApi;
      }

    });



    super.initState();
  }

  bool validateMobile(String value) {
    String patttern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    RegExp regExp = new RegExp(patttern);
    print(!regExp. hasMatch(value));
     if (!regExp.hasMatch(value)) {
      return true;
    }
   else{
     return false;
     }
  }

  String completePhoneNumber="";

  // final TextEditingController controller = TextEditingController();
  // String initialCountry = 'NG';
  // PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.only(right: 30.w, left: 30.w),
                  child: Text(
                    "Enter your detail & lets get started",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        height: 1.5.h,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 50.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(241, 62, 146, 1),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                bottomRight: Radius.circular(40),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(235, 210, 58, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                                bottomRight: Radius.circular(40),
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
              ],
            ),
          ),
          preferredSize: Size.fromHeight(55.0.h),
        ),
      ),
      body: Consumer<SubjectProvider>(
        builder: (context,i,_){
          return noData==null? i.subject.isNotEmpty? SafeArea(
            child: ColumnScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    child: Form(
                      key: key,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: () {
                              _settingModalBottomSheet(context);
                            },
                            child: _image!=null? ClipRRect(
                              borderRadius:BorderRadius.circular(50),
                              child: Image.file(
                                File(_image!.path),
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ):
                            CircleAvatar(
                              radius: 40.r,
                              backgroundColor: Color.fromRGBO(154, 183, 208, 1),
                              child: CircleAvatar(
                                  radius: 20.r,
                                  backgroundColor: Colors.transparent,
                                  child: Image(
                                    image: AssetImage(
                                      "assets/images/image.png",
                                    ),
                                    color: Colors.white,
                                  )),
                            ),
                          ),
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
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            width: 400.w,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: instutenameController,
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
                                hintText: 'Institute Name (Optional)',
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
                          Container(
                            width: 500,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
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
                                hintText: 'Email Address',
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
                          // ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            width: 400.w,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                              obscureText: !_showPassword,
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
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                // suffixIcon: !_showPassword
                                //     ? IconButton(
                                //         icon: Icon(
                                //           Icons.visibility_off,
                                //           size: 15,
                                //           color: Colors.grey.shade400,
                                //         ),
                                //         onPressed: () {
                                //           setState(() {
                                //             _showPassword = true;
                                //           });
                                //         },
                                //       )
                                //     : IconButton(
                                //         icon: Icon(
                                //           Icons.visibility,
                                //           size: 15,
                                //           color: Colors.grey.shade400,
                                //         ),
                                //         onPressed: () {
                                //           setState(() {
                                //             _showPassword = false;
                                //           });
                                //         },
                                //       ),
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
                          Container(
                            width: 400.w,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: confirmpasswordController,
                              obscureText: !_showPassword1,
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
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                // suffixIcon: !_showPassword1
                                //     ? IconButton(
                                //         icon: Icon(
                                //           Icons.visibility_off,
                                //           size: 15,
                                //           color: Colors.grey.shade400,
                                //         ),
                                //         onPressed: () {
                                //           setState(() {
                                //             _showPassword1 = true;
                                //           });
                                //         },
                                //       )
                                //     : IconButton(
                                //         icon: Icon(
                                //           Icons.visibility,
                                //           size: 15,
                                //           color: Colors.grey.shade400,
                                //         ),
                                //         onPressed: () {
                                //           setState(() {
                                //             _showPassword1 = false;
                                //           });
                                //         },
                                //       ),
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

                          Container(
                            width: 300,

                            child: IntlPhoneField(
                              controller: phoneNumberContoller,

                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
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
                              initialCountryCode: 'AE',

                              onChanged: (phone) {
                                print(phone.completeNumber);
                                completePhoneNumber=phone.completeNumber;
                                print(phoneNumberContoller.text);

                              },
                            ),
                          ),

                          // Container(
                          //   height: 40.h,
                          //   decoration: BoxDecoration(
                          //     border: Border.all(
                          //       color: Color.fromRGBO(154, 183, 208, 1),
                          //     ),
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.circular(5),
                          //   ),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //     children: <Widget>[
                          //       Padding(
                          //         padding: EdgeInsets.only(right: 17.0),
                          //         child: GestureDetector(
                          //           onTap: _openCountryPickerDialog,
                          //           child: Container(
                          //             // child: ListTile(
                          //             // onTap: _openCountryPickerDialog,
                          //             child: _buildDialogItem(
                          //                 _selectedDialogCountry!),
                          //             // ),
                          //           ),
                          //         ),
                          //       ),
                          //       Expanded(
                          //         flex: 2,
                          //         child: TextFormField(
                          //           autocorrect: true,
                          //           style: TextStyle(
                          //             color: Color.fromRGBO(154, 183, 208, 1),
                          //             fontSize: 12,
                          //           ),
                          //           controller: phoneNumberContoller,
                          //           keyboardType: TextInputType.number,
                          //           inputFormatters: <TextInputFormatter>[
                          //             FilteringTextInputFormatter.digitsOnly
                          //           ], // On
                          //           decoration: InputDecoration(
                          //             isDense: true,
                          //             border: InputBorder.none,
                          //             fillColor: Colors.white,
                          //             contentPadding:
                          //             EdgeInsets.fromLTRB(0, 0, 10, 0),
                          //             hintText: 'Phone Number',
                          //             hintStyle: TextStyle(
                          //               color: Color.fromRGBO(154, 183, 208, 1),
                          //               fontWeight: FontWeight.w500,
                          //               fontSize: 12.sp,
                          //             ),
                          //           ),
                          //         ),
                          //         // ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          if (!SelectAccount.isTeacher)
                            SizedBox(
                              height: 15.h,
                            ),
                          if (!SelectAccount.isTeacher)
                            Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color.fromRGBO(154, 183, 208, 1),
                                ),
                              ),
                              child: DropdownButton(
                                elevation: 8,
                                autofocus: false,
                                underline: SizedBox(),
                                hint: Text(
                                  "      Grade",
                                  style: TextStyle(
                                    color: Color.fromRGBO(154, 183, 208, 1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                icon: Padding(
                                  padding: EdgeInsets.only(right: 10.w),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Color.fromRGBO(154, 183, 208, 1),
                                  ),
                                ),
                                iconSize: 20.h,
                                isExpanded: true,
                                value: valuechoose,
                                onChanged: (newValue) {
                                  FocusScope.of(context).requestFocus(_focusNode);
                                  setState(() {
                                    valuechoose = newValue.toString();
                                  });
                                },
                                items: getGradeata!.map((valueitem) {
                                  return DropdownMenuItem(
                                    value: valueitem.id.toString(),
                                    child: Text(
                                      // ignore: unnecessary_brace_in_string_interps
                                      "     ${valueitem.name}",
                                      style: TextStyle(
                                        color: Color.fromRGBO(154, 183, 208, 1),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          if (SelectAccount.isTeacher)
                            SizedBox(
                              height: 15.h,
                            ),
                          if (SelectAccount.isTeacher)
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(194, 199, 211, 1),
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "  Subject",
                                        style: TextStyle(
                                          color: Color.fromRGBO(154, 183, 208, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (_) {
                                                return SelectSubjectPopupDialouge(
                                                  action: getSubjectData,
                                                );
                                              });
                                        },
                                        child: Container(
                                          height: 28,
                                          child: Image.asset(
                                            'assets/images/Add.png',
                                            // color:
                                            //     Theme.of(context).backgroundColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  getSubjectata!.isEmpty
                                      ? Container()
                                      : Container(
                                    alignment: Alignment.centerLeft,
                                    child: Wrap(
                                      alignment: WrapAlignment.start,
                                      spacing: 7,
                                      children: [
                                        for (var j = 0; j < getSubjectata!.length; j++)
                                          Chip(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.only(
                                                    topRight: Radius
                                                        .circular(0),
                                                    bottomRight:
                                                    Radius.circular(
                                                        0))),
                                            deleteIcon: Icon(
                                              Icons.close,
                                              color: Color.fromRGBO(
                                                  182, 189, 203, 1),
                                              size: 15,
                                            ),
                                            backgroundColor: Color.fromRGBO(
                                                242, 243, 245, 1),
                                            label: Text(
                                              getSubjectata![j].toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            onDeleted: () {
                                              setState(() {
                                                // ignore: unnecessary_statements
                                                removeData(getSubjectata![j]);
                                              });
                                            },
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          SizedBox(
                            height: 15.h,
                          ),


                          CSPickerWidget1(
                            flagState: CountryFlag.DISABLE,
                            showStates: true,
                            showCities: true,
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
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                            dropdownItemStyle: TextStyle(
                                color: Color.fromRGBO(154, 183, 208, 1),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
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

                          Container(
                              width: 400.w,
                              height: 40.h,
                              child: ElevatedButton(
                                onPressed: () async {
                                  bool isEmailValidated=validateEmail(emailController.text);
                                  print(completePhoneNumber);
                                 bool value= validateMobile(phoneNumberContoller.text);
                                 print(value);


                                  if (firstnameController.text == "" || emailController.text == "" || phoneNumberContoller.text == "" || passwordController.text == "" || confirmpasswordController.text == "") {
                                    utilService!.showToast("Please fill all fields");
                                  } else if (!isEmailValidated) {
                                    utilService!.showToast("Please Enter a valid Email");
                                  } else if (!emailController.text.contains('@')) {
                                    utilService!.showToast("Please Enter a valid Email");
                                  } else if (passwordController.text != confirmpasswordController.text) {
                                    utilService!.showToast("Password not match");
                                  } else if (passwordController.text.length < 8) {
                                    utilService!.showToast(' Password must be of 8 characters');
                                  } else if (countryValue ==null){
                                    utilService!.showToast(' Please select country');
                                  }
                                  else if (value){
                                    utilService!.showToast(' Please Enter correct phone Number');
                                  }
                                  else{
                                    if(SelectAccount.isTeacher){
                                      if (Provider.of<SubjectProvider>(context,listen: false).subjectID.isEmpty){
                                        utilService!.showToast(' Please add subjects');
                                      }
                                      else{
                                        showLoadingAnimation(context);
                                        await Provider.of<AuthProvider>(context, listen: false).createTeacher(
                                          name: firstnameController.text,
                                          instituteName: instutenameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          profileImg:_image!=null ?_image!.path:null,
                                          phoneNumber:completePhoneNumber, //phoneNumberContoller.text,
                                          subjects: Provider.of<SubjectProvider>(context,listen: false).subjectID,
                                          country: countryValue,
                                          type: 1,
                                        ).then((response) {
                                          print(response);
                                          navigationService.closeScreen();
                                          navigationService.navigateReplace(OtpScreenRoute);
                                        });
                                      }
                                    }
                                    else{
                                      if(valuechoose==null){
                                        utilService!.showToast(' Please choose grade');
                                      }else{
                                        showLoadingAnimation(context);
                                        await Provider.of<AuthProvider>(context, listen: false).createStudent(
                                          name: firstnameController.text,
                                          instituteName: instutenameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          phoneNumber:completePhoneNumber, //phoneNumberContoller.text,
                                          profileImg: _image!=null ?_image!.path:null,
                                          grade: valuechoose,
                                          country: countryValue,
                                          type: 0,).then((response) {
                                          navigationService.closeScreen();
                                          print(response);
                                            if(response=="done"){

                                              navigationService.navigateReplace(OtpScreenRoute);
                                            }
                                            else{
                                              utilService!.showToast('$response');
                                            }


                                        });
                                      }
                                    }

                                  }




                                    try {


                                      // FocusScope.of(context).requestFocus(FocusNode());
                                      // !SelectAccount.isTeacher
                                      //     ? await Provider.of<AuthProvider>(context, listen: false).createStudent(
                                      //   name: firstnameController.text,
                                      //   instituteName: instutenameController.text,
                                      //   email: emailController.text,
                                      //   password: passwordController.text,
                                      //   phoneNumber: phoneNumberContoller.text,
                                      //   profileImg: _image!.path,
                                      //   grade: valuechoose,
                                      //   country: countryValue,
                                      //   type: 0,).then((response) {
                                      //   print(response);
                                      //   navigationService.closeScreen();
                                      //   navigationService.navigateReplace(OtpScreenRoute);
                                      // })
                                          //:
                                     // );
                                      // navigationService.closeScreen();
                                      // setState(() {
                                      //   isLoadingProgress = false;
                                      // });
                                    } catch (e) {
                                      utilService!.showToast(e.toString());
                                      // navigationService.closeScreen();
                                      // setState(() {
                                      //   isLoadingProgress = false;
                                      // });
                                    }

                                  // navigationService
                                  //     .navigateTo(AccountVerificationScreenRoute);
                                },
                                child: Text(
                                  "Create Account",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    color: Color.fromRGBO(93, 107, 116, 1),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    navigationService.navigateTo(LoginScreenRoute);
                                  },
                                  child: Text(
                                    ' SignIn',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp),
                                  ),
                                ),
                              ]),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ):LoadingWidget():Center(child: Text("sorry cannot signup at the moment"),);
        },
      )
    );
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
            height: 180.h,
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
                  margin: EdgeInsets.only(top: 10),
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

  Widget _buildDialogItem(Country country) => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(width: 6.0),
          CountryPickerUtils.getDefaultFlagImage(country),
          Icon(
            Icons.arrow_drop_down,
            color: Color.fromRGBO(154, 183, 208, 1),
          ),
          SizedBox(width: 6.0),
          Text(
            "+${country.phoneCode}",
            style: TextStyle(
              color: Color.fromRGBO(154, 183, 208, 1),
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
            // style: TextStyle(fontSize: 10),
          ),
        ],
      );
  Widget _buildDialogItemWithCountry(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 12.0),

          // Text("+${country.phoneCode}"),
          Flexible(
              child: Text(
            country.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color.fromRGBO(154, 183, 208, 1),
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          ))
        ],
      );
  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => CountryPickerDialog(
          // titlePadding: EdgeInsets.all(8.0),
          // searchCursorColor: Colors.pinkAccent,
          searchInputDecoration: InputDecoration(hintText: "Search Country"),
          isSearchable: true,
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: ScreenUtil().setWidth(25),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: ScreenUtil().setHeight(80),
                  child: Image.asset(
                    "assets/images/world.png",
                    // color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              Text(
                "Select Country",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Container(
                width: ScreenUtil().setWidth(40),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Theme.of(context).backgroundColor,
                      width: ScreenUtil().setWidth(2),
                    ),
                  ),
                ),
              ),
            ],
          ),
          onValuePicked: (Country country) => setState(() {
            _selectedDialogCountry = country;
            phoneCode = country.phoneCode;
          }),
          itemBuilder: _buildDialogItemWithCountry,
          // priorityList: [
          //   // CountryPickerUtils.getCountryByIsoCode('UAE'),
          //   CountryPicgit kerUtils.getCountryByIsoCode('AE'),
          // ],
        ),
      );
}
