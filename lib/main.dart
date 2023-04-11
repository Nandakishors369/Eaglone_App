// ignore_for_file: prefer_const_constructors

import 'package:eaglone/Mongo%20Db/mongodb.dart';
import 'package:eaglone/firebase_options.dart';
import 'package:eaglone/Repositories/free_courses.dart';
import 'package:eaglone/view/Login%20and%20Signup/google_login.dart';
import 'package:eaglone/view/Navigation/navigation_bar.dart';
import 'package:eaglone/view/Splash%20Screens/splash_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MongoDatabase.connect();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MaterialColor myThemeColor = MaterialColor(0xFF3BECB8, {
      50: Color(0xFFE0F8F6),
      100: Color(0xFFB3E6DD),
      200: Color(0xFF80D3C3),
      300: Color(0xFF4DB0A9),
      400: Color(0xFF269590),
      500: Color(0xFF007C78),
      600: Color(0xFF00726E),
      700: Color(0xFF006564),
      800: Color(0xFF005B5A),
      900: Color(0xFF004A49),
    });
    return ChangeNotifierProvider(
      create: (context) => GoolgeSignInProvider(),
      child: ScreenUtilInit(
          designSize: size,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: myThemeColor,
                primaryColor: myThemeColor,
              ),
              home: SplashScreen(),
            );
          }),
    );
  }
}
