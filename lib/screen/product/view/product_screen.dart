import 'package:firebaselogin/screen/product/modal/product_modal.dart';
import 'package:firebaselogin/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController txtname = TextEditingController();
    TextEditingController txtbrand = TextEditingController();
    TextEditingController txtprice = TextEditingController();
    TextEditingController txtdis = TextEditingController();
    TextEditingController txtret = TextEditingController();
    TextEditingController txtstock = TextEditingController();
    TextEditingController txtimg = TextEditingController();
    TextEditingController txtcat = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff13171C),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "  My Product",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp),
              ),
              SizedBox(height: 1.h,),
              StreamBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text("${snapshot.error}"));
                    } else if (snapshot.hasData) {
                      var data = snapshot.data!.docs;
                      List<ProductModal> productlist = [];
                      for (var x in data) {
                        ProductModal productModal = ProductModal(
                            Name: x['Name'],
                            rat: x['rat'],
                            Price: x['Price'],
                            Dis: x['Dis'],
                            Brand: x['Brand'],
                            Stock: x['Stock'],
                            cat: x['Cat'],
                            img: x["Img"],
                            key: x.id,
                            rtn: x['Day']);
                        productlist.add(productModal);
                      }
                      return Expanded(
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              padding: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(10),
                              ),
                                child: ExpansionTile(
                                  title: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${productlist[index].Name}",
                                        style: TextStyle(
                                            color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "${productlist[index].Brand}",
                                        style: TextStyle(
                                            color: Colors.white70),
                                      ),
                                      Text(
                                        "Stocks: ${productlist[index].Stock}",
                                        style: TextStyle(
                                            color: Colors.white70),
                                      ),
                                    ],
                                  ),
                                  leading: Container(height: 7.h,width: 7.w,child: Image.network(productlist[index].img==""? 'https://dwglogo.com/wp-content/uploads/2016/02/Amazoncom-yellow-arrow.png':"${productlist[index].img}",)),
                                  trailing:  Text("Rs. ${productlist[index].Price}",
                                      style: TextStyle(color: Colors.white,fontSize: 15.sp)),
                                  textColor: Colors.black,
                                  backgroundColor: Colors.transparent,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              ProductModal productModal = ProductModal(
                                                  Name: productlist[index].Name,
                                                  rat: productlist[index].rat,
                                                  Price: productlist[index].Price,
                                                  Dis: productlist[index].Dis,
                                                  Brand: productlist[index].Brand,
                                                  Stock: productlist[index].Stock,
                                                  cat: productlist[index].cat,
                                                  img: productlist[index].img,
                                                  key: productlist[index].key,
                                                  rtn: productlist[index].rtn);
                                              Get.toNamed('/upd',arguments: productModal);
                                            },
                                            child: Column(
                                              children: [
                                                Icon(Icons.edit,size: 15.sp,color: Colors.white,),
                                                Text("Update",style: TextStyle(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              FireBase.fireBase.delete(productlist[index].key);
                                            },
                                            child: Column(
                                              children: [
                                                Icon(Icons.delete,size: 15.sp,color: Colors.white),
                                                Text("Remove",style: TextStyle(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: productlist.length),
                      );
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    ));
                  },
                  stream: FireBase.fireBase.readdata()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed('/add');
            },
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Color(0xff242C32)),
      ),
    );
  }
}
