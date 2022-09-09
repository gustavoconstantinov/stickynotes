import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:project_note/controllers/authController.dart';
import 'package:project_note/controllers/userController.dart';
import 'package:project_note/screens/home/card_item.dart';
import 'package:project_note/screens/home/create_note.dart';

class Home extends StatelessWidget {
  final controller = Get.put(AuthController());
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: UserController(),
        builder: (_) => Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 14, right: 14),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "Minhas anotações",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey.shade600),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          controller.googleLogout();
                        },
                        icon: Icon(Icons.logout, color: Colors.grey.shade600))
                  ],
                )),
            Expanded(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                    controller: userController.controller,
                    itemCount: userController.notesList.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return CardItem(
                          userController.notesList[index]['title'] ?? "",
                          userController.notesList[index]['text'] ?? "",
                          userController.notesList[index]['id'] ?? "",
                          Color(userController.getColor()));
                    }),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateNote());
        },
        child: Icon(
          Icons.add_outlined,
          size: 40,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    ));
  }
}
