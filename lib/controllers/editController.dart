import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:project_note/controllers/authController.dart';
import 'package:project_note/screens/home/home.dart';

class EditController extends GetxController {
  final String id;
  EditController({required this.id});
  late bool isLoading = true;
  final oneNote = RxMap();
  Map<String, dynamic> notes = {};
  List<dynamic> notesList = [].obs;
  @override
  void onInit() {
    this.getOneNote(id);
    if(this.oneNote['id'] != null){
      this.isLoading = false;
    }
    super.onInit();
  }

  void updateOneNote(String id,String title, String text) async {
    String userID = Get.find<AuthController>().auth.currentUser!.uid;
    QuerySnapshot notes = await FirebaseFirestore.instance.collection("Notes").doc(userID).collection("User Notes").get();

    for(DocumentSnapshot loop in notes.docs){
      if(loop.get('id') == id){
        loop.reference.update({
          "title": title,
          "text": text,
        });
        this.oneNote['title'] = loop.get('title');
        this.oneNote['text'] = loop.get('text');
        this.oneNote['id'] = loop.get('id');
        update();
        Get.to(() => Home());
      }
    }
  }

  void getOneNote (String id) async {

    String userID = Get.find<AuthController>().auth.currentUser!.uid;
    QuerySnapshot notes = await FirebaseFirestore.instance.collection("Notes").doc(userID).collection("User Notes").get();

    for(DocumentSnapshot loop in notes.docs){
      if(loop.get('id') == id){
        this.oneNote['title'] = loop.get('title');
        this.oneNote['text'] = loop.get('text');
        this.oneNote['id'] = loop.get('id');
        update();
        this.isLoading = false;
      }
    }
  }
}