//import 'package:device_preview/device_preview.dart';
import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:einstien_academy_flutter/providers/chat_provider.dart';
import 'package:einstien_academy_flutter/providers/student_provider.dart';
import 'package:einstien_academy_flutter/providers/subject_provider.dart';
import 'package:einstien_academy_flutter/providers/teacher_provider.dart';
import 'package:einstien_academy_flutter/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
//import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import './services/navigation_service.dart';
import './utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FlutterDownloader.initialize(debug: false);
  await Firebase.initializeApp();
  setupLocator();
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) =>
    MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SubjectProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => TeacherProvider()),
        ChangeNotifierProvider(create: (_) => StudentProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () => MaterialApp(
          // builder: DevicePreview.appBuilder,
          title: 'Einstien Academy',
          color: Theme.of(context).backgroundColor,
          debugShowCheckedModeBanner: false,
          // locale: DevicePreview.locale(context),
          navigatorKey: locator<NavigationService>().navigatorKey,

          theme: ThemeData(
            fontFamily: 'Lexend',
            backgroundColor: Color.fromRGBO(
              30,
              144,
              241,
              1,
            ),
          ),
          onGenerateRoute: onGenerateRoute,
          initialRoute:
              SplashScreenRoute, //SearchScreenRoute,//SplashScreenRoute,
          // home: App(),
        ),
      ),
    );
  }
}
