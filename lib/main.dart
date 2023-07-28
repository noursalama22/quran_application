import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quran_app/constants.dart';
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
      home: PageSurah(),
    );
  }
}

class PageSurah extends StatelessWidget {
  const PageSurah({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'تطبيق القرآن الكريم',
            style: TextStyle(
                color: color,
                fontSize: 20,
                fontFamily: "HafsQuran",
                fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            labelPadding: EdgeInsets.zero,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            indicatorColor: color,
            labelColor: color,
            unselectedLabelColor: Color(0xFF8789A3),
            tabs: [
              Tab(
                // icon: Image(
                //   image: AssetImage(
                //     'assets/images/quranVector.png',
                //   ),
                //   fit: BoxFit.contain,
                //   color: Color(0xFF8789A3),
                // ),
                  text: "السور القرآنية"),
              Tab(
                // icon: Icon(Icons.directions_transit),
                text: "الصفحات",
              ),
            ],
          ),
          // leading: Icon(
          //   Icons.menu_book_outlined,
          //   size: 36,
          // ),
        ),
        body: TabBarView(
          children: [
            SurahsOfQuran(),
            PagesOfQuran(),
          ],
        ),
      ),
    );
  }
}
