import 'package:bubble/bubble.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:einstien_academy_flutter/models/messages.dart';
import 'package:einstien_academy_flutter/widgets/image_viewer.dart';
import 'package:einstien_academy_flutter/widgets/pdf_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:intl/intl.dart';

class MyMessageChatTile extends StatelessWidget {
  final double minValue = 8.0;
  final String? message;
  final String name;
  final String time;

  final bool isCurrentUser;

  MyMessageChatTile({this.message, required this.isCurrentUser,required this.name,required this.time});
  @override
  Widget build(BuildContext context) {
    //String? formattedDate = DateFormat('kk:mm:a ').format(DateTime.now());

    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: sy(5),
              bottom: sy(5),
            ),
            child: Bubble(
              style: BubbleStyle(
                radius: Radius.circular(10),
                padding: BubbleEdges.all(
                  sy(7),
                ),
              ),
              // radius: Radius.elliptical(40, 40),
              margin: isCurrentUser
                  ? BubbleEdges.only(
                      right: sx(15),
                      left: sx(115),
                    )
                  : BubbleEdges.only(
                      right: sx(115),
                      left: sx(15),
                    ),
              // nip: isCurrentUser ? BubbleNip.rightTop : BubbleNip.leftBottom,
              color: isCurrentUser ? Colors.blue : Colors.white,
              child: Column(
                  crossAxisAlignment: isCurrentUser
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "$name",
                      style: TextStyle(
                        color: isCurrentUser ? Colors.white : Colors.black,
                      ),
                    ),
                    SelectableText(
                      "$message",
                      style: TextStyle(
                        color: isCurrentUser ? Colors.white : Colors.black,
                      ),
                    ),
                  ]),
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Container(
              margin: isCurrentUser
                  ? EdgeInsets.only(right: sx(20), left: sx(0))
                  : EdgeInsets.only(right: sx(120), left: sx(20)),
              child: Text(
                time,
                style: TextStyle(
                  color: isCurrentUser ? Colors.black : Colors.black,
                  fontSize: sy(7),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: sy(5),
          )
        ],
      );
    });
  }
}

class PicMessageChatTile extends StatelessWidget {
  final double minValue = 8.0;
  final String? message;
  final String name;
  final String time;

  final bool isCurrentUser;

  PicMessageChatTile({this.message, required this.isCurrentUser,required this.name,required this.time});
  @override
  Widget build(BuildContext context) {
    //String? formattedDate = DateFormat('kk:mm:a ').format(DateTime.now());

    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageViewer(url: message!)));
        },
        child: Column(
          crossAxisAlignment:
          isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: sy(5),
                bottom: sy(5),
              ),
              child: Bubble(
                style: BubbleStyle(
                  radius: Radius.circular(10),
                  padding: BubbleEdges.all(
                    sy(7),
                  ),
                ),
                // radius: Radius.elliptical(40, 40),
                margin: isCurrentUser
                    ? BubbleEdges.only(
                  right: sx(15),
                  left: sx(115),
                )
                    : BubbleEdges.only(
                  right: sx(115),
                  left: sx(15),
                ),
                // nip: isCurrentUser ? BubbleNip.rightTop : BubbleNip.leftBottom,
                color: isCurrentUser ? Colors.blue : Colors.white,
                child: Column(
                    crossAxisAlignment: isCurrentUser
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "$name",
                        style: TextStyle(
                          color: isCurrentUser ? Colors.white : Colors.black,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.25,
                        width: MediaQuery.of(context).size.width*0.50,
                        child:
                        FadeInImage(
                          image: NetworkImage("$message"),
                          placeholder: AssetImage("assets/images/placeHolder.png"),
                          imageErrorBuilder: (context,i,error)=>Image.asset("assets/images/placeHolder.png",fit: BoxFit.cover,),
                          fit: BoxFit.cover,

                        )

                        //Image.network("$message",fit: BoxFit.cover,),
                      )

                      // SelectableText(
                      //   "$message",
                      //   style: TextStyle(
                      //     color: isCurrentUser ? Colors.white : Colors.black,
                      //   ),
                      // ),

                    ]),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Container(
                margin: isCurrentUser
                    ? EdgeInsets.only(right: sx(20), left: sx(0))
                    : EdgeInsets.only(right: sx(120), left: sx(20)),
                child: Text(
                  time,
                  style: TextStyle(
                    color: isCurrentUser ? Colors.black : Colors.black,
                    fontSize: sy(7),
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: sy(5),
            )
          ],
        )
      );
    });
  }
}


class PdfMessageChatTile extends StatelessWidget {
  final double minValue = 8.0;
  final String? message;
  final String name;
  final String time;

  final bool isCurrentUser;

  PdfMessageChatTile({this.message, required this.isCurrentUser,required this.name,required this.time});
  @override
  Widget build(BuildContext context) {
    //String? formattedDate = DateFormat('kk:mm:a ').format(DateTime.now());

    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PDFWidget(url: message!)));
          },
          child: Column(
            crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: sy(5),
                  bottom: sy(5),
                ),
                child: Bubble(
                  style: BubbleStyle(
                    radius: Radius.circular(10),
                    padding: BubbleEdges.all(
                      sy(7),
                    ),
                  ),
                  // radius: Radius.elliptical(40, 40),
                  margin: isCurrentUser
                      ? BubbleEdges.only(
                    right: sx(15),
                    left: sx(115),
                  )
                      : BubbleEdges.only(
                    right: sx(115),
                    left: sx(15),
                  ),
                  // nip: isCurrentUser ? BubbleNip.rightTop : BubbleNip.leftBottom,
                  color: isCurrentUser ? Colors.blue : Colors.white,
                  child: Column(
                      crossAxisAlignment: isCurrentUser
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "$name",
                          style: TextStyle(
                            color: isCurrentUser ? Colors.white : Colors.black,
                          ),
                        ),
                        Container(
                          height:70, //MediaQuery.of(context).size.height*0.25,
                          width: 70,//MediaQuery.of(context).size.width*0.50,
                          child: Image.asset("assets/images/pdf.png",height: 70,width: 70,)//Image.network("$message",fit: BoxFit.cover,),
                        )

                      ]),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                  margin: isCurrentUser
                      ? EdgeInsets.only(right: sx(20), left: sx(0))
                      : EdgeInsets.only(right: sx(120), left: sx(20)),
                  child: Text(
                    time,
                    style: TextStyle(
                      color: isCurrentUser ? Colors.black : Colors.black,
                      fontSize: sy(7),
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: sy(5),
              )
            ],
          )
      );
    });
  }
}