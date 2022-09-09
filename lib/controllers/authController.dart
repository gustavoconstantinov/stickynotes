import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_note/screens/home/home.dart';
import 'package:project_note/screens/login/login_initial.dart';
import 'package:project_note/screens/login/sign_up/sign_up_screen.dart';

class AuthController extends GetxController {

  final FirebaseAuth auth = FirebaseAuth.instance;
  var userName = '';
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  late User firebaseUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  var uid = '';
  @override
  void onInit() {
    //this.googleAccount != null ? Home() : LoginInitial();
    super.onInit();
  }




  void credentialSignUp(String name, String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
        userName = name;
        auth.currentUser!.updateDisplayName(name);
      });
      uid = auth.currentUser!.uid;
      update();
      Get.offAll(SignUpScreen());
      if(auth.currentUser != null ) {
        users
            .add({
          'full_name': name, // John Doe
          'email': email,
          'uid': auth.currentUser!.uid// Stokes and Sons
        });

        DocumentReference<Map<String, dynamic>> note = await FirebaseFirestore.instance.collection("Notes").doc(uid as String).collection("User Notes").add({
          "title": "Bem vindo ao EverMode",
          "text": "Primeira nota: avalie nosso app!",
          'id': "${uid}${"BemVindoEverMode"}"
        });
        Get.to(() => Home());
      }
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll('-', ' ').capitalize!;
      String message= '';

      if(e.code == 'weak-password') {
        message = 'A senha inserida é muito fraca';
      }else if (e.code == 'email-already-in-use') {
        message = 'Esse e-mail já possui uma conta vinculada';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message);
    }
    catch (e) {
      Get.snackbar("Ocorreu um erro", e.toString(), colorText: Color(0xff000000), backgroundColor: Color(0xffffffff));
    }
  }


  signIn({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser = auth.currentUser!;
      if(auth.currentUser != null ) {
        Get.to(() => Home());
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Ocorreu um erro", e.message.toString(), colorText: Color(0xff000000), backgroundColor: Color(0xffffffff));
    }
  }

  signOut() async {
    await auth.signOut();

    print('signout');
  }

  
  //Google Authentication
   googleLogin() async{
    try {
     this.googleAccount.value = await GoogleSignIn().signIn();
     firebaseUser = googleAccount.value as User;
     uid = auth.currentUser!.uid;
     update();
     Get.to(() => Home());
    }catch (e) {
      Get.snackbar("Ocorreu um erro", e.toString(), colorText: Color(0xff000000), backgroundColor: Color(0xffffffff));
    }
  }

  googleLogout() async{
    try {
      this.googleAccount.value = await GoogleSignIn().signOut();

      Get.to(() => LoginInitial());
    }catch (e) {
      Get.snackbar("Ocorreu um erro", e.toString(), colorText: Color(0xff000000), backgroundColor: Color(0xffffffff));
    }
  }

}