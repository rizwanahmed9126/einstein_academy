import 'dart:io';

//import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:einstien_academy_flutter/models/messages.dart';
import 'package:einstien_academy_flutter/models/user.dart';
import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/providers/chat_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/chat_message_tile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;


class ChatScreen extends StatefulWidget {

  final String title;
  final String imgUrl;
  final String chatRoomID;
  ChatScreen({required this.title,required this.imgUrl,required this.chatRoomID});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var navigationService = locator<NavigationService>();
  final double minValue = 8.0;
  final double iconSize = 28.0;
  FocusNode? _focusNode;
  TextEditingController _txtController = TextEditingController();

  bool isCurrentUserTyping = false;
  ScrollController? _scrollController;

  String message = '';

  var isLoading = false;

  initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 0);

    _focusNode = FocusNode();
    _focusNode!.addListener(() {
      print('Something happened');
    });
  }

  @override
  void dispose() {
    _scrollController!.dispose();

    super.dispose();
  }

  void onTextFieldTapped() {}
  void _onMessageChanged(String value) {
    setState(() {
      message = value;
      if (value.trim().isEmpty) {
        isCurrentUserTyping = false;
        return;
      } else {
        isCurrentUserTyping = true;
      }
    });
  }

  // ignore: unused_element
  void _like() {}
  void _sendMessage() {
    setState(() {
      myMessages.insert(
          0, (Message(messageBody: message, senderId: currentUser.userId)));
      message = '';
      _txtController.text = '';
    });
    _scrollToLast();
  }

  void _scrollToLast() {
    _scrollController!.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  FirebaseFirestore firestore=FirebaseFirestore.instance;
  FilePickerResult? result ;

  getImage()async{
    setState(() {
      result=null;
    });
   var  value = await FilePicker.platform.pickFiles(allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],
    );
    setState(() {
      result=value;
    });

  }
  getImagePDF()async{
    setState(() {
      result=null;
    });
    var value = await FilePicker.platform.pickFiles(allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    setState(() {
      result=value;
    });
  }
  bool isLoadingProgress=false;




  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return AbsorbPointer(
        absorbing: isLoadingProgress,

        child: 
        Scaffold(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // SizedBox(
                            //   width: 15.w,
                            // ),
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
                              width: 15.w,
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: FadeInImage(
                                  image: NetworkImage("${widget.imgUrl}"),
                                  placeholder: AssetImage("assets/images/placeHolder.png",),
                                  imageErrorBuilder: (context,url,error)=>Image.asset("assets/images/placeHolder.png",height: 53,width: 53,fit: BoxFit.cover,),
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                  //imageErrorBuilder: (context,url)=>Icon(),
                                )

                            ),
                            // CircleAvatar(
                            //   radius: 18.r,
                            //   backgroundImage:
                            //   AssetImage("assets/images/001.jpeg"),
                            // ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200.w,
                                  child: Text(
                                    "${widget.title}",
                                    //"Marketing Strategies and Secrets",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  "23 Participants",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            size: 24.h,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
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
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(40.0.h),
            ),
          ),
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 247, 254, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(221, 235, 248, 1)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 12.0.w,
                            right: 12.0.w,
                            top: 6.0.h,
                            bottom: 6.0.h),
                        child: Text(
                          "Today",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14.sp),
                        ),
                      ),
                    ),
                    Container(
                      height: height*0.72,

                      decoration: BoxDecoration(
                        //color: Colors.red,


                        //color: Color.fromRGBO(244, 247, 254, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      margin: EdgeInsets.only(top: sy(0), bottom: sy(0.0)),
                      child:
                      StreamBuilder(
                        stream: firestore.collection("chat").doc(widget.chatRoomID).collection("conversations")
                        .orderBy("sendDate",descending: true)
                            .snapshots(),
                        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                          if(!snapshot.hasData){
                            return Center(
                              child: LoadingWidget(),
                            );
                          }


                          return ListView(
                            reverse: true,
                                padding: EdgeInsets.symmetric(vertical: minValue * 2, horizontal: minValue),
                            children: snapshot.data!.docs.map((doc){

                              DateTime messageTime = (doc["sendDate"] as Timestamp).toDate();
                             final time= timeago.format(DateTime.now().subtract(DateTime.now().difference(messageTime)));


                              return doc["type"]=="text"?  MyMessageChatTile(
                                message: doc["msg"],
                                name: doc["userName"],
                                time: time,
                                isCurrentUser: doc["senderID"]==Provider.of<AuthProvider>(context,listen: false).user!.id?true:false,//message.senderId == currentUser.userId,
                              ) :
                              doc["type"]=="pdf"?
                              PdfMessageChatTile(
                              message: doc["msg"],
                              name: doc["userName"],
                              time: time,
                              isCurrentUser: doc["senderID"]==Provider.of<AuthProvider>(context,listen: false).user!.id?true:false,//message.senderId == currentUser.userId,
                              ):PicMessageChatTile(
                                message: doc["msg"],
                                name: doc["userName"],
                                time: time,
                                isCurrentUser: doc["senderID"]==Provider.of<AuthProvider>(context,listen: false).user!.id?true:false,//message.senderId == currentUser.userId,
                              );
                            }).toList(),
                          );
                        },
                      )

                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildBottomSection(
                    onTap:  () {
                      var userID=Provider.of<AuthProvider>(context,listen: false).user!.id;

                      if(result!=null){
                        setState(() {
                          isLoadingProgress=true;
                        });
                        String msg=_txtController.text;
                        _txtController.clear();
                        _focusNode!.unfocus();


                        Provider.of<ChatProvider>(context,listen: false).uploadDiscussionDP("${result!.files.first.extension}",File(result!.files.first.path!)).then((value){
                          firestore.collection("chat").doc(widget.chatRoomID).collection("conversations").add({
                            "senderID":userID,
                            "userName":Provider.of<AuthProvider>(context,listen: false).user!.name,
                            "msg":value,
                            "type":result!.files.first.extension=="pdf"?"pdf":"image",
                            "sendDate":DateTime.now()



                          });
                          if(msg.isNotEmpty){
                            firestore.collection("chat").doc(widget.chatRoomID).collection("conversations").add({
                              "senderID":userID,
                              "userName":Provider.of<AuthProvider>(context,listen: false).user!.name,
                              "msg":msg,
                              "type":"text",
                              "sendDate":DateTime.now()
                            });
                          }


                          firestore.collection("chat").doc(widget.chatRoomID).update({
                            "lastMsg":_txtController.text,

                            "lastMsgDateTime":DateTime.now()
                          });

                          setState(() {
                            isLoadingProgress=false;
                            result=null;
                          });
                        });



                      }
                      else{
                        if(_txtController.text.isNotEmpty){
                          firestore.collection("chat").doc(widget.chatRoomID).collection("conversations").add({
                            "senderID":userID,
                            "userName":Provider.of<AuthProvider>(context,listen: false).user!.name,
                            "msg":_txtController.text,
                            "type":"text",
                            "sendDate":DateTime.now()


                          });
                          firestore.collection("chat").doc(widget.chatRoomID).update({
                            "lastMsg":_txtController.text,

                            "lastMsgDateTime":DateTime.now()
                          });
                          _txtController.clear();
                          _focusNode!.unfocus();
                        }

                      }







                      //_sendMessage();
                    },
                  )
              ),

              if (isLoadingProgress)
                Positioned.fill(
                  child: LoadingWidget(),
                )



            ],
          ),
        ),
      );

    });


  }


  Widget _buildBottomSection({required VoidCallback onTap}) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Container(
        constraints: BoxConstraints(minHeight: sy(35),maxHeight: sy(90)),
        width: MediaQuery.of(context).size.width,

        //color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          result!=null?
              result!.files.first.extension=="pdf"?
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Image.asset("assets/images/pdf.png",fit: BoxFit.cover,height: 65,width: 65,),
                  ),
                  Positioned(
                    top: -10,
                    right: -10,
                    child: IconButton(
                      onPressed: () {
                        result=null;


                        //imgURL = '';

                        setState(() {});
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
                  : Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Image.file(File(result!.files.first.path!),fit: BoxFit.cover,height: 70,width: 70,),
              ),
              Positioned(
                top: -10,
                right: -10,
                child: IconButton(
                  onPressed: () {
                    result=null;


                    //imgURL = '';

                    setState(() {});
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )



            :Container(),






            Container(


              height: sy(35),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              //color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: minValue),

              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      focusNode: _focusNode,
                      keyboardType: TextInputType.text,
                      controller: _txtController,
                      onChanged: _onMessageChanged,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                            right: sx(30),
                          ),
                          child: Icon(
                            Icons.emoji_emotions_outlined,
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: "Type your message",
                      ),
                      autofocus: false,
                      onTap: () => onTextFieldTapped(),
                    ),
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/images/00-dicussionBoardchat-Attachments.png',
                      height: 40.h,
                      scale: 1,
                    ),
                    onPressed: () {
                      _settingModalBottomSheet(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: sy(2), bottom: sy(2),),
                    child: VerticalDivider(),
                  ),
                  GestureDetector(
                    onTap: onTap,


                    child: Image(
                      image: AssetImage(
                          "assets/images/00-dicussionBoardchat-SendButton.png"),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      );
    });
  }



  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 200,
            child: new Wrap(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Upload Profile Picture",
                      //'Upload Profile Picture',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Divider(),
                new ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
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
                  title: new Text("Photo",
                      // 'Take Photo',
                      style: Theme.of(context).textTheme.subtitle2),
                  onTap: () {
                    // setState(() {
                    //   isLoadingProgress = true;
                    getImage();
                    // utilService.captureImage(vendor.id).then((String value) => setState(() {
                    //           imageUrl = value;
                    //           isLoadingProgress = false;
                    //         }));
                    // });
                    // isLoadingProgress = false;
                    Navigator.of(context).pop();
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: new ListTile(
                    leading: Container(
                      margin: EdgeInsets.only(top: 3),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
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
                    title: new Text("PDF",
                        // 'Browse',
                        style: Theme.of(context).textTheme.subtitle2),
                    onTap: () {
                      getImagePDF();

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


