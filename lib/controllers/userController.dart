import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_note/controllers/authController.dart';
import 'package:project_note/screens/home/home.dart';

class UserController extends GetxController {
  ScrollController controller = ScrollController();
  Map<String, dynamic> notes = {};
  List<dynamic> notesList = [].obs;
  var allNotes;
  @override
  void onInit() {
    this.getNotes();
    super.onInit();
  }
  void createNote(String title, String text) async {
    try {
      DocumentReference<Map<String, dynamic>> note = await FirebaseFirestore.instance.collection("Notes").doc(Get.find<AuthController>().auth.currentUser!.uid).collection("User Notes").add({
        "title": title,
        "text": text,
        "id": '${Get.find<AuthController>().auth.currentUser!.uid}${title}',
        "color": this.getColor(),
      });
      this.getNotes();
      Get.to(() => Home());
    }catch (e) {
      Get.snackbar("Ocorreu um erro", e.toString());
    }
  }

  void getNotes () async{
    QuerySnapshot listNotes = await FirebaseFirestore.instance.collection("Notes").doc(Get.find<AuthController>().auth.currentUser!.uid).collection("User Notes").get();

    this.notesList = listNotes.docs.map((doc) => doc.data()).toList();
    update();
  }

  int getColor () {
    List<dynamic> colors = [{ 'color': 0xffFF8B8B }, { 'color':0xff74B2D4 } , { 'color':0xff66BB6A }, { 'color':0xff7B1FA2 }, { 'color':0xffFF6F00 }, { 'color':0xff76FF03 }, { 'color':0xffD81B60 }, { 'color':0xff1A237E }, { 'color':0xff4E342E }];
     return colors[Random().nextInt(8) + 0]['color'];
  }

  void deleteNote(String id) async{
    try {
      QuerySnapshot teste = await FirebaseFirestore.instance.collection('Notes').doc(Get.find<AuthController>().auth.currentUser!.uid).collection('User Notes').get();
      List<dynamic> teste2 = teste.docs.where((element) => element["id"] == id).toList();
      print(teste2[0]);
    } catch (e) {
      print(e);
    }
  }

  void teste() {
    print(Get.find<AuthController>().auth.currentUser!.uid.runtimeType);
  }
}