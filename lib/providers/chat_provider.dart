import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class ChatProvider extends ChangeNotifier{

  //FirebaseStorage firebaseStorage=FirebaseStorage.instance;

 FirebaseFirestore firestore=FirebaseFirestore.instance;

  Future<String> uploadDiscussionDP(String id,File img)async{



    try{
      Reference storageReference;
      FirebaseStorage storage = FirebaseStorage.instance;
      //Create a reference to the location you want to upload to in firebase
      storageReference = storage.ref().child("profile$id/$id");

      final UploadTask uploadTask = storageReference.putFile(img);

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

      // Waits till the file is uploaded then stores the download url
      String url = await taskSnapshot.ref.getDownloadURL();

      print(url);

      return url;
    }
    catch(e){
      print(e);

      return "fail";
    }
  }


 Future<void> createDiscussionBoard(String title,String desc,String imgUrl)async {
    firestore.collection("chat").add({
      "title":title,
      "desc":desc,
      "image":imgUrl,
      "createdDate":DateTime.now(),
      "lastMsg":"",
      "lastMsgDateTime":""
    });


  }



}