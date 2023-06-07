import 'package:firebaselogin/screen/product/modal/product_modal.dart';
import 'package:firebaselogin/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    ProductModal data = Get.arguments;
    TextEditingController txtname = TextEditingController(text: data.Name);
    TextEditingController txtbrand = TextEditingController(text: data.Brand);
    TextEditingController txtprice = TextEditingController(text: data.Price);
    TextEditingController txtdis = TextEditingController(text: data.Dis);
    TextEditingController txtret = TextEditingController(text: data.rtn);
    TextEditingController txtstock = TextEditingController(text: data.Stock);
    TextEditingController txtimg = TextEditingController(text: data.img);
    RxString selected = '${data.cat}'.obs;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff13171C),
      body: Container(
        padding: EdgeInsets.all(15),
        color: Color(0xff13171C),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 2.h,),
              Text("Update product",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp)),
              SizedBox(
                height: 2.h,
              ),
              TextField(
                controller: txtimg,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                  hintText: "Img Url",
                  hintStyle: TextStyle(color: Colors.white70),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                controller: txtname,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),

                  hintText: "Name",
                  hintStyle: TextStyle(color: Colors.white54),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                controller: txtbrand,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),

                  hintText: "Brand",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: txtprice,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,                decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                  hintText: "Price",
                hintStyle: TextStyle(color: Colors.white70),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.white70)),
                child: Obx(
                      () => DropdownButton(
                    dropdownColor: Color(0xff13171C),
                    isExpanded: true,
                    underline: Container(),
                    menuMaxHeight: 30.h,
                    value: selected.value,
                    style: TextStyle(color: Colors.white),
                    items: [
                      DropdownMenuItem(child: Text("Phone"), value: 'Phone'),
                      DropdownMenuItem(child: Text("Cloth"), value: 'Cloth'),
                      DropdownMenuItem(child: Text("Footwear"), value: 'Footwear'),
                      DropdownMenuItem(child: Text("Watches"), value: 'Watches'),
                      DropdownMenuItem(child: Text("Home Appliances"), value: 'Home Appliances'),
                      DropdownMenuItem(child: Text("Car Accessories"), value: 'Car Accessories'),
                      DropdownMenuItem(child: Text("Grocery"), value: 'Grocery'),
                      DropdownMenuItem(child: Text("Other"), value: 'Other'),
                    ],
                    onChanged: (value) {
                      selected.value = value!;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                controller: txtdis,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,                decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white70),
                  hintText: "Discreption",
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: txtret,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),

                hintStyle: TextStyle(color: Colors.white70),
                  hintText: "Days of Return & Exchange",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                controller: txtstock,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),

                  hintText: "Stock",
                  hintStyle: TextStyle(color: Colors.white70),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child:
                          Text("cancel", style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white10))),
                  ElevatedButton(
                      onPressed: () async {
                        String? msg = await FireBase.fireBase.Update(
                          key: data.key,
                          Name: txtname.text.substring(0,1).toUpperCase()+txtname.text.substring(1).toLowerCase(),
                          Brand: txtbrand.text,
                          Day: txtret.text,
                          Dis: txtdis.text,
                          rat: data.rat,
                          Price: txtprice.text,
                          stock: txtstock.text,
                          cat: selected.value,
                          img: txtimg.text,
                        );
                        txtstock.clear();
                        txtret.clear();
                        txtprice.clear();
                        txtprice.clear();
                        txtdis.clear();
                        txtname.clear();
                        txtbrand.clear();
                        txtimg.clear();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("$msg")));
                        Get.back();
                      },
                      child:
                          Text("Update", style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white10))),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
