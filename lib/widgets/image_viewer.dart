import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatefulWidget {
  final String url;
  const ImageViewer({Key? key,required this.url}) : super(key: key);

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back,color: Colors.white,)
        ),
      ),
      body: Container(
          child: PhotoView(
            imageProvider: NetworkImage("${widget.url}"),
          )
      )
    );
  }
}
