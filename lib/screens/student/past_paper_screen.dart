import 'package:einstien_academy_flutter/models/past_papers_model.dart';
import 'package:einstien_academy_flutter/providers/student_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/anim_search_widget.dart';
import 'package:einstien_academy_flutter/widgets/student/past_paper_widget.dart';
import 'package:einstien_academy_flutter/widgets/student/student_filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PastPaperScreen extends StatefulWidget {
  const PastPaperScreen({Key? key}) : super(key: key);

  @override
  _PastPaperScreenState createState() => _PastPaperScreenState();
}

class _PastPaperScreenState extends State<PastPaperScreen> {
  var navigationService = locator<NavigationService>();
  List pastPaperList = [
    {
      "type": "DOC",
      "title": "Sustainable Marketing Secrets\nand busniess growth",
      "image": "assets/images/001.jpeg",
      "name": "Bella David",
      "color": Color.fromRGBO(239, 83, 80, 1),
      "field": "Teacher",
    },
    {
      "type": "PDF",
      "title": "Sustainable Marketing Secrets\nand busniess growth",
      "image": "assets/images/4.jpg",
      "name": "Mary Jones",
      "field": "Teacher",
      "color": Color.fromRGBO(30, 144, 241, 1),
    },
    {
      "type": "PPT",
      "title": "Sustainable Marketing Secrets\nand busniess growth",
      "image": "assets/images/005.jpeg",
      "name": "Jennifer Paul",
      "field": "Teacher",
      "color": Color.fromRGBO(225, 127, 0, 1),
    },
    {
      "type": "PDF",
      "title": "Sustainable Marketing Secrets\nand busniess growth",
      "image": "assets/images/003.jpeg",
      "name": "Bella David",
      "field": "Teacher",
      "color": Color.fromRGBO(239, 83, 80, 1),
    },
  ];
  List<PastPapersModel> dataList=[];

  void filterSearchResults(String query) {
    List<PastPapersModel> dummySearchList = [];
    dummySearchList.addAll(dataList);
    if(query.isNotEmpty) {
      List<PastPapersModel> dummyListData = [];
      dummySearchList .forEach((item) {
        if(item.title.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      if(dummyListData.isNotEmpty){
        Provider.of<StudentProvider>(context,listen: false).studentPastPapersSearch(dummyListData);

      }else{
        Provider.of<StudentProvider>(context,listen: false).clearPastPapers();
      }
      return;
    }

  }

  bool noData=false;

  @override
  void initState() {
    Provider.of<StudentProvider>(context,listen: false).pastPapersData.clear();
    Provider.of<StudentProvider>(context,listen: false).callGetPastPapers().then((value){
      if(value=="noData"){
        setState(() {
          noData=true;
        });
      }
      dataList.addAll(Provider.of<StudentProvider>(context,listen: false).pastPapersData);
    });
    super.initState();
  }
  bool active = true;
  callback(bool data) {
    setState(() {
      active = data;
    });
  }
  final cnt= TextEditingController();



  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(
        244,
        247,
        254,
        1,
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(top: active? 23.0.h:3),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                active
                    ? Row(
                  children: [
                    InkWell(
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
                      width: 10.w,
                    ),
                    Text(
                      "Past Papers",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
                    : Container(),
                AnimSearchBar(
                  color: Colors.transparent,
                  callback: callback,
                  width: width*0.9,


                  textController: cnt,
                  onSuffixTap: () {
                    // //Navigator.pop(context);
                    // setState(() {
                    //   active = !active;
                    // });
                  },
                  onChanged: (value){
                    filterSearchResults(value);
                    if(value.isEmpty){
                      setState(() {
                        Provider.of<StudentProvider>(context,listen: false).studentPastPapersSearch(dataList);
                        // studymaterialList.clear();
                        // studymaterialList.addAll(abcList);
                      });


                    }
                  },

                  onPrefixTap: () {
                    setState(() {
                      active = !active;
                    });
                  },

                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Row(
            //       children: [
            //         GestureDetector(
            //           onTap: () {
            //             navigationService.closeScreen();
            //             //navigationService.navigateTo(HomeScreenRoute);
            //           },
            //           child: Icon(
            //             Icons.keyboard_arrow_left_rounded,
            //             size: 30.h,
            //             color: Colors.white,
            //           ),
            //         ),
            //         SizedBox(
            //           width: 10.w,
            //         ),
            //         Text(
            //           "Past Papers",
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 16.sp,
            //               fontWeight: FontWeight.bold),
            //           textAlign: TextAlign.center,
            //         ),
            //       ],
            //     ),
            //     IconButton(
            //       onPressed: () {
            //         navigationService.navigateTo(SearchScreenRoute);
            //       },
            //       icon: Image.asset(
            //         "assets/images/search.png",
            //         scale: 1,
            //         height: 20.h,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ],
            // ),
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
      body: Consumer<StudentProvider>(
        builder: (context,i,_){
          return noData?Center(child: Text("No Data at the moment"),): dataList.isNotEmpty? SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "All Past Paper",
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
                      // InkWell(
                      //   onTap: () {
                      //     // showDialog(
                      //     //     context: context,
                      //     //     builder: (BuildContext context) =>
                      //     //         StudentFilterDialog()
                      //     // );
                      //   },
                      //   child: Image.asset(
                      //     "assets/images/filters.png",
                      //     color: Color.fromRGBO(
                      //       68,
                      //       79,
                      //       84,
                      //       1,
                      //     ),
                      //     scale: 3,
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ListView.separated(
                    itemCount: i.pastPapersData.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 15.h,
                      );
                    },
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return PastPaperWidget(
                        data: i.pastPapersData[index],
                      );
                    },
                  )
                ],
              ),
            ),
          ):LoadingWidget();
        },
      )
    );
  }
}
