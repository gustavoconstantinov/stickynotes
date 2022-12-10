import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_note/controllers/authController.dart';
import 'package:project_note/controllers/userController.dart';
import 'package:project_note/screens/home/home.dart';
import 'package:project_note/screens/login/sign_up/sign_up_screen.dart';

class Login extends StatelessWidget {
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
                  Icon(
                    Icons.note_alt,
                    color: Colors.white,
                    size: 70,
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 90, top: 17),
                      child: Text(
                        "StickyNotes",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 36,
                            color: Colors.white),
                      )),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom:5),
                      child: Text("E-mail",
                        style: TextStyle(
                            fontSize: 16),
                      )),
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
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerLeft,
                      child: Text("Senha",
                        style: TextStyle(
                            fontSize: 16),
                      )),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                    margin: EdgeInsets.only(bottom: 40, top: 5),
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xff5e5bf0),
                        borderRadius: BorderRadius.circular(25)),
                    child: TextButton(
                        onPressed: () {
                          if (email.text != '' && password.text != '') {
                            Future.delayed(Duration(milliseconds: 2000), () {
                              controller.signIn(
                                  email: email.text, password: password.text);
                            });
                          } else {
                            Get.snackbar("Campos obrigatórios",
                                "Por favor preeencha todos os campos",
                                backgroundColor: Colors.white,
                                colorText: Colors.black);
                          }
                        },
                        child: Text(
                          "Entrar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 8, bottom: 30),
                    child: TextButton(
                        onPressed: () {
                          Get.to(() => SignUpScreen());
                        },
                        child: Text(
                          "Cadastre-se",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
            )
          ],
        )
      )


    );
  }
}
