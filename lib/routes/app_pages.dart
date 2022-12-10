import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:project_note/screens/home/home.dart';
import 'package:project_note/bindings/userControllerBindings.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.home,
        page: () => Home(),
        binding: UserControllerBindings(),
        transition: Transition.fadeIn),
  ];
}