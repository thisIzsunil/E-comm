import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/app-constant.dart';
import '../auth-ui/welcome-screen.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppConstant.appScendoryColor,
          statusBarBrightness: Brightness.light
        ),
        backgroundColor:AppConstant.appMainColor ,
        title:Text(AppConstant.appMainName),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: ()async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              FirebaseAuth _auth =FirebaseAuth.instance;
              await _auth.signOut();
              await googleSignIn.signOut();
             Get.offAll(()=> WelcomeScreen()); 
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.logout),
            ),
          ),
        ]
      ),
    );
  }
}