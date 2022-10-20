import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_note/controllers/authController.dart';
import 'package:project_note/screens/home/home.dart';
import 'package:project_note/screens/login/login.dart';

class LoginInitial extends StatelessWidget {
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 45),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.note_alt, color: Colors.white, size: 70,),
            Container(
                margin: EdgeInsets.only(bottom: 90, top: 17),
                child: Text("StickyNotes", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 36, color: Colors.white),)),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2)
              ),
              child: TextButton(
                  onPressed: () {
                    Get.to(() => Login());
                  },
                  child: Text("Iniciar", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey.shade600),)),
            )
          ],
        ),
      ),
    );
  }
}
