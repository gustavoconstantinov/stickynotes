import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_note/controllers/userController.dart';

class CreateNote extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final userController = Get.put(UserController());

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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: ListView(
          children: [
            Container(margin: EdgeInsets.only(bottom: 30), child: Text("Novo Lembrete", style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w700),),),
            Container(
              margin: EdgeInsets.only(top:10, bottom:10),
              child: Text("Titulo", style: TextStyle(fontSize: 16)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              margin: EdgeInsets.only(bottom: 20),
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                    border: InputBorder.none
                ),
                style: TextStyle(color: Colors.black, fontSize: 18),
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:10, bottom:10),
              child: Text("Descrição", style: TextStyle(fontSize: 16)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    border: InputBorder.none
                ),
                style: TextStyle(color: Colors.black,fontSize: 18),
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: TextButton(
                  onPressed: () {
                    if(_titleController.text != '' && _descriptionController.text != ''){
                      userController.createNote(_titleController.text, _descriptionController.text);
                    } else {
                      Get.snackbar("Campos obrigatórios", "Por favor preeencha todos os campos", backgroundColor: Colors.white, colorText: Colors.black);
                    }
                  },
                  child: Text("Cadastrar", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),)),
            ),
          ],
        ),
      ),
    );
  }
}
