import 'package:firebaselogin/screen/order/modal/order_modal.dart';
import 'package:firebaselogin/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RxInt total = 0.obs;
  RxInt totalunit = 0.obs;
  RxInt padunit = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff13171C),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 6.h,
                  ),
                  Container(
                    width: 100.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Sales",
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Center(
                          child: StreamBuilder(
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                totalunit.value = 0;
                                total.value = 0;
                                var data = snapshot.data!.docs;
                                for (var x in data) {
                                  OrderModal order = OrderModal(
                                    Price: x['Price'],
                                    con: x['Con'],
                                  );
                                  total.value = total.value +
                                      (int.parse(order.Price!) *
                                          int.parse(order.con!));
                                  totalunit.value =
                                      totalunit.value + int.parse(order.con!);
                                }
                                return Text(
                                  "Rs. ${total.value}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w600),
                                );
                              }
                              return CircularProgressIndicator(
                                color: Colors.white,
                              );
                            },
                            stream: FireBase.fireBase.comorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 38.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Sales Unit",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15.sp),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Center(
                              child: StreamBuilder(
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    totalunit.value = 0;
                                    total.value = 0;
                                    var data = snapshot.data!.docs;
                                    for (var x in data) {
                                      OrderModal order = OrderModal(
                                        Price: x['Price'],
                                        con: x['Con'],
                                      );
                                      total.value = total.value +
                                          (int.parse(order.Price!) *
                                              int.parse(order.con!));
                                      totalunit.value =
                                          totalunit.value + int.parse(order.con!);
                                    }
                                    return Text(
                                      "${totalunit.value}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.w600),
                                    );
                                  }
                                  return CircularProgressIndicator(
                                    color: Colors.white,
                                  );
                                },
                                stream: FireBase.fireBase.comorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 38 .w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pending Sales",
                              style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Center(
                              child: StreamBuilder(
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    padunit.value = 0;
                                    total.value = 0;
                                    var data = snapshot.data!.docs;
                                    for (var x in data) {
                                      OrderModal order = OrderModal(
                                        Price: x['Price'],
                                        con: x['Con'],
                                      );
                                      total.value = total.value +
                                          (int.parse(order.Price!) *
                                              int.parse(order.con!));
                                      padunit.value =
                                          padunit.value + int.parse(order.con!);
                                    }
                                    return Text(
                                      "${padunit.value}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.w600),
                                    );
                                  }
                                  return CircularProgressIndicator(
                                    color: Colors.white,
                                  );
                                },
                                stream: FireBase.fireBase.readorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text(
                    "   New Order",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  StreamBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        totalunit.value = 0;
                        total.value = 0;
                        var data = snapshot.data!.docs;
                        List<OrderModal> productlist = [];
                        for (var x in data) {
                          OrderModal order = OrderModal(
                            Name: x['Name'],
                            Price: x['Price'],
                            Dis: x['Dis'],
                            Brand: x['Brand'],
                            Stock: x['Stock'],
                            cat: x['Cat'],
                            img: x["Img"],
                            key: x['Key'],
                            rtn: x['Day'],
                            con: x['Con'],
                            email: x['email'],
                            xkey: x.id,
                          );
                          total.value = total.value +
                              (int.parse(order.Price!) * int.parse(order.con!));
                          totalunit.value =
                              totalunit.value + int.parse(order.con!);
                          productlist.add(order);
                        }
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 40.8.h,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: productlist.length,
                            itemBuilder: (context, index) => Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(color: Colors.white10,borderRadius: BorderRadius.circular(15)),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
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
                                            image: NetworkImage(productlist[index]
                                                .img ==
                                                ""
                                                ? 'https://dwglogo.com/wp-content/uploads/2016/02/Amazoncom-yellow-arrow.png'
                                                : "${productlist[index].img}"))),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(width: 32.w,child: Text(overflow: TextOverflow.ellipsis,"${productlist[index].Name}",style: TextStyle(color: Colors.white))),
                                      Container(width: 32.w,child: Text(overflow: TextOverflow.ellipsis,"Qua : ${productlist[index].con}",style: TextStyle(color: Colors.white))),
                                      Container(width: 32.w,child: Text(overflow: TextOverflow.ellipsis,"${productlist[index].email}",style: TextStyle(color: Colors.white))),

                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  ElevatedButton(onPressed: () {
                                    OrderModal order = OrderModal(
                                      Name: productlist[index].Name,
                                      Price: productlist[index].Price,
                                      Dis: productlist[index].Dis,
                                      Brand: productlist[index].Brand,
                                      Stock: productlist[index].Stock,
                                      cat: productlist[index].cat,
                                      img: productlist[index].img,
                                      key: productlist[index].key,
                                      rtn: productlist[index].rtn,
                                      con: productlist[index].con,
                                      email: productlist[index].email,
                                      xkey: productlist[index].xkey
                                    );
                                    Get.toNamed('/oview',arguments: order);
                                  }, child: Text("View"),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xff13171C))),)
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    },
                    stream: FireBase.fireBase.readorder(),
                  ),
                ],
              ),
              Align(
                child: Align(
                  alignment: Alignment(0, -1),
                  child: Container(
                    color: Color(0xff13171C),
                    child: Row(
                      children: [
                        Text(
                          "Dashboard",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
