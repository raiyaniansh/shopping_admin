import 'package:firebaselogin/screen/order/modal/order_modal.dart';
import 'package:firebaselogin/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class OviewScreen extends StatefulWidget {
  const OviewScreen({Key? key}) : super(key: key);

  @override
  State<OviewScreen> createState() => _OviewScreenState();
}

class _OviewScreenState extends State<OviewScreen> {
  @override
  OrderModal data = Get.arguments;
  String? uname;
  String? add;
  String? email;
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
              StreamBuilder(builder: (context, snapshot) {
                if(snapshot.hasData)
                  {
                    var user =snapshot.data!.docs;
                    uname=user[0]['Name'];
                    email=user[0]['email'];
                    add="${user[0]['Add'] },${user[0]['City']}, ${user[0]['State']} - ${user[0]['Zip']}";
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" Name : $uname",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.sp,color: Colors.white)),
                        SizedBox(height: 0.5.h,),
                        Text(" Email : $email",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.sp,color: Colors.white)),
                        SizedBox(height: 0.5.h,),
                        Text(" Add : $add",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.sp,color: Colors.white)),
                        // Text("Name : ${user[0]['Name']}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.sp,color: Colors.white)),
                      ],
                    );
                  }
                return Center(child: CircularProgressIndicator(color: Colors.white,));
              },stream: FireBase.fireBase.readuser(uid: data.key,),),
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
                                  .img ==
                                  ""
                                  ? 'https://dwglogo.com/wp-content/uploads/2016/02/Amazoncom-yellow-arrow.png'
                                  : "${data.img}"))),
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
                  Text("${data.con} unit",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp,color: Colors.white)),
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
                  Text("Rs. ${int.parse(data.Price!)*int.parse(data.con!)}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp,color: Colors.white)),
                  SizedBox(width: 2.w,),
                ],
              ),
              SizedBox(height: 2.h,),
              InkWell(
                onTap: () {
                  FireBase.fireBase.Comorder(pay: data.pay,email: email,Name: data.Name,con: data.con,img: data.img,Brand: data.Brand,Dis: data.Dis,Price: data.Price,add: add,uName: uname);
                  FireBase.fireBase.delet(data.xkey);
                  Get.back();
                },
                child: Container(
                  height: 8.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text("Confirm",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
