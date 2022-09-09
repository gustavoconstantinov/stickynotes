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
            Icon(Icons.local_fire_department, color: Colors.white, size: 70,),
            Container(
                margin: EdgeInsets.only(bottom: 90, top: 17),
                child: Text("EverMode", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 36, color: Colors.white),)),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.only(left: 8, right: 55),
              decoration: BoxDecoration(
                  color: Color(0xff3890E1),
                  borderRadius: BorderRadius.circular(2)
              ),
              child: TextButton(
                  onPressed: () {
                    //controller.googleLogin();
                    //GoogleSignIn().signIn();
                  },
                  child: Row(
                    children: [
                      Image(image: AssetImage('images/google-acc.jpg')),
                      Spacer(),
                      Text("Continuar com o Google",textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),)
                    ],
                  )),
            ),
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
                  child: Text("Outras Opções", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey.shade600),)),
            )
          ],
        ),
      ),
    );
  }
}
