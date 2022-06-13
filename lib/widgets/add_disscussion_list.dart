import 'package:flutter/material.dart';
class AddDicussionList extends StatefulWidget {
  final data;
   AddDicussionList({ this.data}) ;

  @override
  _AddDicussionListState createState() => _AddDicussionListState();
}

class _AddDicussionListState extends State<AddDicussionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
       Row(children: [
          CircleAvatar(
            radius: 18,
            backgroundImage:AssetImage(widget.data['img']),),
        SizedBox(width: 12,),
        Text(widget.data['title'],style: TextStyle(color: Colors.blue.shade600),),
       ],),
       Icon(Icons.close,size:18,color: Colors.grey,)

      ],),
    );
  }
}