import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/study_material_list.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

var navigationService = locator<NavigationService>();

class _SearchScreenState extends State<SearchScreen> {
  List<dynamic> studymaterialList=["Bella David","Mary Jones"];

  // List<Map<String, dynamic>> studymaterialList = [
  //   {
  //     "type": "DOC",
  //     "title": "Sustainable Marketing Secrets\nand busniess growth",
  //     "image": "assets/images/001.jpeg",
  //     "name": "Bella David",
  //     "color": Color.fromRGBO(239, 83, 80, 1),
  //     "field": "Teacher",
  //     "num": "+9",
  //   },
  //   {
  //     "type": "assets/images/high-volume.png",
  //     "title": "Sustainable Marketing Secrets\nand busniess growth",
  //     "image": "assets/images/4.jpg",
  //     "name": "Mary Jones",
  //     "field": "Teacher",
  //     "color": Color.fromRGBO(30, 144, 241, 1),
  //     "num": "+4",
  //   },
  //   {
  //     "type": "assets/images/high-volume.png",
  //     "title": "Sustainable Marketing Secrets\nand busniess growth",
  //     "image": "assets/images/005.jpeg",
  //     "name": "Jennifer Paul",
  //     "field": "Teacher",
  //     "color": Color.fromRGBO(225, 127, 0, 1),
  //     "num": "+2",
  //   },
  //   {
  //     "type": "assets/images/play-button.png",
  //     "title": "Sustainable Marketing Secrets\nand busniess growth",
  //     "image": "assets/images/003.jpeg",
  //     "name": "Bella David",
  //     "field": "Teacher",
  //     "color": Color.fromRGBO(239, 83, 80, 1),
  //     "num": "+11",
  //   },
  // ];
  TextEditingController searchController = TextEditingController();
  List<dynamic> abcList=[];

  String tagId = ' ';
  void active(
    dynamic val,
  ) {
    setState(() {
      tagId = val;
    });
  }

  @override
  void initState() {
    searchController = new TextEditingController();
    abcList.addAll(studymaterialList);
    super.initState();
  }



  var navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
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
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.w, 0, 0.w, 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 24.h,
                        ),
                      ),
                      Container(
                        width: 300.w,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: searchController,
                          autocorrect: true,
                          style: TextStyle(
                            color: Color.fromRGBO(154, 183, 208, 1),
                            fontSize: 12.sp,
                          ),
                          onChanged: (value){
                            // filterSearchResults(value);
                            // if(value.isEmpty){
                            //   setState(() {
                            //     studymaterialList.clear();
                            //     studymaterialList.addAll(abcList);
                            //   });
                            //
                            //
                            // }

                          },
                          decoration: InputDecoration(

                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 20,
                            ),
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(154, 183, 208, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.r),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(154, 183, 208, 1),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.r),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1,
                              ),
                            ),
                            suffixIcon: Icon(
                              Icons.search,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            preferredSize: Size.fromHeight(0),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              "Showing Search Results",
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
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 55),
                  shrinkWrap: true,
                  itemCount: studymaterialList.length,
                  itemBuilder: (ctx, i) {
                    return abc(studymaterialList[i]);
                    //   StudyMaterialList(
                    //   data: studymaterialList[i],
                    //   tag: studymaterialList[i]['id'],
                    //   action: active,
                    //   active: tagId == studymaterialList[i]['id']
                    //       ? true
                    //       : false,
                    // );
                  }),
            ),
          ],
        ),
      ),
    );
  }
  Widget abc(String value){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 30,
        width: 200,
        color: Colors.grey,
        child: Text(value),
      ),
    );
  }
}


