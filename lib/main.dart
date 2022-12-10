import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project_note/bindings/controllerBindings.dart';
import 'package:project_note/routes/app_pages.dart';
import 'package:project_note/screens/login/login_initial.dart';
import 'package:project_note/screens/login/sign_up/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('pt', 'BR'),
      ],
      locale: Locale('pt'),
      title: 'StickyNotes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xff66BB6A),
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'Hind'),
        ),
      ),
      home: LoginInitial(),
      getPages: AppPages.pages,
    );
  }
}