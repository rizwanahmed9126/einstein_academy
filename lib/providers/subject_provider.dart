import 'package:einstien_academy_flutter/models/grade.dart';
import 'package:einstien_academy_flutter/models/subject.dart';
import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/services/http_service.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/storage_service.dart';
import 'package:einstien_academy_flutter/services/util_service.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:flutter/material.dart';

class SubjectProvider with ChangeNotifier {
  NavigationService? navigationService = locator<NavigationService>();
  UtilService? utilService = locator<UtilService>();
  StorageService storageService = locator<StorageService>();
  HttpService? http = locator<HttpService>();

  bool? material;
  bool? following;
  bool? rating;

  getData()async{
    material=await storageService.getBoolData("MaterialSwitch")==null?true:await storageService.getBoolData("MaterialSwitch");
    following=await storageService.getBoolData("followingSwitch")==null?true:await storageService.getBoolData("followingSwitch");
    rating= await storageService.getBoolData("ratingSwitch")==null?true:await storageService.getBoolData("ratingSwitch");

    notifyListeners();
  }
  saveRating(bool value)async{
    rating=!rating!;
    await storageService.setBoolData("ratingSwitch", rating!);
    notifyListeners();
  }
  saveFollowing(bool value)async{
    following=!following!;
    await storageService.setBoolData("followingSwitch", following!);
    notifyListeners();
  }
  saveMaterial(bool value)async{
    material=!material!;
    await storageService.setBoolData("MaterialSwitch", material!);
    notifyListeners();
  }




  List _loadedData = [];
  List subject = [];
  List grade = [];
  List syllabus = [];
  List subjectID=[];
  saveIDs(var service) {
    // set locally
    this.subjectID.add(service);
    print(this.subjectID);
  }
  removeIDS(var service) {
    // remove locally
    this.subjectID.remove(service);
    print(this.subjectID);
  }


  setLanguages(var service) {
    // set locally
    this._loadedData.add(service);
    print(this._loadedData);
  }

  List get getSubjectApi {
    return this.subject.toSet().toList();
  }

  List get getSubject {
    // get locally
    return this._loadedData.toSet().toList();
  }

  removeLanguages(var service) {
    // remove locally
    this._loadedData.remove(service);
    print(this._loadedData);
  }

  Future<dynamic> fetchAllSubject() async {
    try {
      var response = await this.http!.getAllSubject();

      if (response == null) {
        return;
      }

        var data = response.data['subject'];
        this.subject = [];
        for (int i = 0; i < data.length; i++) {
          this.subject.add(SubjectModel.fromJson(data[i]));
        }

        var data1 = response.data['grade'];
        this.grade = [];
        for (int i = 0; i < data1.length; i++) {
          this.grade.add(GradeModel.fromJson(data1[i]));
        }

      var data2 = response.data['syllabus'];
      this.syllabus = [];
      for (int i = 0; i < data2.length; i++) {
        this.syllabus.add(GradeModel.fromJson(data2[i]));
      }
      syllabus.forEach((element) {
        print(element);
      });

      notifyListeners();

      return "done";




    } catch (error) {
      print(error);
      return "fail";
      //throw (error);
    }
  }

  List get getGradeApi {
    return this.grade.toSet().toList();
  }

  // Future<void> fetchAllGrade() async {
  //   try {
  //     var response = await this.http!.getAllSubject();
  //
  //     if (response == null) {
  //       return;
  //     }
  //     var data = response.data['grade'];
  //     this.grade = [];
  //     for (int i = 0; i < data.length; i++) {
  //       this.grade.add(GradeModel.fromJson(data[i]));
  //     }
  //     notifyListeners();
  //   } catch (error) {
  //     throw (error);
  //   }
  // }


}
