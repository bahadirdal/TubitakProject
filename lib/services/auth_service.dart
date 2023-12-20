import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubitakproject/homePage.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AuthService {
  final userCollection = FirebaseFirestore.instance.collection(
      "users"); // user collection içerisine kayıt yapacağımızı buradan söylüyoruz.
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> _registerUser(
      {required String name, required String email, required String password}) async {
    await userCollection.doc().set({
      "email": email,
      "name": name,
      "password": password
    });
  }

  Future<void> signUp(
      {required String name, required String email, required String password }) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      if (userCredential.user != null) {
        _registerUser(name: name, email: email, password: password);
      }
    } on FirebaseAuthException catch (e) { // FirebaseAuthException bize gelen hatayı söyler, döndürür.
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    } 
  }

  Future<void> signIn(BuildContext context, { required String email, required String password }) async {
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        Fluttertoast.showToast(msg: "GİRİŞ BAŞARILI", toastLength: Toast.LENGTH_LONG); // Fluttertoast bize geri mesaj döndürür ekrana.
        // giriş başarılı
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(),));
        }
      } on FirebaseAuthException catch (e) {

    }
  }
}