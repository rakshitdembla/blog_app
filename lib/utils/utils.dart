import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:blog_app/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:timeago/timeago.dart" as timeago;
import '../presentation/routes/router_imports.gr.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  Utils._();

  //sharedprefrences functions
  static Future<bool> savetoken({required String token}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString("token", token);
  }

  static Future<String?> gettoken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static Future<bool> saveuserid({required int id}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setInt("id", id);
  }

  static Future<int?> getuserid() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("id");
  }

  static Future<bool> clearPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<Map<String, dynamic>> finaltoken() async {
    final gettoken = await Utils.gettoken();
    final String token = "Bearer $gettoken";

    Map<String, dynamic> postheaders = {"Authorization": token};
    return postheaders;
  }

  static Future<bool> savelanguage({required Locale locale}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString("language", locale.toString());
  }

  static Future<String> getlanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

   
    var getlanguage = prefs.getString("language");

    if (getlanguage != null) {
      return getlanguage;
    } else {
      return "en-US";
    }
  }

  //login function

  static Future<void> manipulatelogin(context) async {
    var token = await gettoken();

    if (token != null) {
      await Future.delayed(const Duration(seconds: 4), () {
        AutoRouter.of(context).push(const GeneralScreenRoute());
      });
    } else {
      await Future.delayed(const Duration(seconds: 4), () {
        AutoRouter.of(context).push(const OnboardRoute());
      });
    }
  }

  //snackbar functions

  static ScaffoldFeatureController errorsnackbar(
      {required String message, required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: Text(
        message,
        style:
            TextStyle(fontWeight: FontWeight.w500, color: MyColors.whitecolor),
      ),
      backgroundColor: Colors.red,
    ));
  }

  static ScaffoldFeatureController successsnackbar(
      {required String message, required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: Text(
        message,
        style:
            TextStyle(fontWeight: FontWeight.w500, color: MyColors.whitecolor),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 101, 24),
    ));
  }

  static ScaffoldFeatureController normalsnackbar(
      {required String message, required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: Text(
        message,
        style:
            TextStyle(fontWeight: FontWeight.w500, color: MyColors.whitecolor),
      ),
      backgroundColor: MyColors.primarycolor,
    ));
  }

//Toast functions
  static void showToast(
      {required String message,
      Color backgroundColor = const Color.fromARGB(148, 158, 158, 158),
      Color fontColor = Colors.white}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: fontColor,
        fontSize: 16.0);
  }

  //packages functions
  static String timeAgo(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate);
    return timeago.format(dateTime);
  }

  static Future<File?> pickimage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }
}
