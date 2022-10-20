import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:project_note/bindings/editBindings.dart';
import 'package:project_note/screens/home/edit_note.dart';

class AppPages {
  static final pages = [
  GetPage(name: '/edit-note', page: () => EditNote(), binding: EditBindings()),
  ];
}