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
      backgroundColor: Colors.transparent,
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff861bfe),
                  Color(0xff5e5bf0),
                  Color(0xff9390f8),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )
          ),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 100),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Icon(Icons.note_alt, color: Colors.white, size: 70,),
                    Container(
                        margin: EdgeInsets.only(bottom: 50, top: 17),
                        child: Text("StickyNotes", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 36, color: Colors.white),)),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Nome", style: TextStyle(
                            fontSize: 16
                        ))),
                    Container(
                      height: 48,
                      margin: EdgeInsets.only(top:5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.white
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: name,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none
                        ),
                      ),),
                    Container(
                        margin: EdgeInsets.only(top: 10,bottom: 5),
                        alignment: Alignment.centerLeft,
                        child: Text("E-mail", style: TextStyle(
                            fontSize: 16
                        ))),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                      style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                      keyboardType: TextInputType.text,
                      maxLines: 1,


                    ),
                    Container(
                        margin: EdgeInsets.only(top:10, bottom: 5),
                        alignment: Alignment.centerLeft,
                        child: Text("Senha", style: TextStyle(
                            fontSize: 16
                        ))),
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: EdgeInsets.only(bottom: 30),
                      child: TextFormField(
                        controller: password,
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
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
                          borderRadius: BorderRadius.circular(25)
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
      )
    );
  }
}
