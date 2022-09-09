import 'package:get/instance_manager.dart';
import 'package:project_note/controllers/authController.dart';

class ControllerBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}