import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_note/controllers/authController.dart';
import 'package:project_note/screens/home/home.dart';
import 'package:project_note/screens/login/sign_up/sign_up_screen.dart';

class Login extends StatelessWidget {
  final TextEditingController email = TextEditingController(text: 'gustavo.constantinov@gmail.com');
  final TextEditingController password = TextEditingController(text: '12345678');
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
                    child: Text("E-mail",
                        style: TextStyle(
                        fontSize: 16),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.only(bottom: 20, top: 5),
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.centerLeft,
                    child: Text("Senha",
                      style: TextStyle(
                          fontSize: 16),
                    )),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.only(bottom: 40, top: 5),
                  child: TextFormField(
                    controller: password,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.black,
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
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(2)),
                  child: TextButton(
                      onPressed: () {
                        if (email.text != '' && password.text != '') {
                          controller.signIn(
                              email: email.text, password: password.text);
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
      ),
    );
  }
}
