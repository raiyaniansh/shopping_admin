import 'dart:math';

import 'package:firebaselogin/screen/comorder/view/comorder_screen.dart';
import 'package:firebaselogin/screen/home/view/home_screen.dart';
import 'package:firebaselogin/screen/order/view/order_screen.dart';
import 'package:firebaselogin/screen/product/view/product_screen.dart';
import 'package:firebaselogin/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  List screen = [HomeScreen(),OrderScreen(),ProductScreen(),ComorderScreen()];
  RxInt i=0.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff13171C),
        body: Row(
          children: [
            Container(
              width: 15.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: Color(0xff242C32),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Image.network(
                      'https://dwglogo.com/wp-content/uploads/2016/02/Amazoncom-yellow-arrow.png',
                      color: Colors.white),
                  Expanded(
                      child: SizedBox(
                        height: 10.h,
                      )),
                  Transform.rotate(
                    angle: -pi / 2,
                    child: InkWell(
                      onTap: () {
                        i.value = 0;
                      },
                      child: Obx(
                            () => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Home",
                              style: TextStyle(
                                  color: i.value == 0
                                      ? Colors.blue
                                      : Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Container(
                              width: i.value == 0 ? 5.w : 0,
                              height: 0.2.h,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Transform.rotate(
                    angle: -pi / 2,
                    child: InkWell(
                      onTap: () {
                        i.value = 1;
                      },
                      child: Obx(
                            () => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "MyOrder",
                              style: TextStyle(
                                  color: i.value == 1
                                      ? Colors.blue
                                      : Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Container(
                              width: i.value == 1 ? 5.w : 0,
                              height: 0.2.h,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Transform.rotate(
                    angle: -pi / 2,
                    child: InkWell(
                      onTap: () {
                        i.value = 2;
                      },
                      child: Obx(
                            () => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Product",
                              style: TextStyle(
                                  color: i.value == 2
                                      ? Colors.blue
                                      : Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Container(
                              width: i.value == 2 ? 5.w : 0,
                              height: 0.2.h,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),SizedBox(
                    height: 10.h,
                  ),
                  Transform.rotate(
                    angle: -pi / 2,
                    child: InkWell(
                      onTap: () {
                        i.value = 3;
                      },
                      child: Obx(
                            () => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "History",
                              style: TextStyle(
                                  color: i.value == 3
                                      ? Colors.blue
                                      : Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Container(
                              width: i.value == 3 ? 5.w : 0,
                              height: 0.2.h,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  PopupMenuButton(
                    color: Color(0xff13171C),
                    icon: Icon(Icons.more_vert,color: Colors.white),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Support',style: TextStyle(color: Colors.white,fontSize: 15.sp)),
                            Icon(Icons.call,color: Colors.white,size: 15.sp,)
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        child: InkWell(
                          onTap: () {
                            FireBase.fireBase.SignOut();
                            Get.offAndToNamed('/login');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Logout',style: TextStyle(color: Colors.white,fontSize: 15.sp)),
                              Icon(Icons.logout,color: Colors.white,size: 15.sp,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
            Container(
              width: 85.w,
              child: Obx(() => screen[i.value]),
            )
          ],
        ),
      ),
    );
  }
}
