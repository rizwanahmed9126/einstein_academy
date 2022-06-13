import 'package:einstien_academy_flutter/models/notification_model.dart';
import 'package:einstien_academy_flutter/models/teacher_material_detail_model.dart';
import 'package:einstien_academy_flutter/models/teacher_material_model.dart';
import 'package:einstien_academy_flutter/services/http_service.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:video_player/video_player.dart';

class TeacherProvider extends ChangeNotifier{

  HttpService http = locator<HttpService>();

  List<TeacherMaterialModel> teacherMaterialData=[];
  List<NotificationModel> notificationData=[];
  TeacherMaterialDetailModel? teacherMaterialDetail;

  // VideoPlayerController? videoPlayerController;
  //
  // saveVideoURl(String value){
  //   videoPlayerController=  VideoPlayerController.network(value);
  //   notifyListeners();
  // }


  String? privacyPolicy;
  String? termsCondition;

  String? mediaExtension;

  bool zoomWrongPass=true;

  saveZoomPassword(bool value){
    zoomWrongPass=value;
    notifyListeners();

  }





  List<TeacherMaterialModel> tempTeacherMaterials=[];
  String? selectedType;
  String? selectedGrade;
  String? selectedSubject;
  saveSelectedType({String? value}){
    selectedType=value;
    notifyListeners();
  }
  saveSelectedSubject({String? value}){
    selectedSubject=value;
    notifyListeners();
  }
  saveSelectedGrade({String? value}){
    selectedGrade=value;
    notifyListeners();
  }

  saveTempTeacherNotes(List<TeacherMaterialModel> value){
    tempTeacherMaterials.addAll(value);
    notifyListeners();
  }


  // filterByType(String type){
  //   //tempStudentNotes.clear();
  //   tempStudentNotes.addAll(tempStudentNotes.where((element) => element.studynotes.type=="$type"));
  //   notifyListeners();
  // }
  filterByGrade(){
    tempTeacherMaterials.clear();
    if(selectedSubject!=null && selectedType!=null && selectedGrade!=null){
      tempTeacherMaterials.addAll(teacherMaterialData.where((element) => element.studymaterial.subject.name=="$selectedSubject" && element.studymaterial.type.toLowerCase()=="$selectedType".toLowerCase() && element.studymaterial.grade.name=="$selectedGrade"));
      print("temp length${tempTeacherMaterials.length}");
    }

    else if(selectedSubject!=null && selectedType!=null){
      tempTeacherMaterials.addAll(teacherMaterialData.where((element) => element.studymaterial.subject.name=="$selectedSubject" && element.studymaterial.type.toLowerCase()=="$selectedType".toLowerCase()));
      print("temp length${tempTeacherMaterials.length}");
    }
    else if(selectedGrade!=null && selectedType!=null){
      tempTeacherMaterials.addAll(teacherMaterialData.where((element) => element.studymaterial.grade.name=="$selectedGrade" && element.studymaterial.type.toLowerCase()=="$selectedType".toLowerCase()));
      print("temp length${tempTeacherMaterials.length}");
    }
    else if(selectedGrade!=null && selectedSubject!=null){
      tempTeacherMaterials.addAll(teacherMaterialData.where((element) => element.studymaterial.grade.name=="$selectedGrade" && element.studymaterial.subject.name=="$selectedSubject"));
      print("temp length${tempTeacherMaterials.length}");
    }

    else if(selectedType!=null){
      tempTeacherMaterials.addAll(teacherMaterialData.where((element) => element.studymaterial.type.toLowerCase()=="$selectedType".toLowerCase()));
      print("temp length${tempTeacherMaterials.length}");
    }
    else if(selectedGrade!=null){
      tempTeacherMaterials.addAll(teacherMaterialData.where((element) => element.studymaterial.grade.name=="$selectedGrade"));
      print("temp length${tempTeacherMaterials.length}");

    }
    else if(selectedSubject!=null){
      tempTeacherMaterials.addAll(teacherMaterialData.where((element) => element.studymaterial.subject.name=="$selectedSubject"));
      print("temp length${tempTeacherMaterials.length}");
    }else if(selectedSubject==null && selectedType==null && selectedGrade==null){
      saveTempTeacherNotes(teacherMaterialData);
    }
    else{
      print("no data found");
    }


    notifyListeners();

  }









  clearData(){
    tempTeacherMaterials.clear();
    notifyListeners();
  }

  teacherMaterialSearch(List<TeacherMaterialModel> value){
    tempTeacherMaterials.clear();
    tempTeacherMaterials.addAll(value);
    notifyListeners();
  }


  String filterType="All Study Materials";
  String id="1";

  saveFilterType(String value,String value2){
    filterType=value;
    id=value2;
    notifyListeners();
  }

  Future<dynamic> callPostTeacherMaterial(String title,int subject,int grade,FilePickerResult result,)async{
    try{
    var response=  await  http.postTeacherMaterial(title, subject, grade, result,mediaExtension!);
    if(response.statusCode==200){
      if(response.data["status"]=="sucess"){
        return "done";
      }
    }
    return "fail";

    }
    catch(e){
      print("postTeacterMaterial error: $e");
      return "fail";

    }


  }

  Future<dynamic> callGetTeacherMaterial()async{
    try{
      var response=  await http.getTeacherMaterial();
      if(response.statusCode==200){
        print(response.data.isEmpty);
        teacherMaterialData.clear();
        for(var abc in response.data){
          saveTeacherMaterialData(TeacherMaterialModel.fromJson(abc));
        }
        if(teacherMaterialData.length<1){
          return "NoMaterial";
        }else{
          notifyListeners();

        }
        print(teacherMaterialData.length);
      }
      return "done";

    }
    catch(e){
      print("post Teacher Material error: $e");
      return "NoMaterial";
    }


  }

  Future<dynamic> callGetTeacherStudyMaterialDetail(String id)async{
    try{
      var response=  await  http.getTeacherStudyMaterialDetail(id);
      if(response.statusCode==200){
        teacherMaterialDetail=null;
        //for(var abc in response.data){
        saveTeacherStudyMaterialDetail(TeacherMaterialDetailModel.fromJson(response.data["data"]));
        //}
        print(teacherMaterialDetail!.user.userOtp);
      }
      return "done";

    }
    catch(e){
      print("postTeacterMaterial error: $e");
      return "fail";

    }


  }


  Future<dynamic> callPrivacyPolicy()async{
    try{
      var response=  await  http.getPrivacyPolicy();
      if(response.statusCode==200){
        if(response.data["status"]=="success"){
          savePrivacyPolicy(response.data["data"]["description"]);
          return response.data["data"]["description"];
        }
        else{
          return "noData";
        }

      }else{
        return "noData";
      }

    }
    catch(e){
      print("postTeacterMaterial error: $e");
      return "noData";
    }

  }

  Future<dynamic> callTermsCondition()async{
    try{
      var response=  await  http.getTermsCondition();
      if(response.statusCode==200){
        if(response.data["status"]=="success"){
          saveTermsCondition(response.data["data"]["description"]);
          return response.data["data"]["description"];
        }
        else{
          return "noData";
        }

      }else{
        return "noData";
      }

    }
    catch(e){
      print("postTeacterMaterial error: $e");
      return "noData";
    }

  }


  Future<dynamic> callGetNotification()async{
    try{
      var response=  await  http.getNotification();
      if(response.statusCode==200){
        if(response.data["status"]=="success"){
          for(var value in response.data["data"] ){
            saveNotificationData(NotificationModel.fromJson(value));
          }
          if(notificationData.length<1){
            return "noData";
          }else{
            return "done";
          }



        }
        else{
          return "noData";
        }

      }else{
        return "noData";
      }

    }
    catch(e){
      print("postTeacterMaterial error: $e");
      return "noData";
    }

  }


  saveTeacherMaterialData(TeacherMaterialModel value){

    teacherMaterialData.add(value);
    notifyListeners();
  }

  saveNotificationData(NotificationModel value){

    notificationData.add(value);
    notifyListeners();
  }
  

  saveTeacherStudyMaterialDetail(TeacherMaterialDetailModel value){
    teacherMaterialDetail=value;
    notifyListeners();
  }

  savePrivacyPolicy(String value){
    var document = parse(value);
    privacyPolicy=document.body!.text;


    print(document.body!.text);

    notifyListeners();
  }
  saveTermsCondition(String value){
    var document = parse(value);
    termsCondition=document.body!.text;


    print(document.body!.text);

    notifyListeners();
  }


}