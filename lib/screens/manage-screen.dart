import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/screens/following_screen.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/widgets/anim_search_widget.dart';
import 'package:einstien_academy_flutter/widgets/follower_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ManageScreen extends StatefulWidget {
  int? index;
  String? title;
  ManageScreen({Key? key, this.title, this.index}) : super(key: key);

  @override
  _ManageScreenState createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  TextEditingController textController = TextEditingController();
  final List<Tab> selectTabs = <Tab>[
    Tab(text: 'Followings'),
    Tab(text: 'Followers'),
  ];
  bool active = true;
  callback(bool data) {
    setState(() {
      active = data;
    });
  }

  @override
  void initState() {
   // Provider.of<AuthProvider>(context,listen: false).callGetFollowers(Provider.of<AuthProvider>(context,listen: false).user!.id.toString());
   // Provider.of<AuthProvider>(context,listen: false).callGetFollowings(Provider.of<AuthProvider>(context,listen: false).user!.id.toString());

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.index!,
      length: selectTabs.length,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(244, 247, 254, 1),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          bottom: PreferredSize(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
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
                            widget.index == 0
                                ? "Followers"
                                : "Followings",
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
                        width: 340.w,
                        textController: textController,
                        onChanged: (value){},
                        onSuffixTap: () {
                          setState(() {
                            textController.clear();
                          });
                        },
                        onPrefixTap: () {
                          setState(() {
                            active = !active;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
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
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(30.0.h),
          ),
        ),
        body: Consumer<AuthProvider>(
          builder: (context,i,_){
            return //i.followingsData!=null?
            SafeArea(
              child: Column(
                children: [
                  TabBar(
                    onTap: (value) {
                      setState(() {
                        widget.index == 0 ? widget.index = 1 : widget.index = 0;
                      });
                      print("${widget.index}");
                    },
                    tabs: selectTabs,
                    labelColor: Theme.of(context).primaryColor,
                    labelStyle:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                    // isScrollable: true,
                    unselectedLabelColor: Colors.grey.shade700,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [FollowersScreen(), FollowingScreen()],
                    ),
                  ),
                ],
              ),
            );
                //:LoadingWidget();
          },
        )


      ),
    );

  }
}
