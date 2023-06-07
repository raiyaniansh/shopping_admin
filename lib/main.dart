import 'package:firebase_core/firebase_core.dart';
import 'package:firebaselogin/screen/add/view/add_screen.dart';
import 'package:firebaselogin/screen/bottom/view/bottom_screen.dart';
import 'package:firebaselogin/screen/home/view/home_screen.dart';
import 'package:firebaselogin/screen/hview/view/hview_screen.dart';
import 'package:firebaselogin/screen/oview/view/oview_screen.dart';
import 'package:firebaselogin/screen/singin/view/singin_screen.dart';
import 'package:firebaselogin/screen/singup/view/signup_screen.dart';
import 'package:firebaselogin/screen/splash/view/splash.dart';
import 'package:firebaselogin/screen/update/view/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/', page: () => SplashScreen()),
          GetPage(name: '/login', page: () => SingInscreen()),
          GetPage(name: '/singup', page: () => SingUpscreen()),
          GetPage(name: '/bottom', page: () => BottomScreen()),
          GetPage(name: '/home', page: () => HomeScreen()),
          GetPage(name: '/oview', page: () => OviewScreen()),
          GetPage(name: '/hview', page: () => HviewScreen()),
          GetPage(name: '/add', page: () => AddScreen()),
          GetPage(name: '/upd', page: () => Update()),
        ],
      ),
    ),
  );
}
