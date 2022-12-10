import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:project_note/bindings/editBindings.dart';
import 'package:project_note/controllers/userController.dart';

import 'edit_note.dart';

class CardItem extends StatelessWidget {
  final String title;
  final String note;
  final String id;
  final Color color;
  var userController = Get.put(UserController());

  CardItem(
      this.title, this.note, this.id ,this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.shade500,
        //     blurRadius: 2.0,
        //     spreadRadius: 0.5,
        //     offset: Offset(1.0, 1.0),
        //   )
        // ]
      ),
      child: Stack(
        children: [
          Container(
            width: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2),
                  bottomLeft: Radius.circular(2)),
              color: color,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            child: TextButton(onPressed: () {}, child: Row(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 6),
                          child: Text(title,textAlign: TextAlign.left ,style: TextStyle(overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w700, fontSize: 16, color: Colors.grey.shade500),)),
                      Container(
                          width: 250,
                          child: Text(note, textAlign: TextAlign.left ,style: TextStyle(overflow: TextOverflow.visible,fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey.shade600),)),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xff4B8EC0),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: IconButton(
                            padding: EdgeInsets.zero,
                          onPressed: () {
                            Get.to(EditNote(), binding: EditBindings(this.id));
                          }, icon: Icon(Icons.edit, color: Colors.white,), alignment: Alignment.center,),
                      ),
                      Spacer(),
                      Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffFE5E5E),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            userController.deleteNote(this.id);
                          }, icon: Icon(Icons.delete, color: Colors.white,), alignment: Alignment.center,),
                      ),
                    ],
                  ),
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
