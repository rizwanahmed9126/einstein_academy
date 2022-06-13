import 'dart:async';
import 'dart:io';
import 'package:einstien_academy_flutter/models/user.dart';
import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/providers/subject_provider.dart';
import 'package:einstien_academy_flutter/screens/student/home_screen_student.dart';
import 'package:einstien_academy_flutter/screens/teacher/home_screen_teacher.dart';
import 'package:einstien_academy_flutter/services/storage_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../utils/routes.dart';
import '../services/navigation_service.dart';
import '../utils/service_locator.dart';
// import '../widgets/exit_alert_dialog.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var navigationService = locator<NavigationService>();
  var storageService = locator<StorageService>();

  loadData1() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    if (!kIsWeb) {
      var token = await FirebaseMessaging.instance.getToken();
      print('this is the token--${token.toString()}');
      if (token!.isNotEmpty) {

        print("toe: $token");
        Provider.of<AuthProvider>(context,listen: false).saveFcmToken(token.toString());

        //Provider.of<AuthProvider>(context,listen: false).callFcmToken(token.toString());
        //Provider.of<AuthProvider>(context,listen: false).saveFcmToken(token.toString());
      }

      AndroidNotificationChannel channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        //'This channel is used for important notifications.', // description
        importance: Importance.high,
      );

      await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
      await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print(message.notification!.title);
      print(message.notification!.body);

      // firestoreInstance.collection('notificationsData'). add({
      //   'title': '${message.notification!.title}',
      //   'body':'${message.notification!.body}',
      // });

      // if (Platform.isAndroid)
      flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title,
          message.notification!.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel',
              'High Importance Notifications',
              //'This channel is used for important notifications.',
              importance: Importance.high,
              priority: Priority.high,
            ),
            iOS: IOSNotificationDetails(),
          )
      );
      //if(Platform.isIOS)
        // flutterLocalNotificationsPlugin.show(
        //     0,
        //     message.notification!.title,
        //     message.notification!.body,
        //     NotificationDetails(
        //       android: AndroidNotificationDetails(
        //         'high_importance_channel',
        //         'High Importance Notifications',
        //         //'This channel is used for important notifications.',
        //         importance: Importance.high,
        //         priority: Priority.high,
        //       ),
        //       iOS: IOSNotificationDetails(
      
        //       ),
        //     ));
    });

    // await Provider.of<AuthProvider>(context, listen: false).callUserInfo(context).then((value) async {
    //   Provider.of<AuthProvider>(context, listen: false).saveUid(value.uid.toString());
    //
    //   await Provider.of<AuthProvider>(context, listen: false).callAdvert().then((value) {
    //     navigationService.navigateTo(HomeScreenRoute);
    //   });
    // });
  }

  getData() {
    Provider.of<SubjectProvider>(context, listen: false)
        .fetchAllSubject()
        .then((value) {
      if (value == "fail") {
        setState(() {
          //noData=true;
        });
      } else {
        //getGradeata = Provider.of<SubjectProvider>(context, listen: false).getGradeApi;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    loadData1();

    Timer(Duration(seconds: 3), () async {
      try {
        var getUser = await this.storageService.getData("user");
        if (getUser != null) {
          var token = await this.storageService.getData("token");
          print(token);
          if (token != null) {
            User user =
                User.fromJson(await this.storageService.getData("user"));
            Provider.of<AuthProvider>(context, listen: false).setuser(user);

            user.type == 'STUDENT'
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreenStudent()))
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreenTeacher()));
          } else {
            navigationService.navigateTo(LoginScreenRoute);
          }
        } else {
          navigationService.navigateTo(SelectAccountScreenRoute);
        }
      } catch (err) {
        navigationService.navigateTo(SelectAccountScreenRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Future<bool> _onBackPressed() {
    //   return showDialog(
    //         context: context,
    //         builder: (context) => ExitAlertDialog(),
    //       ) ??
    //       false;
    // }

    return WillPopScope(
      onWillPop: null,
      child: Stack(
          // fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash-bg.png'),
                    fit: BoxFit.fill),
              ),
            ),
            Positioned(
              child: Align(
                  alignment: FractionalOffset.center,
                  child: Container(
                    child:
                        // Container(child: Image.asset('assets/images/logo.png')),
                        ShowUpAnimation(
                      delayStart: Duration(milliseconds: 200),
                      animationDuration: Duration(seconds: 1),
                      curve: Curves.bounceIn,
                      direction: Direction.vertical,
                      offset: 0.7,
                      child: Image.asset(
                        'assets/images/splash-logo.png',
                        scale: 3.5,
                      ),
                    ),
                  )),
            ),
          ]),
    );
  }
}
