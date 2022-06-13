import 'dart:io';

import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/services/util_service.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';

class PDFWidget extends StatefulWidget {
  final String url;
  const PDFWidget({Key? key,required this.url}) : super(key: key);

  @override
  State<PDFWidget> createState() => _PDFWidgetState();
}

class _PDFWidgetState extends State<PDFWidget> {

  var navigationService = locator<NavigationService>();

  PdfViewerController? _pdfViewerController;
  var imageUrl = "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf";
  bool downloading = true;
  String downloadingStr = "No data";
  String savePath = "";

  // Future downloadFile() async {
  //   try {
  //     // Dio dio = Dio();
  //
  //     String fileName = imageUrl.substring(imageUrl.lastIndexOf("/") + 1);
  //
  //     savePath = (await _findLocalPath())!;
  //     final taskId = await FlutterDownloader.enqueue(
  //       url: imageUrl,
  //       savedDir: savePath,
  //       showNotification: true, // show download progress in status bar (for Android)
  //       openFileFromNotification: true, // click on notification to open downloaded file (for Android)
  //     );
  //     print(taskId);
  //
  //     // await dio.download(imageUrl, savePath, onReceiveProgress: (rec, total) {
  //     //   setState(() {
  //     //     downloading = true;
  //     //     // download = (rec / total) * 100;
  //     //     downloadingStr =
  //     //     "Downloading pdf : $rec" ;
  //     //
  //     //   });
  //     //
  //     //
  //     // } );
  //     // setState(() {
  //     //   downloading = false;
  //     //   downloadingStr = "Completed";
  //     // });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<String?> _findLocalPath() async {
  //   var externalStorageDirPath;
  //   if (Platform.isAndroid) {
  //     try {
  //       externalStorageDirPath = await AndroidPathProvider.downloadsPath;
  //     } catch (e) {
  //       final directory = await getExternalStorageDirectory();
  //       externalStorageDirPath = directory?.path;
  //     }
  //   } else if (Platform.isIOS) {
  //     externalStorageDirPath =
  //         (await getApplicationDocumentsDirectory()).absolute.path;
  //   }
  //   return externalStorageDirPath;
  // }





  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    //_setAwaitOptions();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }


  var utilService = locator<UtilService>();

  OverlayEntry? _overlayEntry;
  void _showContextMenu(BuildContext context,PdfTextSelectionChangedDetails details) {
    final OverlayState _overlayState = Overlay.of(context)!;
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalSelectedRegion!.center.dy - 55,
        left: details.globalSelectedRegion!.bottomLeft.dx,
        child:
        RaisedButton(

          child: Text('Copy',style: TextStyle(fontSize: 15)),
          onPressed: (){
            speakText=details.selectedText;
            Clipboard.setData(ClipboardData(text: details.selectedText)
            );
            _pdfViewerController!.clearSelection();
          },
          color: Colors.white,elevation: 10,
        ),
      ),
    );
    _overlayState.insert(_overlayEntry!);
  }

  FlutterTts flutterTts = FlutterTts();
  TtsState ttsState = TtsState.stopped;


  String? speakText;


  Future _speak() async{
    var result = await flutterTts.speak(speakText!);
    if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  Future _pause() async{
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }
  bool isPlaying=true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
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
                        //navigationService.navigateTo(StudyMaterialScreenRoute);
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left_rounded,
                        size: 30.h,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "File Viewer",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
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
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: (){
                if(speakText==null){
                  utilService.showToast('Please copy the text to speak');
                  return;
                }
                if(isPlaying==true){
                  _speak();
                }
                else{
                  _pause();
                }
                setState(() {
                  isPlaying=!isPlaying;
                });

              },
              child: Container(
                height:60,
                width:60,

                decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle
                ),
                child: isPlaying? Icon(Icons.play_arrow):Icon(Icons.pause),
              ),
            ),

          ],
        ),
        body: Container(
            child: SfPdfViewer.network(
              '${widget.url}',
              onTextSelectionChanged: (PdfTextSelectionChangedDetails details) {
                //setState(() {

                //});
                print('selected text: ${details.selectedText}');
                if (details.selectedText == null && _overlayEntry != null) {
                  _overlayEntry!.remove();
                  _overlayEntry = null;
                } else if (details.selectedText != null && _overlayEntry == null) {
                  _showContextMenu(context, details);
                }
              },
              controller: _pdfViewerController,
            )
        )
    );
  }
}

enum TtsState { playing, stopped, paused, continued }



// class View extends StatelessWidget {
//   final String url;
//   const View({Key? key,required this.url}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: WebView(
//         initialUrl: '$url',
//       )
//     );
//   }
// }




