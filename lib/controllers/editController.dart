import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:project_note/bindings/userControllerBindings.dart';
import 'package:project_note/controllers/authController.dart';
import 'package:project_note/controllers/userController.dart';
import 'package:project_note/screens/home/home.dart';

class EditController extends GetxController {
  final userController = Get.put(UserController());
  final String id;
  EditController({required this.id});
  late bool isLoading = true;
  final oneNote = RxMap().obs;

  @override
  void onInit() {
    this.getOneNote(id);
    if(this.oneNote.value.keys.last != null){
      this.isLoading = false;
    }
    super.onInit();
  }

  void updateOneNote(String title, String text) async {
    String userID = Get.find<AuthController>().auth.currentUser!.uid;
    QuerySnapshot notes = await FirebaseFirestore.instance.collection("Notes").doc(userID).collection("User Notes").get();

    for(DocumentSnapshot loop in notes.docs){
      if(loop.get('id') == id){
        loop.reference.update({
          "title": title,
          "text": text,
        });
        this.oneNote.value.addAll({'title': loop.get('title'), 'text': loop.get('text'), 'id': loop.get('id') });
        update();
        // this.oneNote.value.clear();
        // this.getOneNote(id);
        // this.userController.getNotes();
        Get.delete<EditController>();
        Get.delete<UserController>();
        Get.to(Home(), binding: UserControllerBindings());
      }
    }
  }


  @override
  void dispose() {
    super.dispose();
  }

  void getOneNote (String id) async {
    String userID = Get.find<AuthController>().auth.currentUser!.uid;
    QuerySnapshot notes = await FirebaseFirestore.instance.collection("Notes").doc(userID).collection("User Notes").get();

    for(DocumentSnapshot loop in notes.docs){
      if(loop.get('id') == id){
        this.oneNote.value.addAll({'title': loop.get('title'), 'text': loop.get('text'), 'id': loop.get('id') });
        update();
        this.isLoading = false;
      }
    }
  }
}