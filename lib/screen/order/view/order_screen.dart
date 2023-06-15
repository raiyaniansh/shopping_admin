import 'package:firebaselogin/screen/order/modal/order_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/firebase_helper.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff13171C),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "  My order",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp),
              ),
              SizedBox(height: 1.h,),
              StreamBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
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
                      productlist.add(order);
                    }
                    return Container(
                      height: 87.5.h,
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
                                  Text("${productlist[index].Name}",style: TextStyle(color: Colors.white)),
                                  Text("Qua : ${productlist[index].con}",style: TextStyle(color: Colors.white)),
                                  Text("${productlist[index].email}",style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              ElevatedButton(onPressed: () {
                                OrderModal order = OrderModal(
                                    Name: productlist[index].Name,
                                    Price: productlist[index].Price,
                                    pay: productlist[index].pay,
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
        ),
      ),
    );
  }
}
