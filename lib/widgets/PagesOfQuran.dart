import 'package:flutter/material.dart';
import 'package:quran_app/assest.dart';
import 'package:quran_app/screen/pageContentScreen.dart';
import 'package:quran_app/screen/quranScreen.dart';
import 'package:quran_app/to_arabic_no_converter.dart';

class PagesOfQuran extends StatefulWidget {
  const PagesOfQuran({Key? key}) : super(key: key);

  @override
  State<PagesOfQuran> createState() => _PagesOfQuranState();
}

class _PagesOfQuranState extends State<PagesOfQuran> {
  late List<dynamic> pages = [];

  @override
  void initState() {
    super.initState();
    pages = Asset().allpages;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Quran(
                  page: index,
                );
              },
            ));
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          leading: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            //  height: double.infinity,
            decoration: const BoxDecoration(
                // color: Color(0xFF8789A3),
                ),
            child: Text(
              pages[index].surahNum.length == 1
                  ? '${pages[index].surahNum[0].toString().toArabicNumbers}'
                  : (pages[index].surahNum.length >= 2 &&
                          pages[index].ayahs[0].aya_no == 1)
                      ? '${pages[index].surahNum[0].toString().toArabicNumbers}'
                      : '${pages[index].surahNum[1].toString().toArabicNumbers}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          title: Text(
            pages[index].suraName.length == 1
                ? '${pages[index].suraName[0]}'
                : (pages[index].suraName.length >= 2 &&
                        pages[index].ayahs[0].aya_no == 1)
                    ? '${pages[index].suraName[0]}'
                    : '${pages[index].suraName[1]}',
            style: TextStyle(
              fontFamily: 'MeQuran',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Container(
            decoration: BoxDecoration(
                // color: color,
                ),
            child: Text(
              '${pages[index].pageNum.toString().toArabicNumbers}',
              style: TextStyle(
                fontSize: 24,
                // fontFamily: 'HafsQuran',
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 0,
          thickness: 1,
          // color: Colors.black45,
        );
      },
      itemCount: pages.length,
    );
  }
}
//ListTile(
//             onTap: () {},
//             leading: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                     'assets/images/Vector.png',
//                   ),
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               child: Text(
//                 '${pages[index]['sura_no'].toString().toArabicNumbers}',
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             title: Text(
//               '${pages[index]['sura_name_ar']}',
//               style: TextStyle(
//                 fontFamily: 'HafsQuran',
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             subtitle: Text('')
//             Text('${pages[index][].toString().toArabicNumbers}')
