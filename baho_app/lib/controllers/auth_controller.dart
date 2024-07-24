import 'package:baho_app/consts/consts.dart';
import 'package:baho_app/views/Login_view/login_view.dart';
import 'package:baho_app/views/home_view/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  UserCredential? userCredential;

  isUserAlreadyLoggedIn() async {
    await FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Get.offAll(() => HomeView());
      } else {
        Get.offAll(() => LoginView());
      }
    });
  }

  loginUser() async {
    userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  signupUser() async {
    userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    if (userCredential != null) {
      await storeUserData(userCredential!.user!.uid, fullnameController.text,
          emailController.text);
    }
  }

  storeUserData(String uid, String fullname, String email) async {
    var store = FirebaseFirestore.instance.collection('users').doc(uid);
    await store.set({'fullname': fullname, 'email': email});
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
