import 'package:get/instance_manager.dart';
import 'package:project_note/controllers/userController.dart';

class UserControllerBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
  }
}