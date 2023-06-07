import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselogin/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  User? user;
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () async {
      user = await     FireBase.fireBase.firebaseAuth.currentUser;
      if(user==null)
        {
          Get.offAndToNamed('/login');
        }
      else
        {
          Get.offAndToNamed('/bottom');
        }
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff13171C),
        body: Container(
          width: 100.w,
          child: Stack(
            children: [
              Align(alignment: Alignment(0, 0),child: Text("Admin",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40.sp),)),
              Align(alignment: Alignment(0, 0.15),child: Image.network("https://dwglogo.com/wp-content/uploads/2016/02/Amazoncom-yellow-arrow.png",color: Colors.white,height: 20.h,)),
            ],
          ),
        ),
      ),
    );
  }
}
