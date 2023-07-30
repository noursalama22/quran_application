import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/assest.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/main.dart';
import 'package:quran_app/screen/quranScreen.dart';
import 'package:quran_app/screen/tabScreen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    // Isolate.spawn(getData(), '');
    Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return PageSurah();
        },
      ));
    });
  }

  getData() async {
    await Asset().loadJsonData();
    Asset().getAllPages();
    // print(Asset().allpages);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
              'قرآني حياتي',style: TextStyle(color: color,fontWeight: FontWeight.bold),
              //   style: GoogleFonts.o\(
              //     fontSize: 20,
              //     color: color,
              //   ),
            ),
            Image(
              image: AssetImage('assets/images/launch.png'),
            ),
          ],
        ),
      ),
    );
  }
}
