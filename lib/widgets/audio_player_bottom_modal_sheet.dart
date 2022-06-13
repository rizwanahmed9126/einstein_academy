//import 'package:audioplayer/audioplayer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//import 'package:audio_manager/audio_manager.dart';

class AudioPlayerBottomModalSheet extends StatefulWidget {
  final String url;
  const AudioPlayerBottomModalSheet({Key? key,required this.url}) : super(key: key);

  @override
  _AudioPlayerBottomModalSheetState createState() =>
      _AudioPlayerBottomModalSheetState();
}

class _AudioPlayerBottomModalSheetState
    extends State<AudioPlayerBottomModalSheet> {
  String _platformVersion = 'Unknown';
  bool isPlaying1 = false;
  Duration? _duration;
  Duration? _position;
  double? _slider;
  double? _sliderVolume;
  String? _error;
  num curIndex = 0;
  //PlayMode playMode = AudioManager.instance.playMode;

  AudioPlayer audioPlayer = AudioPlayer();

  final list = [
    {
      "title": "network",
      "desc": "network resouce playback",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
      "coverUrl": "https://homepages.cae.wisc.edu/~ece533/images/airplane.png"
    }
  ];
  bool playing=false;
  play(){
    audioPlayer.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
      //setState(() => duration = d);
    });

  }

  late AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  String currentTime = "0:00:00";
  String completeTime = "0:00:00";
  int maxduration = 100;
  int currentpos=0;

  @override
  void initState() {
    super.initState();

    player.setUrl('${widget.url}');

    player.onAudioPositionChanged.listen((Duration duration) {

      setState(() {
        currentpos=duration.inMilliseconds;
        currentTime = duration.toString().split(".")[0];
      });
    });

    player.onDurationChanged.listen((Duration duration) {
      maxduration = duration.inMilliseconds;

      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });
    player.onPlayerCompletion.listen((event) {
      setState(() {
        isPlaying=false;
      });
    });
    // play();
    // audioPlayer.play("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3");

    // initPlatformState();
    // setupAudio();
    // AudioManager.instance.start(
    //     "assets/audio.mp3",
    //     // "network format resource"
    //     // "local resource (file://${file.path})"
    //     "title",
    //     desc: "desc",
    //     // cover: "network cover image resource"
    //     cover: "assets/ic_launcher.png")
    //     .then((err) {
    //   print(err);
    // });
  }

  @override
  void dispose() {
    // 释放所有资源
    player.stop();
    super.dispose();
  }

  // void setupAudio() {
  //   List<AudioInfo> _list = [];
  //   list.forEach((item) => _list.add(AudioInfo(item["url"]!,
  //       title: item["title"]!,
  //       desc: item["desc"]!,
  //       coverUrl: item["coverUrl"]!)));
  //
  //   AudioManager.instance.audioList = _list;
  //   AudioManager.instance.intercepter = true;
  //   AudioManager.instance.play(auto: false);
  //
  //   AudioManager.instance.onEvents((events, args) {
  //     print("$events, $args");
  //     switch (events) {
  //       case AudioManagerEvents.start:
  //         print(
  //             "start load data callback, curIndex is ${AudioManager.instance.curIndex}");
  //         _position = AudioManager.instance.position;
  //         _duration = AudioManager.instance.duration;
  //         _slider = 0;
  //         setState(() {});
  //         AudioManager.instance.updateLrc("audio resource loading....");
  //         break;
  //       case AudioManagerEvents.ready:
  //         print("ready to play");
  //         _error = null;
  //         _sliderVolume = AudioManager.instance.volume;
  //         _position = AudioManager.instance.position;
  //         _duration = AudioManager.instance.duration;
  //         setState(() {});
  //         // if you need to seek times, must after AudioManagerEvents.ready event invoked
  //         // AudioManager.instance.seekTo(Duration(seconds: 10));
  //         break;
  //       case AudioManagerEvents.seekComplete:
  //         _position = AudioManager.instance.position;
  //         _slider = _position!.inMilliseconds / _duration!.inMilliseconds;
  //         setState(() {});
  //         print("seek event is completed. position is [$args]/ms");
  //         break;
  //       case AudioManagerEvents.buffering:
  //         print("buffering $args");
  //         break;
  //       case AudioManagerEvents.playstatus:
  //         isPlaying = AudioManager.instance.isPlaying;
  //         setState(() {});
  //         break;
  //       case AudioManagerEvents.timeupdate:
  //         _position = AudioManager.instance.position;
  //         _slider = _position!.inMilliseconds / _duration!.inMilliseconds;
  //         setState(() {});
  //         AudioManager.instance.updateLrc(args["position"].toString());
  //         break;
  //       case AudioManagerEvents.error:
  //         _error = args;
  //         setState(() {});
  //         break;
  //       case AudioManagerEvents.ended:
  //         AudioManager.instance.next();
  //         break;
  //       case AudioManagerEvents.volumeChange:
  //         _sliderVolume = AudioManager.instance.volume;
  //         setState(() {});
  //         break;
  //       default:
  //         break;
  //     }
  //   });
  // }

  // Future<void> initPlatformState() async {
  //   String platformVersion;
  //   try {
  //     platformVersion = await AudioManager.instance.platformVersion;
  //   } on PlatformException {
  //     platformVersion = 'Failed to get platform version.';
  //   }
  //   if (!mounted) return;
  //
  //   setState(() {
  //     _platformVersion = platformVersion;
  //   });
  // }

  int change = 1;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 18.w, right: 18.w, top: 18.0.h, bottom: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Text(
                        "Sustainable Marketing Secrets and Buisness Growth",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: Colors.black),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          audioPlayer.stop();
                        },
                        icon: Icon(Icons.close,color: Colors.black,))
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Audio Material",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: Colors.grey.shade400),
                ),
                SizedBox(
                  height: 5.h,
                ),
                // ListView.builder(
                //   padding: EdgeInsets.only(),
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   itemCount: 3,
                //   itemBuilder: (BuildContext context, int index) {
                //     return GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           change = index;
                //         });
                //       },
                //       child: Container(
                //         margin: EdgeInsets.only(top: 15.h),
                //         width: double.infinity,
                //         padding: EdgeInsets.fromLTRB(10.w, 20.h, 10.w, 20.h),
                //         decoration: BoxDecoration(
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.grey.withOpacity(0.2),
                //               spreadRadius: 2,
                //               blurRadius: 8,
                //               offset:
                //                   Offset(1, 3), // changes position of shadow
                //             ),
                //           ],
                //           borderRadius: BorderRadius.circular(5),
                //           color: change == index
                //               ? Colors.blue.shade50
                //               : Colors.white,
                //         ),
                //         child: Row(
                //           children: [
                //             Container(
                //               padding: EdgeInsets.fromLTRB(5.w, 6.h, 5.w, 6.h),
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(5),
                //                 color: Theme.of(context).primaryColor,
                //               ),
                //               child: Icon(
                //                 change == index
                //                     ? Icons.pause_rounded
                //                     : Icons.play_arrow,
                //                 color: Colors.white,
                //               ),
                //             ),
                //             SizedBox(
                //               width: 15.w,
                //             ),
                //             Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   "marketing_material " + index.toString(),
                //                   style: TextStyle(
                //                       fontWeight: FontWeight.w500,
                //                       fontSize: 14.sp),
                //                 ),
                //                 Text(
                //                   index.toString() + "0:01:0",
                //                   style: TextStyle(
                //                       fontWeight: FontWeight.w500,
                //                       fontSize: 12.sp,
                //                       color: Colors.grey),
                //                 ),
                //               ],
                //             )
                //           ],
                //         ),
                //       ),
                //     );
                //   },
                // ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade400,
            ),
            child: Column(
              children: [
                bottomPanel(),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }


  Widget bottomPanel() {
    return Column(children: <Widget>[
      SizedBox(
        height: 25,
      ),
      Text(
        "marketing material_" + change.toString(),
        style: TextStyle(
            color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),

      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Slider(

                activeColor: Colors.greenAccent,
                value: double.parse(currentpos.toString()),
                inactiveColor: Colors.grey,

                min: 0,
                max: double.parse(maxduration.toString())+1,
                divisions: maxduration,
                label: "$currentTime",
                onChanged: (double value) async {
                  int seekval = value.round();
                  int result = await player.seek(Duration(milliseconds: seekval));
                  //currentTime = result.toString().split(".")[0];
                  if(result == 1){
                    //seek successful
                    currentpos = seekval;
                  }else{
                    print("Seek unsuccessful.");
                  }
                },
              )
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0,right: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentTime,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  completeTime,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0,right: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: ()async{


                  },
                  iconSize: 36,
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(
                    child: IconButton(
                        icon: Icon(
                          isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.blue.shade400,
                          size: 30,
                        ),
                        onPressed: () {
                          if (isPlaying) {
                            player.pause();

                            setState(() {
                              isPlaying = false;
                            });
                          } else {
                            player.resume();
                            setState(() {
                              isPlaying = true;
                            });
                          }
                        }),
                  ),
                ),
                IconButton(
                    iconSize: 36,
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
                    onPressed: (){}
                ),
              ],
            ),
          ),

          // Container(
          //     width: 240,
          //     height: 50,
          //     decoration: BoxDecoration(
          //       color: Colors.orange[300],
          //       borderRadius: BorderRadius.circular(80),
          //     ),
          //     child: Row(
          //       // mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       // mainAxisSize: MainAxisSize.max,
          //       // mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         IconButton(
          //             icon: Icon(
          //               isPlaying
          //                   ? Icons.pause_circle_filled
          //                   : Icons.play_circle_filled,
          //               color: Colors.white,
          //               size: 30,
          //             ),
          //             onPressed: () {
          //               if (isPlaying) {
          //                 player.pause();
          //
          //                 setState(() {
          //                   isPlaying = false;
          //                 });
          //               } else {
          //                 player.resume();
          //                 setState(() {
          //                   isPlaying = true;
          //                 });
          //               }
          //             }),
          //         IconButton(
          //           icon: Icon(
          //             Icons.stop,
          //             color: Colors.white,
          //             size: 25,
          //           ),
          //           onPressed: () {
          //             player.stop();
          //
          //             setState(() {
          //               isPlaying = false;
          //             });
          //           },
          //         ),
          //         Text(
          //           "   " + currentTime,
          //           style: TextStyle(
          //             fontWeight: FontWeight.w700,
          //             color: Colors.white,
          //           ),
          //         ),
          //         Text(
          //           " | ",
          //           style: TextStyle(
          //             fontWeight: FontWeight.w300,
          //             color: Colors.white,
          //           ),
          //         ),
          //         Text(
          //           completeTime,
          //           style: TextStyle(
          //             fontWeight: FontWeight.w300,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ],
          //     )),

        ],
      ),
      SizedBox(
        height: 25,
      ),

      // SizedBox(
      //   height: 25,
      // ),
      // Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 12),
      //   child: songProgress(context),
      // ),
      // Container(
      //   padding: EdgeInsets.symmetric(vertical: 16),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: <Widget>[
      //       // IconButton(
      //       //     icon: getPlayModeIcon(playMode),
      //       //     onPressed: () {
      //       //       playMode = AudioManager.instance.nextMode();
      //       //       setState(() {});
      //       //     }),
      //       IconButton(
      //           iconSize: 36,
      //           icon: Icon(
      //             Icons.keyboard_arrow_left,
      //             color: Colors.white,
      //           ),
      //           onPressed: () => AudioManager.instance.previous()),
      //       IconButton(
      //         onPressed: () async {
      //           setState(() {
      //             bool playing=true;
      //             if(playing==true){
      //               audioPlayer.pause();
      //             }
      //             else{
      //               audioPlayer.resume();
      //             }
      //           });
      //           bool playing = await AudioManager.instance.playOrPause();
      //           print("await -- $playing");
      //         },
      //         padding: const EdgeInsets.all(0.0),
      //         icon: Container(
      //           // padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(5),
      //               color: Colors.white),
      //           child: Center(
      //             child: Icon(
      //               isPlaying ? Icons.pause : Icons.play_arrow,
      //               size: 30.h,
      //               color: Colors.blue.shade400,
      //             ),
      //           ),
      //         ),
      //       ),
      //       IconButton(
      //           iconSize: 36,
      //           icon: Icon(
      //             Icons.keyboard_arrow_right,
      //             color: Colors.white,
      //           ),
      //           onPressed: () => AudioManager.instance.next()),
      //       // IconButton(
      //       //     icon: Icon(
      //       //       Icons.stop,
      //       //       color: Colors.black,
      //       //     ),
      //       //     onPressed: () => AudioManager.instance.stop()),
      //     ],
      //   ),
      // ),
    ]);
  }

  // Widget getPlayModeIcon(PlayMode playMode) {
  //   switch (playMode) {
  //     case PlayMode.sequence:
  //       return Icon(
  //         Icons.repeat,
  //         color: Colors.black,
  //       );
  //     case PlayMode.shuffle:
  //       return Icon(
  //         Icons.shuffle,
  //         color: Colors.black,
  //       );
  //     case PlayMode.single:
  //       return Icon(
  //         Icons.repeat_one,
  //         color: Colors.black,
  //       );
  //   }
  // }

  Widget songProgress(BuildContext context) {
    return Row(
      children: <Widget>[
        // Text(_formatDuration(_position!),
        //     style: TextStyle(color: Colors.white,fontSize: 9)),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 2,
                  thumbColor: Colors.greenAccent,
                  overlayColor: Colors.greenAccent,
                  thumbShape: RoundSliderThumbShape(
                    disabledThumbRadius: 5,
                    enabledThumbRadius: 5,
                  ),
                  overlayShape: RoundSliderOverlayShape(
                    overlayRadius: 10,
                  ),
                  activeTrackColor: Colors.greenAccent,
                  inactiveTrackColor: Colors.grey,
                ),
                child: Slider(
                  value: _slider ?? 0,
                  onChanged: (value) {
                    setState(() {
                      _slider = value;
                    });
                  },
                  // onChangeEnd: (value) {
                  //   if (_duration != null) {
                  //     Duration msec = Duration(
                  //         milliseconds:
                  //             (_duration!.inMilliseconds * value).round());
                  //     AudioManager.instance.seekTo(msec);
                  //   }
                  // },
                )),
          ),
        ),
        // Text(_formatDuration(_duration!),
        //     style: TextStyle(color: Colors.white,fontSize: 9)),
      ],
    );
  }

  // String _formatDuration(Duration d) {
  //   if (d != d) return "--:--";
  //   int minute = d.inMinutes;
  //   int second = (d.inSeconds > 60) ? (d.inSeconds % 60) : d.inSeconds;
  //   String format = ((minute < 10) ? "0$minute" : "$minute") +
  //       ":" +
  //       ((second < 10) ? "0$second" : "$second");
  //   return format;
  // }
  //
  // Widget volumeFrame() {
  //   return Row(children: <Widget>[
  //     IconButton(
  //         padding: EdgeInsets.all(0),
  //         icon: Icon(
  //           Icons.audiotrack,
  //           color: Colors.black,
  //         ),
  //         onPressed: () {
  //           AudioManager.instance.setVolume(0);
  //         }),
  //     Expanded(
  //         child: Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 0),
  //             child: Slider(
  //               value: _sliderVolume ?? 0,
  //               onChanged: (value) {
  //                 setState(() {
  //                   _sliderVolume = value;
  //                   AudioManager.instance.setVolume(value, showVolume: true);
  //                 });
  //               },
  //             )))
  //   ]);
  // }
}
