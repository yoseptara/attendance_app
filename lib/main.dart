import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hash_micro_test/firebase_options.dart';
import 'package:hash_micro_test/pages/add_attend_location/add_attend_location_page.dart';
import 'package:hash_micro_test/pages/add_attendance/add_attendance_page.dart';
import 'package:hash_micro_test/pages/attendance_history/attendance_history_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      );
  await FirebaseAuth.instance.signInAnonymously();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: AttendanceHistoryPage.route,
      routes: {
        AttendanceHistoryPage.route: (context) => const AttendanceHistoryPage(),
        AddAttendancePage.route: (context) => const AddAttendancePage(),
        AddAttendLocationPage.route: (context) => const AddAttendLocationPage(),
      },
    );
  }
}
