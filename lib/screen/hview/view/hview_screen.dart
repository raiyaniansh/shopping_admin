import 'package:firebaselogin/screen/comorder/modal/comorder_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HviewScreen extends StatefulWidget {
  const HviewScreen({Key? key}) : super(key: key);

  @override
  State<HviewScreen> createState() => _HviewScreenState();
}

class _HviewScreenState extends State<HviewScreen> {
  ComModal data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff13171C),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h,),
              InkWell(onTap: () {
                Get.back();
              }, child: Icon(Icons.arrow_back,color: Colors.white,)),
              SizedBox(height: 1.h,),
              Text(" Buyer information",style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold),),
              SizedBox(height: 1.h,),
              Text(" Name : ${data.uname}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.sp,color: Colors.white)),
              SizedBox(height: 0.5.h,),
              Text(" Email : ${data.email}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.sp,color: Colors.white)),
              SizedBox(height: 0.5.h,),
              Text(" Add : ${data.add}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.sp,color: Colors.white)),
              SizedBox(height: 0.5.h,),
              Text(" Pay type : ${data.pay}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.sp,color: Colors.white)),
              SizedBox(height: 3.h,),
              Text(" Product information",style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold),),
              SizedBox(height: 1.h,),
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(color: Colors.white10,borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Container(
                      width: 7.h,
                      height: 7.h,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(data
                                  .Img ==
                                  ""
                                  ? 'https://dwglogo.com/wp-content/uploads/2016/02/Amazoncom-yellow-arrow.png'
                                  : "${data.Img}"))),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${data.Name}",style: TextStyle(color: Colors.white)),
                        Text("${data.Brand}",style: TextStyle(color: Colors.white70)),
                        Container(width: 67.w,child: Text("${data.Dis}",style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
              SizedBox(height: 1.h,),
              Row(
                children: [
                  Text(" Qua",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp,color: Colors.white)),
                  Expanded(child: SizedBox()),
                  Text("${data.Con} unit",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp,color: Colors.white)),
                  SizedBox(width: 2.w,),
                ],
              ),
              SizedBox(height: 0.5.h,),
              Row(
                children: [
                  Text(" Price",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp,color: Colors.white)),
                  Expanded(child: SizedBox()),
                  Text("Rs. ${data.Price}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp,color: Colors.white)),
                  SizedBox(width: 2.w,),
                ],
              ),
              Expanded(child: SizedBox()),
              Row(
                children: [
                  Text(" Total Amount",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp,color: Colors.white)),
                  Expanded(child: SizedBox()),
                  Text("Rs. ${int.parse(data.Price!)*int.parse(data.Con!)}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp,color: Colors.white)),
                  SizedBox(width: 2.w,),
                ],
              ),
              SizedBox(height: 2.h,),
            ],
          ),
        ),
      ),
    );
  }
}
