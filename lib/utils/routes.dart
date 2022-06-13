import 'package:einstien_academy_flutter/screens/account_verification_screen.dart';
import 'package:einstien_academy_flutter/screens/add_past_paper_screen.dart';
import 'package:einstien_academy_flutter/screens/create_event_session.dart';
import 'package:einstien_academy_flutter/screens/event&sessions_screen.dart';
import 'package:einstien_academy_flutter/screens/following_screen.dart';
import 'package:einstien_academy_flutter/screens/student/home_screen_student.dart';
import 'package:einstien_academy_flutter/screens/teacher/add_study_materials_screen.dart';
// import 'package:einstien_academy_flutter/screens/home_screen.dart';
import 'package:einstien_academy_flutter/screens/manage-screen.dart';
import 'package:einstien_academy_flutter/screens/otp_screen.dart';
import 'package:einstien_academy_flutter/screens/privacy_policy_screen.dart';
import 'package:einstien_academy_flutter/screens/profile_detail.dart';
import 'package:einstien_academy_flutter/screens/student/past_paper_screen.dart';
import 'package:einstien_academy_flutter/screens/edit_profile_screen.dart';
import 'package:einstien_academy_flutter/screens/get_started_screen.dart';
import 'package:einstien_academy_flutter/screens/notification_screen.dart';
import 'package:einstien_academy_flutter/screens/search_screen.dart';
import 'package:einstien_academy_flutter/screens/select_account_screen.dart';
import 'package:einstien_academy_flutter/screens/setting_screen.dart';
import 'package:einstien_academy_flutter/screens/teacher/study_materials_details_screen.dart';
import 'package:einstien_academy_flutter/screens/student/study_notes_details.dart';
import 'package:einstien_academy_flutter/screens/student/study_notes_screen.dart';
import 'package:einstien_academy_flutter/screens/teacher/home_screen_teacher.dart';
import 'package:flutter/material.dart';

import '../screens/reset_screen.dart';
import '../screens/forget_password_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/discussion_board_screen.dart';
import '../screens/add_discussion_board.dart';
import '../screens/student/add_study_notes_screen.dart';
import '../screens/teacher/study_material_screen.dart';
import '../screens/chat_screen.dart';
import '../widgets/audio_player_bottom_modal_sheet.dart';
// import '../screens/match_screen.dart';
// import '../screens/create_campaign_screen.dart';

const SplashScreenRoute = '/splash-screen';
const LoginScreenRoute = '/login-screen';
const SignUpScreenRoute = '/signup-screen';
const ForgetPasswordScreenRoute = '/forgetPassword-Screen';
//const ResetPasswordScreenRoute = '/reset-password-screen';
const DiscussionBoardScreenRoute = '/discussion-board-screen';
const AddDiscussionBoardScreenRoute = '/add-discussion-board-screen';
const GetStartedScreenRoute = '/get-started-screen';
const SelectAccountScreenRoute = '/select-teacher-or-student-screen';
//const FollowersScreenRoute = '/follower-screen';
const NotificationScreenRoute = '/notifications-screen';
const EventAndSessionRoute = '/Event&Session-screen';
const HomeScreenRoute = '/home-screen';
const StudyNotesScreenRoute = '/study-notes-screen';
const EditProfileScreenRoute = '/edit-profile-screen';
const AddStudyMaterialScreenRoute = '/add-study-material-screen';
//const AddPastPaperScreenRoute = '/add-past-paper-screen';
const StudyMaterialScreenRoute = '/study-material-screen';
const AddStudyNotesScreenRoute = '/add-study-notes-screen';
//const ChatScreenRoute = '/chat-screen';
const CreatEventSessionScreenRoute = '/creat-event-session-screen';
const ManageScreenRoute = '/manage-screen';
//const ProfileDetailScreenRoute = '/profile-detail-screen';
const AccountVerificationScreenRoute = '/account-verification-screen';
const PastPaperScreenRoute = '/past-paper-screen';
const OtpScreenRoute = '/otp-screen';
const EventAndSessionScreenRoute = '/event-session-screen';
//const StudyMaterialDetailsScreenRoute = '/study-materials-details-screen';
const AudioPlayerBottomModalSheetRoute = '/audio-screen';
const SearchScreenRoute = '/search-screen';
//const PrivacyPolicyScreenRoute = '/privacy-policy-screen';
//const SettingScreenRoute = '/setting-screen';
//const StudyNotesDetailsScreenRoute = '/study-notes-details-screen';
const HomeScreenTeacherRoute='/home-screen-route';
const HomeScreenStudentRoute='/home-screen-Student';


Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreenRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) => SplashScreen(),
      );

    case LoginScreenRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) => LoginScreen(),
      );

    case StudyMaterialScreenRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) => StudyMaterialScreen(),
      );

    case HomeScreenTeacherRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) => HomeScreenTeacher(),
      );

    case HomeScreenStudentRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) => HomeScreenStudent(),
      );

    case ForgetPasswordScreenRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) => ForgetPasswordScreen(),
      );

    case SignUpScreenRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) => SignUpScreen(),
      );

    case PastPaperScreenRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) => PastPaperScreen(),
      );

    // case ResetPasswordScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (BuildContext context) => ResetPasswordScreen(),
    //   );

    case DiscussionBoardScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => DiscussionBoardScreen());

    case AddDiscussionBoardScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => AddDiscussionBoardScreen());

    case GetStartedScreenRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) => GetStartedScreen(),
      );

    // case FollowersScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (BuildContext context) => FollowingScreen(),
    //   );

    case NotificationScreenRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) => NotificationsScreen(),
      );

    // case StudyMaterialDetailsScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (BuildContext context) => StudyMaterialDetailsScreen(),
    //   );

    // case StudyNotesDetailsScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (BuildContext context) => StudyNotesDetailsScreen(),
    //   );

    // case HomeScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (BuildContext context) => HomeScreen(),
    //   );

    case EventAndSessionScreenRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) => EventAndSessionScreen(),
      );

    case SelectAccountScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => SelectAccountScreen());

    case StudyNotesScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => StudyNotesScreen());

    // case PrivacyPolicyScreenRoute:
    //   return MaterialPageRoute(
    //       builder: (BuildContext context) => PrivacyPolicyScreen());

    case SearchScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => SearchScreen());

    case EditProfileScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => EditProfileScreen());

    case AddStudyMaterialScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => AddStudyMaterialScreen());

    // case AddPastPaperScreenRoute:
    //   return MaterialPageRoute(
    //       builder: (BuildContext context) => AddPastPaperScreen());

    // case StudyMaterialScreenRoute:
    //   return MaterialPageRoute(
    //       builder: (BuildContext context) => StudyMaterialScreen());

    // case ChatScreenRoute:
    //   return MaterialPageRoute(builder: (BuildContext context) => ChatScreen());

    case CreatEventSessionScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => CreatEventSessionScreen());
    case AddStudyNotesScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => AddStudyNotesScreen());

    // case AudioPlayerBottomModalSheetRoute:
    //   return MaterialPageRoute(
    //       builder: (BuildContext context) => AudioPlayerBottomModalSheet());

    // case ChatScreenRoute:
    //   return MaterialPageRoute(builder: (BuildContext context) => ChatScreen());
    case ManageScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => ManageScreen());

    // case ProfileDetailScreenRoute:
    //   return MaterialPageRoute(
    //       builder: (BuildContext context) => ProfileDetailScreen());

    case AccountVerificationScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => AccountVerificationScreen());

    case OtpScreenRoute:
      return MaterialPageRoute(builder: (BuildContext context) => OtpScreen());

    // case SettingScreenRoute:
    //   return MaterialPageRoute(
    //       builder: (BuildContext context) => SettingScreen());
    default:
      return MaterialPageRoute(
        builder: (BuildContext context) => LoginScreen(),
      );
  }
}
