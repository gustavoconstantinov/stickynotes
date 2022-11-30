import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_note/controllers/authController.dart';
import 'package:project_note/screens/home/home.dart';
import 'package:project_note/screens/login/login.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 45, right: 45, top: 100),
            alignment: Alignment.center,
            child: Column(
              children: [
                Icon(Icons.note_alt, color: Colors.white, size: 70,),
                Container(
                    margin: EdgeInsets.only(bottom: 50, top: 17),
                    child: Text("StickyNotes", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 36, color: Colors.white),)),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Nome")),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: TextFormField(
                    controller: name,
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),),
                Container(
                  margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.centerLeft,
                    child: Text("E-mail")),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    controller: email,
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Senha")),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    controller: password,
                    obscureText: true,
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(2)
                  ),
                  child: TextButton(
                      onPressed: () {
                        if(name.text != '' && email.text != '' && password != ''){
                          controller.credentialSignUp(name.text, email.text, password.text);
                        } else {
                          Get.snackbar("Campos obrigatórios", "Por favor preeencha todos os campos", backgroundColor: Colors.white, colorText: Colors.black);
                        }
                      },
                      child: Text("Cadastrar", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),)),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 8, bottom: 30),
                  child: TextButton(
                      onPressed: () {
                        Get.to(() => Login());
                      },
                      child: Text("Já possui conta?", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),)),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
