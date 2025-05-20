import 'package:flutter/material.dart';

class LanguageModel {

  final String title;
  final Locale locale;
  LanguageModel({required this.locale,required this.title});

  static List<LanguageModel> languagelist = [
    LanguageModel(locale: Locale('en-US'), title: "English"),
    LanguageModel(locale: Locale('hi-IN'), title: "Hindi"),
    
  ];
}