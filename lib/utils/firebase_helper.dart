import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBase {
  static final FireBase fireBase = FireBase._fireBaseh();

  FireBase._fireBaseh();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String?> singup({required email, required password}) async {
    String? msg;
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      msg = "success";
    }).catchError((e) {
      msg = "$e";
    });
    return msg;
  }

  Future<String?> Login({required email, required password}) async {
    String? msg;
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      msg = "success";
    }).catchError((e) {
      msg = "$e";
    });
    return msg;
  }

  Future<void> SignOut() async {
    await firebaseAuth.signOut();
    await GoogleSignIn().signOut();
  }

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String?> adddata({String? Name,Brand,Price,Dis,Day,stock,img,cat}) async {
    String? msg;
    await db.collection("product").add({
      "Name": "$Name",
      "Brand": "$Brand",
      "Price": "$Price",
      "Dis": "$Dis",
      "rat":"0",
      "Day": "$Day",
      "Stock":"$stock",
      "Cat":"$cat",
      "Img":"$img",
    }).then((value) => msg="Success");
    return msg;
  }

  Future<String?> Update({rat,String? Name,Brand,Price,Dis,Day,stock,img,cat,key}) async {
    String? msg;
    await db.collection("product").doc('$key').set({
      "Name": "$Name",
      "Brand": "$Brand",
      "Price": "$Price",
      "Dis": "$Dis",
      "Day": "$Day",
      "Stock":"$stock",
      "Cat":"$cat",
      "Img":"$img",
      "rat":"$rat",
    }).then((value) => msg="Success");
    return msg;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readdata()
  {
    return db.collection('product').snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readorder()
  {
    return db.collection('order').snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readuser({uid})
  {
    return db.collection('user').doc('$uid').collection('data').snapshots();
  }

  void delet(id) {
    db.collection("order").doc('$id').delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> comorder() {
    return db.collection("comorder").snapshots();
  }

  Future<String?> Comorder(
      {String? Name, Brand, Price,img,con,uName,email,add,Dis,pay}) async {
    String? msg;
    await db.collection("comorder").add({
      "Name": "$Name",
      "pay":"$pay",
      "Con": "$con",
      "Brand": "$Brand",
      "Price": "$Price",
      "Dis": "$Dis",
      "Img": "$img",
      "email": "$email",
      "uname": "$uName",
      "add": "$add",
    }).then((value) => msg = "Success");
    return msg;
  }

  void delete(id)
  {
    db.collection('product').doc('$id').delete();
  }

  Future<String> signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    String msg="";
    return await firebaseAuth.signInWithCredential(credential).then((value) => msg="success").catchError((e)=> msg="$e");
  }
}
