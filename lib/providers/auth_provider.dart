import 'dart:convert';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:einstien_academy_flutter/models/followers_model.dart';
import 'package:einstien_academy_flutter/models/following_model.dart';
import 'package:einstien_academy_flutter/models/join_zoom_model.dart';
import 'package:einstien_academy_flutter/models/student_profile_model.dart';
import 'package:einstien_academy_flutter/models/teacher_profile_model.dart';
import 'package:einstien_academy_flutter/models/user.dart';
import 'package:einstien_academy_flutter/screens/profile_detail.dart';
import 'package:einstien_academy_flutter/screens/student/home_screen_student.dart';
import 'package:einstien_academy_flutter/screens/teacher/home_screen_teacher.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/http_service.dart';
import '../services/storage_service.dart';
import '../services/util_service.dart';

class AuthProvider with ChangeNotifier {
  NavigationService? navigationService = locator<NavigationService>();
  UtilService? utilService = locator<UtilService>();
  StorageService? storageService = locator<StorageService>();
  HttpService http = locator<HttpService>();

  String? fcmToken;

  String? zoomMeetingStartedID;

  saveZoomMeetingStartedID(String value) {
    zoomMeetingStartedID = value;
    notifyListeners();
  }

  List<ZoomMeetingModel> zoomMeetingData = [];
  FollowingModel? followingsData;
  FollowersModel? followersData;

  bool isLoadingProgress = false;

  ProfileDataModel? profileData;

  String? token;
  String? password;
  String? email;
  String? phoneNumber;
  User? user;
  bool isRemeber = false;

  String followCount = "0";

  saveFollowCount(String value) {
    followCount = value;
    notifyListeners();
  }

  Map<String, dynamic> createBusinessdata = {};
  Map<String, dynamic> updateBusinessdata = {};
  Map<String, dynamic> createInfluencerdata = {};

  get getCreateBusinessProfileData {
    return this.createBusinessdata;
  }

  get getCreateInfluencerProfileData {
    return this.createInfluencerdata;
  }

  User? get users {
    return this.user;
  }

  setuser(User user) {
    this.user = user;
    notifyListeners();
  }

  // setIsRemeber(bool val) async {
  //   await this.storageService!.setBoolData('isRemember', val);
  //   this.isRemeber = val;
  // }
  //
  // Future<bool> getIsRemember() async {
  //   var data = await this.storageService!.getBoolData('isRemember');
  //   return data ?? false;
  // }

  Future<dynamic> createStudent({
    String? name,
    String? instituteName,
    String? email,
    String? password,
    String? phoneNumber,
    String? profileImg,
    String? country,
    String? city,
    int? type,
    String? grade,
  }) async {
    this.password = password;
    this.email = email;
    await storageService!.setData("password", this.password);
    await storageService!.setData("email", this.email);

    FormData formData = FormData.fromMap({
      "name": name,
      "email": email,
      "type": type,
      "password": password,
      "phone_number": phoneNumber,
      "country": country,
      "city": "kabukl",
      "institue_name": instituteName,
      "grade": grade,
    });
    if (profileImg != null) {
      formData.files.addAll([
        MapEntry("profile_img", await MultipartFile.fromFile(profileImg)),
      ]);
    }

    try {
      var response = await http.signUp(formData);
      if (response.statusCode == 200) {
        return "done";
      } else {
        return response.data["data"]["email"][0];
      }
    } catch (e) {
      return "The email has already been taken.";
    }

//futre validation for signup process
  }

  Future createTeacher({
    String? name,
    String? instituteName,
    String? email,
    String? password,
    String? phoneNumber,
    String? profileImg,
    String? country,
    String? city,
    int? type,
    List? subjects,
  }) async {
    this.password = password;
    this.email = email;
    await storageService!.setData("password", this.password);
    await storageService!.setData("email", this.email);
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "email": email,
        "type": type,
        "password": password,
        "phone_number": phoneNumber,
        "country": country,
        "city": "kabukl",
        "institue_name": instituteName,
        "subject[]": subjects,
      });

      if (profileImg != null) {
        formData.files.addAll([
          MapEntry("profile_img", await MultipartFile.fromFile(profileImg)),
        ]);
      }

      return await http.signUp(formData);
      //     {
      //   "name": name,
      //   "email": email,
      //   "type": type,
      //   "password": password,
      //   "profile_img": profileImg,
      //   "phone_number": phoneNumber,
      //   "country": country,
      //   "city": "kabukl",
      //   "institue_name": institueName,
      //   "subjects": subjects,
      // }

      // await user!.sendEmailVerification(); // ye uncommitn ho ga
      // navigationService!.navigateTo(EmailVerificationScreenRoute);
    } catch (err) {
      print(err);
      utilService!.showToast("could not sign up");
    }
  }

  Future<void> signinWithEmailAndPassword(
      {String? email, String? password, BuildContext? context}) async {
    User? userDATA;
    try {
      var accountType = await this.storageService!.getData("AccountType");
      var resp = await http.signIn(context, email: email, password: password);
      print(resp["status"]);
      if (resp["status"] == "success") {
        print("this is the data${resp["data"]["user"]}");
        userDATA = User.fromJson(resp["data"]["user"]);

        if (SelectAccount.isRemember) {
          if (SelectAccount.isTeacher) {
            await storageService!.setData("teacherEmail", email);
            await storageService!.setData("teacherPass", password);
          } else {
            await storageService!.setData("studentEmail", email);
            await storageService!.setData("studentPass", password);
          }
        }

        // var dataIsremember = await storageService!.haveData('isRemember');
        // if (dataIsremember) {
        //   this.isRemeber = await storageService!.getBoolData('isRemember');
        // }

        // if(userDATA.status=="success"){
        this.token = resp["data"]["token"];

        await this.storageService!.setData("token", this.token);

        if (userDATA.type == accountType) {
          if (userDATA != null) {
            setuser(userDATA);
            this.user = userDATA;

            if (this.isRemeber) {
              await this.storageService!.setData("email", this.user!.email);
              await this.storageService!.setData("password", this.password);
              await this
                  .storageService!
                  .setBoolData("rememberMe", this.isRemeber);
            } else {
              await this
                  .storageService!
                  .setBoolData("rememberMe", this.isRemeber);
            }

            this.storageService!.setData("user", this.user);
            this.user!.type == 'STUDENT'
                ? Navigator.push(
                    context!,
                    MaterialPageRoute(
                        builder: (context) => HomeScreenStudent()))
                : Navigator.push(
                    context!,
                    MaterialPageRoute(
                        builder: (context) => HomeScreenTeacher()));
          } else {
            navigationService!.navigateTo(OtpScreenRoute);
            return;
          }
        } else {
          utilService!.showToast("Please Enter $accountType account");
        }

        // }
        // else{
        //   utilService!.showToast("Please Enter correct email and Password");
        // }

      } else {
        utilService!.showToast("Please Enter correct email and Password");
      }
    } catch (err) {
      utilService!.showToast("Please Enter a Valid Email and Password");
    }
  }

  Future<Response> otpVerification({
    String? otp,
    String? email,
    String? password,
  }) async {
    var response = await http.otpVerification({
      "email": email,
      "password": password,
      "otp_code": otp,
      "device_token":"${fcmToken}",
    });
    print(response.data);
    return response;
  }

  Future<Response> resendOtp({
    String? email,
  }) async {
    Response response = await http.resendOtp({
      "email": email,
    });
    return response;
  }

  Future<dynamic> callRating(String type, String rating, String id) async {
    var response = await http.rating(type, rating, id);
    if (response.statusCode == 200) {
      print("rating success");
    }
  }

  Future<dynamic> callUpdateProfileData(context, String name, String phnNumber,
      String institute, String country) async {
    try {
      var response =
          await http.updateProfileData(name, phnNumber, country, institute);
      User? userDATA;

      if (response.statusCode == 200) {
        if (response.data["status"] == "success") {
          print(response.data["status"]);
          userDATA = User.fromJson(response.data["data"]);
          setuser(userDATA);
          this.storageService!.setData("user", userDATA);
          Provider.of<AuthProvider>(context, listen: false)
              .callUserProfile(userDATA.id.toString());
          // String id=i.user!.id.toString();
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileDetailScreen(id: userDATA!.id.toString(),)));

          navigationService!.closeScreen();
          return "done";
        } else {
          return "fail";
        }
      } else {
        return "fail";
      }
    } catch (e) {
      print(e);
      return "fail";
    }
  }

  Future<dynamic> callUpdateProfilePic(String img) async {
    try {
      var response = await http.updateProfilePic(img);

      if (response.statusCode == 200) {
        if (response.data["status"] == "success") {
          return "done";
        } else {
          return "fail";
        }
      } else {
        return "fail";
      }
    } catch (e) {
      print(e);
      return "fail";
    }
  }

  Future<dynamic> callStartZoomMeeting(
      {required String title,
      required String desc,
      required String dateTime,
      required String userID,
      required String img}) async {
    try {
      var response =
          await http.startZoomMeeting(title, desc, dateTime, userID, img);

      if (response.statusCode == 200) {
        if (response.data["status"] == "success") {
          saveZoomMeetingStartedID(response.data["data"]["id"].toString());
          //zoomMeetingStartedID="${response.data["data"]["id"]}";

          return "done";
        } else {
          return "fail";
        }
      } else {
        return "fail";
      }
    } catch (e) {
      print(e);
      return "fail";
    }
  }

  Future<dynamic> callUpdateStartZoomMeeting(
      {required String id,
      required String pass,
      required String meetingID}) async {
    try {
      var response = await http.updateStartZoomMeeting(meetingID, pass, id);

      if (response.statusCode == 200) {
        if (response.data["status"] == "success") {
          return "done";
        } else {
          return "fail";
        }
      } else {
        return "fail";
      }
    } catch (e) {
      print(e);
      return "fail";
    }
  }

  Future<dynamic> callGetZoomMeetingData() async {
    try {
      var response = await http.getZoomMeetingData();
      if (response.statusCode == 200) {
        zoomMeetingData.clear();
        for (var abc in response.data["data"]) {
          saveZoomMeetingData(ZoomMeetingModel.fromJson(abc));
        }
        print(zoomMeetingData.length);
        if (zoomMeetingData.length < 1) {
          return "noData";
        }
      }
      return "done";
    } catch (e) {
      print("zoom meeting data error: $e");
      return "noData";
    }
  }

  Future<dynamic> callEndZoomMeeting(String id) async {
    try {
      var response = await http.endZoomMeeting(id);

      if (response.statusCode == 200) {
        if (response.data["status"] == "success") {
          return "done";
        } else {
          return "fail";
        }
      } else {
        return "fail";
      }
    } catch (e) {
      print(e);
      return "fail";
    }
  }

  Future<dynamic> callFollowCount() async {
    try {
      var response = await http.followCount();

      if (response.statusCode == 200) {
        if (response.data["status"] == "success") {
          print("follow-count${response.data["data"].toString()}");
          saveFollowCount(response.data["data"].toString());

          return "done";
        } else {
          return "fail";
        }
      } else {
        return "fail";
      }
    } catch (e) {
      print(e);
      return "fail";
    }
  }

  Future<dynamic> callUserProfile(String id) async {
    try {
      var response = await http.getUserProfile(id);

      if (response.statusCode == 200) {
        if (response.data["status"] == "success") {
          // if(type=="TEACHER"){
          saveStudentProfileData(
              ProfileDataModel.fromJson(response.data["data"]));
          // }else{
          //   saveStudentProfileData(StudentProfileDataModel.fromJson(response.data["data"]));
          // }
          print(profileData!.type);
          print(profileData!.userFollowing);
          print(profileData!.userFollow);

          return "done";
        } else {
          return "fail";
        }
      } else {
        return "fail";
      }
    } catch (e) {
      print(e);
      return "fail";
    }
  }

  Future<dynamic> callGetFollowings(String id) async {
    try {
      var response = await http.getFollowings(id);

      if (response.statusCode == 200) {
        // if(response.data["status"]=="success") {
        print("this data${response.data[0]}");
        print("this data${response.data[0]}");

        saveFollowingsData(FollowingModel.fromJson(response.data[0]));

        if (followingsData!.followings.length < 1) {
          return "noData";
        }

        return "done";
      } else {
        return "noData";
      }
    } catch (e) {
      print(e);
      return "noData";
    }
  }

  Future<dynamic> callGetFollowers(String id) async {
    try {
      var response = await http.getFollowers(id);

      if (response.statusCode == 200) {
        // if(response.data["status"]=="success") {
        print("this data${response.data[0]}");
        print("this data${response.data[0]}");

        saveFollowersData(FollowersModel.fromJson(response.data[0]));

        if (followersData!.followers.length < 1) {
          return "noData";
        }

        return "done";
      } else {
        return "noData";
      }
    } catch (e) {
      print(e);
      return "noData";
    }
  }

  Future<dynamic> callFollowUnFollow(String id) async {
    try {
      var response = await http.followUnFollow(id);

      if (response.statusCode == 200) {
        if (response.data["status"] == "success") {
          return "done";
        } else {
          return "fail";
        }
      } else {
        return "fail";
      }
    } catch (e) {
      print(e);
      return "fail";
    }
  }

  Future<dynamic> callRemoveFollow(String id) async {
    try {
      var response = await http.removeFollow(id);
      print(response.data);

      if (response.statusCode == 200) {
        if (response.data["status"] == "success") {
          return "done";
        } else {
          return "fail";
        }
      } else {
        return "fail";
      }
    } catch (e) {
      print(e);
      return "fail";
    }
  }

  Future<dynamic> callReport(String id, String type, String remarks) async {
    try {
      var response = await http.report(id, type, remarks);

      if (response.statusCode == 200) {
        if (response.data["status"] == "success") {
          return "done";
        } else {
          return "fail";
        }
      } else {
        return "fail";
      }
    } catch (e) {
      print(e);
      return "fail";
    }
  }

  Future<dynamic> callChangePassword(
      context, String newPass, String oldPass) async {
    try {
      var response = await http.changePassword(newPass, oldPass);
      print(response);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      return "fail";
    }
  }

  Future<dynamic> callNotificationSetting(context) async {
    try {
      var response = await http.notificationSetting(context);
      print(response);
      if (response.statusCode == 200) {
        print("notification${response.data}");
        return response.data;
      }
    } catch (e) {
      return "fail";
    }
  }

  Future<dynamic> callForGotPasswordSendOTP(String email) async {
    try {
      var response = await http.forGotPasswordSendOTP(email);
      print(response);
      if (response.statusCode == 200) {
        if (response.data["status"] == "success") {
          return "done";
        } else {
          return "fail";
        }
      }
    } catch (e) {
      return "fail";
    }
  }

  Future<dynamic> callForgotPassword(
      String email, String password, String otp) async {
    try {
      var response = await http.forgotPassword(email, password, otp);
      print(response);
      if (response.statusCode == 200) {
        if (response.data["status"] == "success") {
          return "done";
        } else {
          return "fail";
        }
      }
    } catch (e) {
      return "fail";
    }
  }

  Future<dynamic> callLogout(context) async {
    try {
      var response = await http.logOut(context);
      print(response);
      if (response.statusCode == 200) {
        if (response.data["status"] == "success") {
          return "done";
        } else {
          return "fail";
        }
      }
    } catch (e) {
      return "fail";
    }
  }

  saveZoomMeetingData(ZoomMeetingModel value) {
    zoomMeetingData.add(value);
    notifyListeners();
  }

  // saveTeacherProfileData(TeacherProfileDataModel value){
  //   teacherProfileData=value;
  //   notifyListeners();
  // }

  saveStudentProfileData(ProfileDataModel value) {
    profileData = value;
    notifyListeners();
  }

  saveFollowingsData(FollowingModel value) {
    followingsData = value;
    notifyListeners();
  }

  saveFollowersData(FollowersModel value) {
    followersData = value;
    notifyListeners();
  }

  saveFcmToken(String value) {
    fcmToken = value;
    notifyListeners();
  }
}

class SelectAccount {
  static bool isTeacher = false;
  static bool isRemember = false;
}
