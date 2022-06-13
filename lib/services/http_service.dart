import 'package:dio/dio.dart';
import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/providers/subject_provider.dart';

import 'package:einstien_academy_flutter/services/storage_service.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:file_picker/file_picker.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HttpService {
  Dio _dio = Dio(); //builtin
  StorageService storage = locator<StorageService>();
  //final baseUrl = "https://demo.techstirr.com/einsteinacademy/public/api/";
  final baseUrl = "https://einsteins-academy.com/einsteinacademy/public/api/";

  Future<Dio> getApiClient() async {
    try {
      var token = await storage.getData("token");
      print(token);
      _dio.interceptors.clear();
      _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, interceptorHandler) {
          // Do something before request is sent
          options.headers["Authorization"] = "Bearer " + token.toString();
          return interceptorHandler.next(options);
          // ignore: non_constant_identifier_names
        },
        onResponse: (response, interceptorHandler) {
          // Do something with response data
          return interceptorHandler.next(response); // continue
          // ignore: non_constant_identifier_names
        },
        onError: (error, interceptorHandler) async {
          // Do something with response error
          if (error.response?.statusCode == 403 ||
              error.response?.statusCode == 401) {
            _dio.interceptors.requestLock.lock();
            _dio.interceptors.responseLock.lock();
            // ignore: unused_local_variable
            RequestOptions options = error.response!.requestOptions;
            // ignore: unused_local_variable
            Options? opt;
            // var user = FirebaseAuth.instance.currentUser!;
            // token = await user.getIdToken(true);
            await storage.setData("token", token);
            options.headers["Authorization"] = "Bearer " + token.toString();

            _dio.interceptors.requestLock.unlock();
            _dio.interceptors.responseLock.unlock();
            //  return _dio.request(options.path, options: opt);
          } else {
            return interceptorHandler.next(error);
          }
        },
      ));
      //  _dio.options.baseUrl = baseUrl;
    } catch (err) {
      print(err);
    }

    return _dio;
  }

  registerDevice(Map<String, dynamic> data) async {
    var http = await getApiClient();
    var response = await http.post(baseUrl + 'user/device', data: data);
    return response;
  }

  unRegisterDevice(Map<String, dynamic> data) async {
    var http = await getApiClient();
    var response = await http.post(baseUrl + "user/device", data: data);
    return response;
  }

  signUp(FormData formData) async {
    var http = await getApiClient();
    return await http.post(baseUrl + "signup", data: formData);
  }

  Future signIn(
    context, {
    String? email,
    String? password,
  }) async {
    var http = await getApiClient();
    var response = await http.post(baseUrl + 'signin', data: {
      "email": email,
      "password": password,
      "device_token":
         "${Provider.of<AuthProvider>(context,listen: false).fcmToken}",
    });
    return response.data;
  }

  Future otpVerification(Map<String, dynamic> data) async {
    var http = await getApiClient();
    return await http.post(baseUrl + "otp-verify", data: data);
  }

  Future resendOtp(Map<String, dynamic> data) async {
    var http = await getApiClient();
    return await http.post(baseUrl + "resend-otp", data: data);
  }

  updateProfileInformation(Map<String, dynamic> data) async {
    var http = await getApiClient();
    var response =
        await http.post(baseUrl + "users/profileinformation", data: data);
    return response;
  }

  businessProfileInformation(Map<String, dynamic> data) async {
    var http = await getApiClient();
    var response = await http.post(baseUrl + "bussiness", data: data);
    return response;
  }

  getUser() async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "users/getuser");
      return response;
    } catch (er) {
      // print(er.toString());
    }
  }

  forGotPasswordSendOTP(String email) async {
    try {
      var http = await getApiClient();
      var response = await http
          .post(baseUrl + "forget-password", data: {"email": "$email"});
      return response;
    } catch (er) {
      // print(er.toString());
    }
  }

  forgotPassword(String email, String password, String otp) async {
    try {
      var http = await getApiClient();
      var response = await http.post(baseUrl + "otp-verify-forget-password",
          data: {
            "email": "$email",
            "new_password": "$password",
            "otp_code": "$otp"
          });
      print(response);
      return response;
    } catch (er) {
      // print(er.toString());
    }
  }

  getUserById(String? userId) async {
    try {
      var http = await getApiClient();
      var response =
          await http.get(baseUrl + "user", queryParameters: {"id": userId});
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  getAllSubject() async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "get-data");
      return response;
    } catch (er) {
      // print(er.toString());
    }
  }

  postTeacherMaterial(String title, int subject, int grade,
      FilePickerResult result, String extension) async {
    try {
      var http = await getApiClient();

      FormData formData = FormData.fromMap({
        "title": title,
        "subject_id": subject, //"mp4","3gp","avi","wmv","flv"
        "grade_id": grade,
        "file_name": result.files.first.name,
        "type": extension,
        // result.files[0].extension =="mp4"
        //     || result.files[0].extension =="3gp"
        //     || result.files[0].extension =="avi"
        //     || result.files[0].extension =="wmv"
        //     || result.files[0].extension =="flv" ?"Video"
        // :result.files[0].extension=="mp3"?"Audio"
        //     : "${result.files[0].extension}",
      });
      for (int i = 0; i < result.files.length; i++)
        formData.files.addAll([
          MapEntry(
              "files[]", await MultipartFile.fromFile(result.files[i].path!)),
        ]);

      var response =
          await http.post(baseUrl + "study-material", data: formData);
      print("this is the response: ${response.data}");
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  getTeacherMaterial() async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "study-material");
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  getFollowings(String id) async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "following-list/$id");
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  getFollowers(String id) async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "follower-list/$id");
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  getTeacherStudyMaterialDetail(String id) async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "study-material/$id");
      return response;
    } catch (er) {
      print(er.toString());
    }
  }


  postStudentNotes(String title,int subject,int grade,int syllabus, FilePickerResult result,) async {
    try {
      var http = await getApiClient();

      FormData formData = FormData.fromMap({

        "title":title,
        "subject_id":subject,
        "grade_id":grade,
        "syllabus_id":syllabus,
        "file_name":result.files.first.name,

        "type":
        result.files[0].extension=="jpg" || result.files[0].extension=="png" || result.files[0].extension=="tiff" || result.files[0].extension=="jpeg" ?"Image"
            :result.files[0].extension=="docx" || result.files[0].extension=="doc"? "docx"
            :result.files[0].extension=="pptx" || result.files[0].extension=="ppt"? "pptx"
            :result.files[0].extension

      });
      for (int i = 0; i < result.files.length; i++)
        formData.files.addAll([
          MapEntry(
              "files[]", await MultipartFile.fromFile(result.files[i].path!)),
        ]);

      var response = await http.post(baseUrl + "study-notes", data: formData);
      print("this is the response: ${response.data}");
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  getStudentNotes() async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "study-notes");
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  getStudentStudyNotesDetail(String id) async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "study-notes/$id");
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  getPastPapersDetail(String id) async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "past-paper/$id");
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  rating(String type, String rating, String id) async {
    try {
      var http = await getApiClient();
      var response = await http.post(baseUrl + "rating", data: {
        'type': "$type",
        'rating': "$rating",
        'id': "$id",
      });
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  getPastPapers() async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "past-paper");
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  updateProfileData(
      String name, String phnNumber, String country, String institute) async {
    try {
      var http = await getApiClient();
      var response = await http.put(baseUrl + "user-profile-update/2", data: {
        "name": "$name",
        "phone_number": "$phnNumber",
        "country": "$country",
        "institute": "$institute"
      });
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  updateProfilePic(String img) async {
    try {
      var http = await getApiClient();

      FormData formData = FormData();

      formData.files.add(
        MapEntry("profile-img", await MultipartFile.fromFile(img)),
      );
      var response =
          await http.post(baseUrl + "profile-pic-update/1", data: formData);
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  startZoomMeeting(String title, String desc, String dateTime, String userID,
      String img) async {
    try {
      var http = await getApiClient();

      FormData formData = FormData.fromMap({
        "title": title,
        "description": desc,
        "date_time": dateTime,
        "user_id": userID,
      });

      formData.files.add(
        MapEntry("img", await MultipartFile.fromFile(img)),
      );

      var response = await http.post(baseUrl + "zoom-event", data: formData);
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  updateStartZoomMeeting(String meetingId, String pass, String id) async {
    try {
      var http = await getApiClient();

      // FormData formData = FormData.fromMap({
      //   "meeting_id":meetingId,
      //   "meeting_pass":pass,
      //
      // });

      var response = await http.put(baseUrl + "zoom-event/$id", data: {
        "meeting_id": meetingId,
        "meeting_pass": pass,
      });
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  getZoomMeetingData() async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "zoom-event");
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  followUnFollow(String id) async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "follow/$id");
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  followCount() async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "follow-count");
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  removeFollow(String id) async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "follower-remove/$id");
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  getUserProfile(String id) async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "user-profile/$id");
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  endZoomMeeting(String id) async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "zoom-event/$id");
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  report(String id, String type, String remarks) async {
    try {
      var http = await getApiClient();
      var response = await http.post(baseUrl + "report-activity", data: {
        'id': "$id",
        'type': "$type",
        'remarks': "$remarks",
      });
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  changePassword(String new_pass, String old_pass) async {
    try {
      var http = await getApiClient();
      var response = await http.post(baseUrl + "change-password", data: {
        'old_password': "$old_pass",
        'new_password': "$new_pass",
      });
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  notificationSetting(context) async {
    try {
      var http = await getApiClient();
      var response = await http.post(baseUrl + "setting", data: {
        'material_notification':
            "${Provider.of<SubjectProvider>(context, listen: false).material! ? 1 : 0}",
        'following_notification':
            "${Provider.of<SubjectProvider>(context, listen: false).following! ? 1 : 0}",
        'rating_notification':
            "${Provider.of<SubjectProvider>(context, listen: false).rating! ? 1 : 0}",
      });
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  getPrivacyPolicy() async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "privacy-policy");
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  getTermsCondition() async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "term-condition");
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  logOut(context) async {
    try {
      var http = await getApiClient();
      var response = await http.post(baseUrl + "log-out", data: {
        'fcm_token':
            "${Provider.of<AuthProvider>(context, listen: false).fcmToken}",
      });
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }

  getNotification() async {
    try {
      var http = await getApiClient();
      var response = await http.get(baseUrl + "notification");
      print(response);
      return response;
    } catch (er) {
      print(er.toString());
    }
  }
}
