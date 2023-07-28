import 'package:flutter/material.dart';
import 'package:quran_app/to_arabic_no_converter.dart';

import '../constants.dart';

class SurahsOfQuran extends StatefulWidget {
  const SurahsOfQuran({Key? key}) : super(key: key);

  @override
  State<SurahsOfQuran> createState() => _SurahsOfQuranState();
}

class _SurahsOfQuranState extends State<SurahsOfQuran> {
  List<Map> surahs = arabicSurahName;
  List<int> noVerses = noOfVerses;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          onTap: () {},
          leading: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/Vector.png',
                ),
                fit: BoxFit.contain,
              ),
            ),
            child: Text(
              '${arabicSurahName[index]['surah'].toString().toArabicNumbers}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          title: Text(
            '${arabicSurahName[index]['name']}',
            style: TextStyle(
              fontFamily: 'MeQuran',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle:
              Text('آياتها ${noVerses[index].toString().toArabicNumbers}'),
          trailing: Text('${arabicSurahName[index]['revelationType']}'),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 0,
          indent: 10,
          endIndent: 10,
          thickness: 1,
        );
      },
      itemCount: arabicSurahName.length,
    );
  }
}
