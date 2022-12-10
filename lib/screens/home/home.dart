import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:project_note/controllers/authController.dart';
import 'package:project_note/controllers/userController.dart';
import 'package:project_note/screens/home/card_item.dart';
import 'package:project_note/screens/home/create_note.dart';

class Home extends GetView<UserController> {
  //final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.transparent,
      body: Obx(() {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff861bfe),
                  Color(0xff5e5bf0),
                  Color(0xffb2b0fc),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )
          ),
          //margin: EdgeInsets.only(top: 20, left: 14, right: 14),
          padding: EdgeInsets.only(left:10, right:10),
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 10, top:40),
                  child: Row(
                    children: [
                      Text(
                        "Minhas anotações",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            controller.notesList.removeRange(0, controller.notesList.length);
                            controller.authController.signOut();
                          },
                          icon: Icon(Icons.logout,
                              color: Colors.white))
                    ],
                  )),
              Expanded(
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                      controller: controller.scrollController,
                      itemCount: controller.notesList.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return CardItem(
                            controller.notesList[index]['title'] ??
                                "",
                            controller.notesList[index]['text'] ?? "",
                            controller.notesList[index]['id'] ?? "",
                            Color(controller.getColorIndex(controller.notesList[index]['color'] ?? "")));
                        //Color(_.getColor()));
                      }),
                ),
              )
            ],
          ),
        );
      }),
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
    );
  }
}
