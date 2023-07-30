import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quran_app/assest.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/models/ayah.dart';
import 'package:quran_app/models/page.dart';
import 'package:quran_app/screen/LaunchScreen.dart';
import 'package:quran_app/widgets/PagesOfQuran.dart';
import 'package:quran_app/widgets/surahs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('ar'),
      ],
      locale: Locale('ar'),
      debugShowCheckedModeBanner: false,
      title: 'Quran App',
      theme: ThemeData(
        primaryColor: color,
      ),
      home: LaunchScreen(),
    );
  }
}



