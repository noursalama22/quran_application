import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_app/models/ayah.dart';
import 'package:quran_app/models/page.dart';

class Asset {
  Future<List<dynamic>> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/hafs_smart_v8.json');
    if (jsonText.isNotEmpty) {
      List<dynamic> ayahs = jsonDecode(jsonText);
      List<Page> pages = [];

      ayahs.forEach((ayah) {
        if (pages.length != ayah['page']) {
          pages.add(Page(
              ayahs: [Ayah.fromJson(ayah)],
              pageNum: ayah['page'],
              suraName: [ayah['sura_name_ar']],
              surahNum: [ayah['sura_no']]));
        } else {
          pages[ayah['page'] - 1].ayahs.add(Ayah.fromJson(ayah));
          if (ayah['aya_no'] == 1) {
            pages[ayah['page'] - 1].suraName.add(ayah['sura_name_ar']);
            pages[ayah['page'] - 1].surahNum.add(ayah['sura_no']);
          }
        }
      });
      // for (int i = 1; i <= 604; i++) {
      //   List<String> suraName = [];
      //   List<Ayah> ayahsOfPage = [];
      //   List<int> suraNum = [];
      //   ayahs.forEach((element) {
      //     if (element['page'] == i) {
      //       Ayah ayah = Ayah.fromJson(element);
      //       ayahsOfPage.add(ayah);
      //       if (ayah.aya_no == 1) {
      //         suraName.add(ayah.sura_name_ar);
      //         suraNum.add(ayah.sura_no);
      //       }
      //       ;
      //       // suraName = ayah.aya_no == 1  ? ayah.sura_name_ar : ayah.sura_name_ar;
      //     }
      //   });
      //   if (suraName.isEmpty) {
      //     suraName.add(ayahsOfPage[0].sura_name_ar);
      //     suraNum.add(ayahsOfPage[0].sura_no);
      //   }
      //   ;
      //   pages.add(Page(
      //     ayahs: ayahsOfPage,
      //     pageNum: i,
      //     suraName: suraName,
      //     surahNum: suraNum[0],
      //   ));
      //   print(pages[0].ayahs[0].aya_text_emlaey);
      // }

      return pages;
    }
    return Future.error('error');
  }
}
