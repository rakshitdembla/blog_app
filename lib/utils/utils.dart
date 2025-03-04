import 'package:auto_route/auto_route.dart';
import 'package:blog_app/core/constants/my_colors.dart';
import 'package:blog_app/presentation/screens/general/home/home_imports.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:timeago/timeago.dart" as timeago;
import '../presentation/routes/router_imports.gr.dart';

class Utils {
  static Future<bool> savetoken({required String token}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString("token", token);
  }

  static Future<String?> gettoken() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static Future<void> manipulatelogin(context) async{
    var token = await gettoken();

    if(token != null) {
      await Future.delayed(const Duration(seconds: 4), () {
      AutoRouter.of(context).push(GeneralScreenRoute());
    });

    } else {
      await Future.delayed(const Duration(seconds: 4), () {
      AutoRouter.of(context).push(OnboardRoute());
    });
    }
  }

  static Future<bool> clearPrefs() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
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
  static ScaffoldFeatureController normalsnackbar(
      {required String message, required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      message,
      style: TextStyle(fontWeight: FontWeight.w500, color: MyColors.whitecolor),
    ),backgroundColor: MyColors.primarycolor,));
  }

static String timeAgo(String isoDate) {
  DateTime dateTime = DateTime.parse(isoDate);
  return timeago.format(dateTime);
}
}
