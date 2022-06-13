//import 'package:cached_network_image/cached_network_image.dart';
import 'package:einstien_academy_flutter/screens/chat_screen.dart';
import 'package:einstien_academy_flutter/screens/search_screen.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ChatGroupWidget extends StatefulWidget {
  final String imgUrl;
  final String title;
  final String lastmsg;
  final String chatRoomID;
  final String msgCount;
  final String lastMsgTime;
  // final data;
  // ValueChanged<dynamic>? action;
  // final active;
  // String? tag;
  ChatGroupWidget({required this.imgUrl,required this.title,required this.lastmsg,required this.chatRoomID,required this.msgCount,required this.lastMsgTime});

  @override
  _ChatGroupWidgetState createState() => _ChatGroupWidgetState();
}

class _ChatGroupWidgetState extends State<ChatGroupWidget> {

  //var dateTime=DateFormat(widget.lastMsgTime)
  //String formattedDate = DateFormat('h:mm a').format(DateTime.now());

  // void handletap() {
  //   widget.action!(widget.tag!);
  //   navigationService.navigateTo(ChatScreenRoute);
  // }

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(title: widget.title,imgUrl: widget.imgUrl,chatRoomID: widget.chatRoomID,)));
        //navigationService.navigateTo(ChatScreenRoute);

      },
      child: Container(
        padding: EdgeInsets.only(top: 15.0.h, bottom: 15.0.h,
          right: 10.0.w,
          left: 10.0.w,
        ),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
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

                SizedBox(
                  width: 8.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width*0.5,

                      child: Text(
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                            color:
                            // widget.tag == '1'
                            //     ? Colors.black
                            //     :
                            Color.fromRGBO(119, 131, 139, 1)),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      width: width*0.5,
                      child: Text(
                        widget.lastmsg,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontSize: 11.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 50,
              width: 40,

              child: Column(
                children: [
                  Text(
                   "${widget.lastMsgTime}",

                    //"${DateFormat('h:mm a').format(DateTime.parse(widget.lastMsgTime)).toLowerCase()}",
                    style: TextStyle(fontSize: 9.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                widget.msgCount=="0"?Container():
                Container(
                    height: 15.h,
                    width: 15.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                        // widget.tag == '1'
                        //     ? Color.fromRGBO(28, 143, 243, 1)
                        //     :
                        Color.fromRGBO(28, 143, 243, 1)
                    ),
                    child: Center(
                      child: Text(
                        widget.msgCount,
                        style: TextStyle(
                            fontSize: 9.sp,
                            color:
                            // widget.tag == "1"
                            //     ? Colors.white
                            //     :
                            Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
