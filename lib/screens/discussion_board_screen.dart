import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/chat_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DiscussionBoardScreen extends StatefulWidget {
  const DiscussionBoardScreen({Key? key}) : super(key: key);

  @override
  _DiscussionBoardScreenState createState() => _DiscussionBoardScreenState();
}

class _DiscussionBoardScreenState extends State<DiscussionBoardScreen> {
  // List<Map<String, dynamic>> discussionList = [
  //   {
  //     "id": "1",
  //     "title": "Marketing Strategies and secrets",
  //     "image": "assets/images/001.jpeg",
  //     "subtitle": "Ziyaanah: Please share new study materials",
  //     "amount": "1"
  //   },
  //   {
  //     "id": "2",
  //     "title": "Marketing Strategies and secrets",
  //     "image": "assets/images/2.jpg",
  //     "subtitle": "Ziyaanah: Please share new study materials",
  //     "amount": "2"
  //   },
  //   {
  //     "id": "3",
  //     "title": "Marketing Strategies and secrets",
  //     "image": "assets/images/4.jpg",
  //     "subtitle": "Ziyaanah: Please share new study materials",
  //     "amount": "3"
  //   },
  //   {
  //     "id": "4",
  //     "title": "Marketing Strategies and secrets",
  //     "image": "assets/images/005.jpeg",
  //     "subtitle": "Ziyaanah: Please share new study materials",
  //     "amount": "4"
  //   },
  //   {
  //     "id": "5",
  //     "title": "Marketing Strategies and secrets",
  //     "image": "assets/images/dummy4.jpg",
  //     "subtitle": "Ziyaanah: Please share new study materials",
  //     "amount": "5"
  //   },
  //   {
  //     "id": "6",
  //     "title": "Marketing Strategies and secrets",
  //     "image": "assets/images/dummy1.jpg",
  //     "subtitle": "Ziyaanah: Please share new study materials",
  //     "amount": "6"
  //   },
  //   {
  //     "id": "7",
  //     "title": "Marketing Strategies and secrets",
  //     "image": "assets/images/001.jpeg",
  //     "subtitle": "Ziyaanah: Please share new study materials",
  //     "amount": "7"
  //   },
  //   {
  //     "id": "8",
  //     "title": "Marketing Strategies and secrets",
  //     "image": "assets/images/dummy4.jpg",
  //     "subtitle": "Ziyaanah: Please share new study materials",
  //     "amount": "7"
  //   },
  //   {
  //     "id": "9",
  //     "title": "Marketing Strategies and secrets",
  //     "image": "assets/images/dummy1.jpg",
  //     "subtitle": "Ziyaanah: Please share new study materials",
  //     "amount": "7"
  //   },
  // ];
  // String tagId = ' ';
  // void active(
  //   dynamic val,
  // ) {
  //   setState(() {
  //     tagId = val;
  //   });
  // }

  var navigationService = locator<NavigationService>();
  FirebaseFirestore firestore =FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor: Color.fromRGBO(244, 247, 254, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(top: 23.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigationService.closeScreen();
                       // navigationService.navigateTo(HomeScreenRoute);
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
                      "Discussion Board",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                // Icon(
                //   Icons.search,
                //   size: 24.h,
                //   color: Colors.white,
                // )
              ],
            ),
          ),
          bottom: PreferredSize(
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
            preferredSize: Size.fromHeight(0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigationService.navigateTo(AddDiscussionBoardScreenRoute);
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          child: Image(
            image: AssetImage("assets/images/plusicon.png"),
            width: 20.w,
            height: 20.h,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(244, 247, 254, 1)),
        child: Padding(
          padding: EdgeInsets.all(15.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "All Discussion",
                    style: TextStyle(
                      color: Color.fromRGBO(
                        68,
                        79,
                        84,
                        1,
                      ),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),

              StreamBuilder(
                stream: firestore.collection("chat").snapshots(),
                  builder: (context,AsyncSnapshot<QuerySnapshot> snapshot ){
                  if(!snapshot.hasData){
                    return Center(
                      child: LoadingWidget(),
                    );
                  }
                  else{
                    if(snapshot.data!.docs.isEmpty){
                      return Center(
                        child: Text("No Discussion board "),
                      );
                    }

                    return Expanded(
                        child: ListView(
                            children: snapshot.data!.docs.map((doc){
                              DateTime messageTime = (doc["createdDate"] as Timestamp).toDate();

                              final time= timeago.format(DateTime.now().subtract(DateTime.now().difference(messageTime)));

                              return Column(
                                children: [

                                  ChatGroupWidget(
                                    lastmsg: "${doc["lastMsg"]}",
                                    imgUrl: "${doc["image"]}",
                                    title: "${doc["title"]}",
                                    chatRoomID: "${doc.id}",
                                    lastMsgTime: time,//"3:19 AM",//"${doc["lastMsgDateTime"]}",

                                    msgCount: "0",

                                  ),

                                  // StreamBuilder(
                                  //   stream: firestore.collection("chat").doc(doc.id).collection("conversations")
                                  //       .orderBy("sendDate",descending: true)
                                  //       .snapshots(),
                                  //   builder: (context, AsyncSnapshot<QuerySnapshot> snap){
                                  //
                                  //     if(snapshot.hasData){
                                  //       snap.data!.docs.map((e){
                                  //         // var formattedDate = DateFormat('yyyy-MM-dd – kk:mm:ss');
                                  //         // var msgDate=formattedDate.parse(e["sendDate"]);
                                  //         // var now=DateTime.now();
                                  //         // print(now.difference(msgDate).inSeconds);
                                  //         print(e["sendDate"]);
                                  //
                                  //       });
                                  //     }
                                  //
                                  //     return ChatGroupWidget(
                                  //       lastmsg: "${doc["title"]}",
                                  //       imgUrl: "${doc["image"]}",
                                  //       title: "${doc["title"]}",
                                  //       chatRoomID: "${doc.id}",
                                  //       msgCount: "0",
                                  //
                                  //     );
                                  //   },
                                  // )

                                ],
                              );

                            }).toList()
                        )
                    );
                  }

                  }
                  )

              // Expanded(
              //   child: ListView.builder(
              //       shrinkWrap: true,
              //       itemCount: discussionList.length,
              //       itemBuilder: (ctx, i) {
              //         return
              //           ChatGroupWidget(
              //             lastmsg: "",
              //           imgUrl: "",
              //           title: "",
              //           // data: discussionList[i],
              //           // tag: discussionList[i]['id'],
              //           // action: active,
              //           // active: tagId == discussionList[i]['id'] ? true : false,
              //         );
              //       }),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
