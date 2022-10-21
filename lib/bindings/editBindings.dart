import 'package:get/get.dart';
import 'package:project_note/controllers/editController.dart';

class EditBindings extends Bindings {
  final String id;
  EditBindings(this.id);
  @override
  void dependencies(){
    Get.lazyPut(() => EditController(id: this.id));
  }
}