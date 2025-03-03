import 'package:blog_app/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static Future<bool> savetoken({required String token}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString("token", token);
  }

  static ScaffoldFeatureController errorsnackbar(
      {required String message, required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      message,
      style: TextStyle(fontWeight: FontWeight.w500, color: MyColors.whitecolor),
    ),backgroundColor: Colors.red,));
  }

  
  static ScaffoldFeatureController successsnackbar(
      {required String message, required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      message,
      style: TextStyle(fontWeight: FontWeight.w500, color: MyColors.whitecolor),
    ),backgroundColor: const Color.fromARGB(255, 1, 223, 53),));
  }
}
