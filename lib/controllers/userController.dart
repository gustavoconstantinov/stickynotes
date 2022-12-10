import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_note/controllers/authController.dart';
import 'package:project_note/screens/home/home.dart';

class UserController extends GetxController {
  final authController = Get.put(AuthController());
  ScrollController scrollController = ScrollController();
  late bool isLoading = true;
  final oneNote = RxMap();
  Map<String, dynamic> notes = {};
  List<dynamic> notesList = [].obs;
  var allNotes;
  @override
  void onInit() {
    super.onInit();
    this.getNotes();
    print(authController.firebaseUser);
    print(this.notesList);

  }
  void createNote(String title, String text) async {
    try {
      DocumentReference<Map<String, dynamic>> note = await FirebaseFirestore.instance.collection("Notes").doc(Get.find<AuthController>().auth.currentUser!.uid).collection("UserNotes").add({
        "title": title,
        "text": text,
        "id": '${Get.find<AuthController>().auth.currentUser!.uid}${DateTime.now()}',
        "color": this.getColor(),
      });
      this.getNotes();
      Get.to(() => Home());
    }catch (e) {
      Get.snackbar("Ocorreu um erro", e.toString());
    }
  }

  void logout () async {
    await authController.googleLogout();
  }

  void getNotes () async{
    String userID = Get.find<AuthController>().auth.currentUser!.uid;
    QuerySnapshot user = await FirebaseFirestore.instance.collection("users").get();
    QuerySnapshot listNotes = await FirebaseFirestore.instance.collection("Notes").doc(userID).collection("UserNotes").get();
    this.notesList = listNotes.docs.map((doc) => doc.data()).toList();
    print(this.notesList);

    update();
  }

  int getColorIndex (int index) {
    List<dynamic> colors = [
      {'color': 0xffFEA47F},
      {'color': 0xff25CCF7},
      {'color': 0xffEAB543},
      {'color': 0xff55E6C1},
      {'color': 0xffCAD3C8},
      {'color': 0xffF97F51},
      {'color': 0xff1B9CFC},
      {'color': 0xffF8EFBA},
      {'color': 0xff58B19F},
      {'color': 0xff2C3A47},
      {'color': 0xffB33771},
      {'color': 0xff3B3B98},
      {'color': 0xffFD7272},
      {'color': 0xff9AECDB},
      {'color': 0xffD6A2E8},
      {'color': 0xff6D214F},
      {'color': 0xff182C61},
      {'color': 0xffFC427B},
      {'color': 0xffBDC581},
      {'color': 0xff82589F},
      {'color': 0xfff6e58d},
      {'color': 0xffffbe76},
      {'color': 0xffff7979},
      {'color': 0xffbadc58},
      {'color': 0xffdff9fb},
      {'color': 0xfff9ca24},
      {'color': 0xfff0932b},
      {'color': 0xff6ab04c},
      {'color': 0xffc7ecee},
      {'color': 0xff686de0},
      {'color': 0xff30336b},
      {'color': 0xff95afc0},
      {'color': 0xff535c68},
      {'color': 0xff22a6b3},
      {'color': 0xff5f27cd},
    ];
    return colors[index]['color'];
  }

  int getColor () {
     return Random().nextInt(34) + 0;
  }

  void deleteNote(String id) async{
    try {
      String userID = Get.find<AuthController>().auth.currentUser!.uid;
      QuerySnapshot teste = await FirebaseFirestore.instance.collection('Notes').doc(userID).collection('User Notes').get();

      for(DocumentSnapshot loop in teste.docs){
        if(loop.get('id') == id){
          loop.reference.delete();
          this.getNotes();

        }
      }

    } catch (e) {
      print(e);
    }
  }

  void teste() {
    print(Get.find<AuthController>().auth.currentUser!.uid.runtimeType);
  }
}