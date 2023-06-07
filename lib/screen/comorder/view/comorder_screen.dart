import 'package:firebaselogin/screen/comorder/modal/comorder_modal.dart';
import 'package:firebaselogin/screen/order/modal/order_modal.dart';
import 'package:firebaselogin/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ComorderScreen extends StatefulWidget {
  const ComorderScreen({Key? key}) : super(key: key);

  @override
  State<ComorderScreen> createState() => _ComorderScreenState();
}

class _ComorderScreenState extends State<ComorderScreen> {
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
                "  History",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp),
              ),
              SizedBox(
                height: 1.h,
              ),
              StreamBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data!.docs;
                    List<ComModal> productlist = [];
                    for (var x in data) {
                      ComModal order = ComModal(
                        Name: x['Name'],
                        Price: x['Price'],
                        pay: x['pay'],
                        Dis: x['Dis'],
                        Brand: x['Brand'],
                        add: x['add'],
                        Con: x['Con'],
                        email: x['email'],
                        Img: x['Img'],
                        uname: x['uname'],
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
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(15)),
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                                    .Img ==
                                                ""
                                            ? 'https://dwglogo.com/wp-content/uploads/2016/02/Amazoncom-yellow-arrow.png'
                                            : "${productlist[index].Img}"))),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${productlist[index].Name}",
                                      style: TextStyle(color: Colors.white)),
                                  Text("Qua : ${productlist[index].Con}",
                                      style: TextStyle(color: Colors.white)),
                                  Text("${productlist[index].email}",
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              ElevatedButton(
                                onPressed: () {
                                  ComModal order = ComModal(
                                    Name: productlist[index].Name,
                                    Price: productlist[index].Price,
                                    pay: productlist[index].pay,
                                    Dis: productlist[index].Dis,
                                    Brand: productlist[index].Brand,
                                    email: productlist[index].email,
                                    uname: productlist[index].uname,
                                    Img: productlist[index].Img,
                                    Con: productlist[index].Con,
                                    add: productlist[index].add,
                                  );
                                  Get.toNamed('/hview', arguments: order);
                                },
                                child: Text("View"),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0xff13171C))),
                              )
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
                stream: FireBase.fireBase.comorder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
