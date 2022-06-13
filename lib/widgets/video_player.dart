import 'package:chewie/chewie.dart';
import 'package:einstien_academy_flutter/providers/teacher_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  const VideoPlayerWidget({Key? key,required this.url}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {

  final GlobalKey<ScaffoldState> drawerKey = new GlobalKey<ScaffoldState>();

  //final videoPlayerController = VideoPlayerController.network('${Provider.of<TeacherProvider>(context,listen: false).videoUrl}');

  // getData()async{
  //   await Provider.of<TeacherProvider>(context,listen: false).videoPlayerController!.initialize();
  // }


  // getData(){
  //  // Provider.of<TeacherProvider>(context,listen: false).videoPlayerController!.addListener(() {
  //     if(Provider.of<TeacherProvider>(context,listen: false).videoPlayerController!.value.position.inSeconds<1){
  //       print("initail value");
  //     }
  //     if(Provider.of<TeacherProvider>(context,listen: false).videoPlayerController!.value.position.inSeconds>1){
  //       print("played value");
  //     }
  //  // });
  // }

  // @override
  // void dispose() {
  //   Provider.of<TeacherProvider>(context,listen: false).videoPlayerController!.dispose();
  //   //chewieController.dispose();
  //   super.dispose();
  // }
  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      body:
      Chewie(
        controller: ChewieController(
            videoPlayerController: //Provider.of<TeacherProvider>(context,listen: false).videoPlayerController!,
            VideoPlayerController.network('${widget.url}'),
            autoPlay: false,
            showControlsOnInitialize: false,
            autoInitialize: true,
            looping: false,
            //cupertinoProgressColors: Colors.blue,

            //overlay: Center(child: CircularProgressIndicator(color: Colors.blue,),),
            placeholder: Center(child: CircularProgressIndicator(color: Colors.blue,),)
        ),
      ),
    );
  }
}




// class MyVideoPlayerPage extends StatefulWidget {
//   @override
//   _MyVideoPlayerPageState createState() => _MyVideoPlayerPageState();
// }
//
// class _MyVideoPlayerPageState extends State<MyVideoPlayerPage> {
//   VideoPlayerController? videoPlayerController;
//   Future<void>? videoPlayerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     videoPlayerController = VideoPlayerController.network(
//         'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
//     videoPlayerFuture = videoPlayerController!.initialize();
//     videoPlayerController!.setLooping(true);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Flutter Video Player Sample')),
//         body: FutureBuilder(
//           future: videoPlayerFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return AspectRatio(
//                 aspectRatio: videoPlayerController!.value.aspectRatio,
//                 child: VideoPlayer(videoPlayerController!),
//               );
//             } else {
//               return Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               videoPlayerController!.value.isPlaying
//                   ? videoPlayerController!.pause()
//                   : videoPlayerController!.play();
//             });
//           },
//           child: Icon(
//             videoPlayerController!.value.isPlaying
//                 ? Icons.pause
//                 : Icons.play_arrow,
//           ),
//         ));
//   }
//
//   @override
//   void dispose() {
//     videoPlayerController!.dispose();
//     super.dispose();
//   }
//
// }






// class VideoPlayerWidget extends StatelessWidget {
//   final String url;
//   const VideoPlayerWidget({Key? key,required this.url}) : super(key: key);
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Chewie(
//         controller: ChewieController(
//           videoPlayerController: VideoPlayerController.network(url),
//           autoPlay: true,
//           autoInitialize: true,
//           looping: false,
//         ),
//       ),
//     );
//   }
// }

