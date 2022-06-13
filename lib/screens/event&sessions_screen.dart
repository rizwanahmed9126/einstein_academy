import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/screens/global.dart';
import 'package:einstien_academy_flutter/screens/zoom_meeting_screen.dart';
import 'package:einstien_academy_flutter/services/navigation_service.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:einstien_academy_flutter/utils/service_locator.dart';
import 'package:einstien_academy_flutter/widgets/events&session_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EventAndSessionScreen extends StatefulWidget {
  const EventAndSessionScreen({Key? key}) : super(key: key);

  @override
  _EventAndSessionScreenState createState() => _EventAndSessionScreenState();
}

class _EventAndSessionScreenState extends State<EventAndSessionScreen> {
  // List sessionList = [
  //   {
  //     "title": "Live Session on Marketing Strategy & Secrets",
  //     "date": "11:30 PM, Dec 2021",
  //     "color": Colors.red,
  //     "users": "21 Participants",
  //     "type": "LIVE",
  //     "urlImage":
  //         "https://cdn.technologyadvice.com/wp-content/uploads/2020/04/Videoconferencingett.png",
  //     "name": " Henry Jack ",
  //   },
  //   {
  //     "title": "Live Session on Marketing Strategy & Secrets",
  //     "date": "1:15 PM, Dec 2021",
  //     "users": "31 Participants",
  //     "color": Colors.black,
  //     "urlImage":
  //         "https://cdn.pixabay.com/photo/2020/05/13/13/32/video-conference-5167472__480.jpg",
  //     "type": "50:00",
  //     "name": " Mathew Wade",
  //   },
  //   {
  //     "title": "Live Session on Marketing Strategy & Secrets",
  //     "date": "2:15 PM, Nov 2021",
  //     "users": "10 Participants",
  //     "color": Colors.black,
  //     "urlImage": "https://www.viewsonic.com/library/wp-content/uploads/2019/07/library-website-02.jpg",
  //     "type": "1:05:00",
  //     "name": " Jennifer Paul",
  //   },
  //   {
  //     "title": "Live Session on Marketing Strategy & Secrets",
  //     "date": "5:50 PM, Jan 2021",
  //     "users": "11 Participants",
  //     "color": Colors.black,
  //     "urlImage":
  //         "https://www.jotform.com/blog/wp-content/uploads/2020/04/video-conference-tools-b0d4ff-01.png",
  //     "type": "20:00",
  //     "name": " Bella David",
  //   }
  // ];
  bool noData=false;

  @override
  void initState() {
    Provider.of<AuthProvider>(context,listen: false). zoomMeetingData.clear();
    Provider.of<AuthProvider>(context,listen: false).callGetZoomMeetingData().then((value){
      if(value=="noData"){
        setState(() {
          noData=true;
        });
      }
    });
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
          elevation: 0,
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
                        //navigationService.navigateTo(HomeScreenRoute);
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
                      "Event & Sessions",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                // IconButton(
                //   onPressed: () {
                //     //navigationService.navigateTo(SearchScreenRoute);
                //   },
                //   icon: Image.asset(
                //     "assets/images/search.png",
                //     scale: 1,
                //     height: 20.h,
                //     color: Colors.white,
                //   ),
                // ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigationService.navigateTo(CreatEventSessionScreenRoute);
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          child: Image(
            image: AssetImage("assets/images/plusicon.png"),
            width: 20.w,
            height: 20.h,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "All Events & Sessions",
                    style: TextStyle(
                      color: Color.fromRGBO(
                        68,
                        79,
                        84,
                        1,
                      ),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
            noData?Center(child: Text("No Meetings at the Moment"),):  Consumer<AuthProvider>(
                  builder: (context,i,_){
                    return i.zoomMeetingData.isNotEmpty? ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 15.h);
                      },
                      itemCount: i.zoomMeetingData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>ZoomMeetingScreen()));
                          },
                          child: EventsAndSessionWidget(
                            data: i.zoomMeetingData[index],
                          ),
                        );
                      },
                    ):LoadingWidget();

                  })
            ],
          ),
        ),
      ),
    );
  }
}
