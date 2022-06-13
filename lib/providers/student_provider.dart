import 'package:einstien_academy_flutter/models/past_papers_detail_model.dart';
import 'package:einstien_academy_flutter/models/past_papers_model.dart';
import 'package:einstien_academy_flutter/models/student_notes_detail_model.dart';
import 'package:einstien_academy_flutter/models/student_notes_model.dart';
import 'package:einstien_academy_flutter/models/teacher_material_detail_model.dart';
import 'package:einstien_academy_flutter/models/teacher_material_model.dart';
import 'package:einstien_academy_flutter/services/http_service.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier{

  HttpService http = locator<HttpService>();

  List<StudentNotesModel> studentNotesData=[];
  List<PastPapersModel> pastPapersData=[];
  StudentNotesDetailModel? studentNotesDetail;
  PastPapersDetailModel? pastPapersDetailData;



  List<StudentNotesModel> tempStudentNotes=[];
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

  saveTempStudentNotes(List<StudentNotesModel> value){
    tempStudentNotes.addAll(value);
    notifyListeners();
  }


  // filterByType(String type){
  //   //tempStudentNotes.clear();
  //   tempStudentNotes.addAll(tempStudentNotes.where((element) => element.studynotes.type=="$type"));
  //   notifyListeners();
  // }
  filterByGrade(){
    tempStudentNotes.clear();
    if(selectedSubject!=null && selectedType!=null && selectedGrade!=null){
      tempStudentNotes.addAll(studentNotesData.where((element) => element.studynotes.subject.name=="$selectedSubject" && element.studynotes.type.toLowerCase()=="$selectedType".toLowerCase() && element.studynotes.grade.name=="$selectedGrade"));
      print("temp length${tempStudentNotes.length}");
    }

    else if(selectedSubject!=null && selectedType!=null){
      tempStudentNotes.addAll(studentNotesData.where((element) => element.studynotes.subject.name=="$selectedSubject" && element.studynotes.type.toLowerCase()=="$selectedType".toLowerCase()));
      print("temp length${tempStudentNotes.length}");
    }
    else if(selectedGrade!=null && selectedType!=null){
      tempStudentNotes.addAll(studentNotesData.where((element) => element.studynotes.grade.name=="$selectedGrade" && element.studynotes.type.toLowerCase()=="$selectedType".toLowerCase()));
      print("temp length${tempStudentNotes.length}");
    }
   else if(selectedGrade!=null && selectedSubject!=null){
      tempStudentNotes.addAll(studentNotesData.where((element) => element.studynotes.grade.name=="$selectedGrade" && element.studynotes.subject.name=="$selectedSubject"));
      print("temp length${tempStudentNotes.length}");
   }

    else if(selectedType!=null){
      tempStudentNotes.addAll(studentNotesData.where((element) => element.studynotes.type.toLowerCase()=="$selectedType".toLowerCase()));
      print("temp length${tempStudentNotes.length}");
    }
   else if(selectedGrade!=null){
      tempStudentNotes.addAll(studentNotesData.where((element) => element.studynotes.grade.name=="$selectedGrade"));
      print("temp length${tempStudentNotes.length}");

    }
    else if(selectedSubject!=null){
      tempStudentNotes.addAll(studentNotesData.where((element) => element.studynotes.subject.name=="$selectedSubject"));
      print("temp length${tempStudentNotes.length}");
    }else if(selectedSubject==null && selectedType==null && selectedGrade==null){
      saveTempStudentNotes(studentNotesData);
    }
    else{
      print("no data found");
    }



   //  tempStudentNotes= tempStudentNotes.where((element) =>
   // selectedType!=null ?element.studynotes.grade.name=="$selectedType" :element.studynotes.grade.name=="$selectedType"
   //
   //  ).toList();

    notifyListeners();

  }
  // filterBySubject(String subject){
  //   //tempStudentNotes.clear();
  //   tempStudentNotes.addAll(tempStudentNotes.where((element) =>
  //   element.studynotes.subject.name=="$subject"
  //   )
  //   );
  //   notifyListeners();
  //
  // }




  clearStudyNotesData(){
    tempStudentNotes.clear();
    notifyListeners();
  }


  studentNotesSearch(List<StudentNotesModel> value){
    tempStudentNotes.clear();
    tempStudentNotes.addAll(value);
    notifyListeners();
  }

  clearPastPapers(){
    pastPapersData.clear();
    notifyListeners();
  }


  studentPastPapersSearch(List<PastPapersModel> value){
    pastPapersData.clear();
    pastPapersData.addAll(value);
    notifyListeners();
  }



  String filterType="All Study Materials";
  String id="1";

  saveFilterType(String value,String value2){
    filterType=value;
    id=value2;
    notifyListeners();
  }

  Future<dynamic> callPostStudentNotes(String title,int subject,int grade,int syllabus,FilePickerResult result,)async{
    try{
      var response=  await http.postStudentNotes(title, subject, grade,syllabus, result,);
      if(response.statusCode==200){
        if(response.data["status"]=="success"){
          return "done";
        }
      }
      return "fail";

    }
    catch(e){
      print("post student Material error: $e");
      return "fail";

    }


  }

  Future<dynamic> callGetStudentNotes()async{
    try{
      var response=  await  http.getStudentNotes();
      if(response.statusCode==200){
        studentNotesData.clear();
        print(response.data);
        for(var abc in response.data){
          print(abc);
          saveStudentNotesData(StudentNotesModel.fromJson(abc));
        }
        print(studentNotesData.length);
        if(studentNotesData.length<1){
          return "noData";
        }
      }
      return "done";

    }
    catch(e){
      print("post student error: $e");
      return "noData";

    }


  }

  Future<dynamic> callGetStudentNotesDetail(String id)async{
    try{
      var response=  await  http.getStudentStudyNotesDetail(id);
      if(response.statusCode==200){
        studentNotesDetail=null;
        //for(var abc in response.data["data"]){
        saveStudentNotesDetail(StudentNotesDetailModel.fromJson(response.data["data"]));
        //}
        print(studentNotesDetail!.user.userOtp);
      }
      return "done";

    }
    catch(e){
      print("post Student Material error: $e");
      return "fail";

    }


  }

  Future<dynamic> callPastPapersDetail(String id)async{
    try{
      var response=  await  http.getPastPapersDetail(id);
      if(response.statusCode==200){
        pastPapersDetailData=null;
        print(response.data["data"][0]);
        savePastPapersDetail(PastPapersDetailModel.fromJson(response.data["data"][0]));

        print(pastPapersDetailData!.subject.name);
      }
      return "done";

    }
    catch(e){
      print("post Student Material error: $e");
      return "fail";

    }


  }


  Future<dynamic> callGetPastPapers()async{
    try{
      var response=  await  http.getPastPapers();
      if(response.statusCode==200){
        pastPapersData.clear();
        for(var abc in response.data["data"]){
          savePastPapers(PastPapersModel.fromJson(abc));
        }
        print("past papers length--${pastPapersData.length}");
        if(pastPapersData.length<1){
          return "noData";
        }
      }
      return "done";

    }
    catch(e){
      print("post student error: $e");
      return "noData";

    }


  }
  savePastPapers(PastPapersModel value){

    pastPapersData.add(value);
    notifyListeners();
  }

  saveStudentNotesData(StudentNotesModel value){

    studentNotesData.add(value);
    notifyListeners();
  }

  saveStudentNotesDetail(StudentNotesDetailModel value){
    studentNotesDetail=value;
    notifyListeners();
  }

  savePastPapersDetail(PastPapersDetailModel value){
    pastPapersDetailData=value;
    notifyListeners();
  }


}