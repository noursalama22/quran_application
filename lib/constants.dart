import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String arabicFont = "quran";
double arabicFontSize = 28;
double mushafFontSize = 40;
Color color = Color(0xFF672CBC);
Uri quranAppUri = Uri.parse('');

Future saveSetting() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('arabicFontSize', arabicFontSize.toInt());
  await prefs.setInt('mushafFontSize', mushafFontSize.toInt());
}

Future getSetting() async {
  try {
    arabicFontSize = 28;
    mushafFontSize = 40;
    final prefs = await SharedPreferences.getInstance();
    arabicFontSize = await prefs.getInt('arabicFontSize')!.toDouble();
    mushafFontSize = await prefs.getInt('mushafFontSize')!.toDouble();
  } catch (_) {}
}

List<Map> arabicSurahName = [
  {"surah": "1", "name": "الفاتحة", "revelationType": "مكية"},
  {"surah": "2", "name": "البقرة", "revelationType": "مدنية"},
  {"surah": "3", "name": "آل عمران", "revelationType": "مدنية"},
  {"surah": "4", "name": "النساء", "revelationType": "مدنية"},
  {"surah": "5", "name": "المائدة", "revelationType": "مدنية"},
  {"surah": "6", "name": "الأنعام", "revelationType": "مكية"},
  {"surah": "7", "name": "الأعراف", "revelationType": "مكية"},
  {"surah": "8", "name": "الأنفال", "revelationType": "مدنية"},
  {"surah": "9", "name": "التوبة", "revelationType": "مدنية"},
  {"surah": "10", "name": "يونس", "revelationType": "مكية"},
  {"surah": "11", "name": "هود", "revelationType": "مكية"},
  {"surah": "12", "name": "يوسف", "revelationType": "مكية"},
  {"surah": "13", "name": "الرعد", "revelationType": "مدنية"},
  {"surah": "14", "name": "ابراهيم", "revelationType": "مكية"},
  {"surah": "15", "name": "الحجر", "revelationType": "مكية"},
  {"surah": "16", "name": "النحل", "revelationType": "مكية"},
  {"surah": "17", "name": "الإسراء", "revelationType": "مكية"},
  {"surah": "18", "name": "الكهف", "revelationType": "مكية"},
  {"surah": "19", "name": "مريم", "revelationType": "مكية"},
  {"surah": "20", "name": "طه", "revelationType": "مكية"},
  {"surah": "21", "name": "الأنبياء", "revelationType": "مكية"},
  {"surah": "22", "name": "الحج", "revelationType": "مدنية"},
  {"surah": "23", "name": "المؤمنون", "revelationType": "مكية"},
  {"surah": "24", "name": "النور", "revelationType": "مدنية"},
  {"surah": "25", "name": "الفرقان", "revelationType": "مكية"},
  {"surah": "26", "name": "الشعراء", "revelationType": "مكية"},
  {"surah": "27", "name": "النمل", "revelationType": "مكية"},
  {"surah": "28", "name": "القصص", "revelationType": "مكية"},
  {"surah": "29", "name": "العنكبوت", "revelationType": "مكية"},
  {"surah": "30", "name": "الروم", "revelationType": "مكية"},
  {"surah": "31", "name": "لقمان", "revelationType": "مكية"},
  {"surah": "32", "name": "السجدة", "revelationType": "مكية"},
  {"surah": "33", "name": "الأحزاب", "revelationType": "مكية"},
  {"surah": "34", "name": "سبإ", "revelationType": "مكية"},
  {"surah": "35", "name": "فاطر", "revelationType": "مكية"},
  {"surah": "36", "name": "يس", "revelationType": "مكية"},
  {"surah": "37", "name": "الصافات", "revelationType": "مكية"},
  {"surah": "38", "name": "ص", "revelationType": "مكية"},
  {"surah": "39", "name": "الزمر", "revelationType": "مكية"},
  {"surah": "40", "name": "غافر", "revelationType": "مكية"},
  {"surah": "41", "name": "فصلت", "revelationType": "مكية"},
  {"surah": "42", "name": "الشورى", "revelationType": "مكية"},
  {"surah": "43", "name": "الزخرف", "revelationType": "مكية"},
  {"surah": "44", "name": "الدخان", "revelationType": "مكية"},
  {"surah": "45", "name": "الجاثية", "revelationType": "مكية"},
  {"surah": "46", "name": "الأحقاف", "revelationType": "مكية"},
  {"surah": "47", "name": "محمد", "revelationType": "مدنية"},
  {"surah": "48", "name": "الفتح", "revelationType": "مدنية"},
  {"surah": "49", "name": "الحجرات", "revelationType": "مدنية"},
  {"surah": "50", "name": "ق", "revelationType": "مكية"},
  {"surah": "51", "name": "الذاريات", "revelationType": "مكية"},
  {"surah": "52", "name": "الطور", "revelationType": "مكية"},
  {"surah": "53", "name": "النجم", "revelationType": "مكية"},
  {"surah": "54", "name": "القمر", "revelationType": "مكية"},
  {"surah": "55", "name": "الرحمن", "revelationType": "مدنية"},
  {"surah": "56", "name": "الواقعة", "revelationType": "مكية"},
  {"surah": "57", "name": "الحديد", "revelationType": "مدنية"},
  {"surah": "58", "name": "المجادلة", "revelationType": "مدنية"},
  {"surah": "59", "name": "الحشر", "revelationType": "مدنية"},
  {"surah": "60", "name": "الممتحنة", "revelationType": "مدنية"},
  {"surah": "61", "name": "الصف", "revelationType": "مدنية"},
  {"surah": "62", "name": "الجمعة", "revelationType": "مدنية"},
  {"surah": "63", "name": "المنافقون", "revelationType": "مدنية"},
  {"surah": "64", "name": "التغابن", "revelationType": "مدنية"},
  {"surah": "65", "name": "الطلاق", "revelationType": "مدنية"},
  {"surah": "66", "name": "التحريم", "revelationType": "مدنية"},
  {"surah": "67", "name": "الملك", "revelationType": "مكية"},
  {"surah": "68", "name": "القلم", "revelationType": "مكية"},
  {"surah": "69", "name": "الحاقة", "revelationType": "مكية"},
  {"surah": "70", "name": "المعارج", "revelationType": "مكية"},
  {"surah": "71", "name": "نوح", "revelationType": "مكية"},
  {"surah": "72", "name": "الجن", "revelationType": "مكية"},
  {"surah": "73", "name": "المزمل", "revelationType": "مكية"},
  {"surah": "74", "name": "المدثر", "revelationType": "مكية"},
  {"surah": "75", "name": "القيامة", "revelationType": "مكية"},
  {"surah": "76", "name": "الانسان", "revelationType": "مدنية"},
  {"surah": "77", "name": "المرسلات", "revelationType": "مكية"},
  {"surah": "78", "name": "النبإ", "revelationType": "مكية"},
  {"surah": "79", "name": "النازعات", "revelationType": "مكية"},
  {"surah": "80", "name": "عبس", "revelationType": "مكية"},
  {"surah": "81", "name": "التكوير", "revelationType": "مكية"},
  {"surah": "82", "name": "الإنفطار", "revelationType": "مكية"},
  {"surah": "83", "name": "المطففين", "revelationType": "مكية"},
  {"surah": "84", "name": "الإنشقاق", "revelationType": "مكية"},
  {"surah": "85", "name": "البروج", "revelationType": "مكية"},
  {"surah": "86", "name": "الطارق", "revelationType": "مكية"},
  {"surah": "87", "name": "الأعلى", "revelationType": "مكية"},
  {"surah": "88", "name": "الغاشية", "revelationType": "مكية"},
  {"surah": "89", "name": "الفجر", "revelationType": "مكية"},
  {"surah": "90", "name": "البلد", "revelationType": "مكية"},
  {"surah": "91", "name": "الشمس", "revelationType": "مدنية"},
  {"surah": "92", "name": "الليل", "revelationType": "مدنية"},
  {"surah": "93", "name": "الضحى", "revelationType": "مكية"},
  {"surah": "94", "name": "الشرح", "revelationType": "مكية"},
  {"surah": "95", "name": "التين", "revelationType": "مكية"},
  {"surah": "96", "name": "العلق", "revelationType": "مكية"},
  {"surah": "97", "name": "القدر", "revelationType": "مكية"},
  {"surah": "98", "name": "البينة", "revelationType": "مدنية"},
  {"surah": "99", "name": "الزلزلة", "revelationType": "مدنية"},
  {"surah": "100", "name": "العاديات", "revelationType": "مكية"},
  {"surah": "101", "name": "القارعة", "revelationType": "مكية"},
  {"surah": "102", "name": "التكاثر", "revelationType": "مكية"},
  {"surah": "103", "name": "العصر", "revelationType": "مكية"},
  {"surah": "104", "name": "الهمزة", "revelationType": "مكية"},
  {"surah": "105", "name": "الفيل", "revelationType": "مكية"},
  {"surah": "106", "name": "قريش", "revelationType": "مكية"},
  {"surah": "107", "name": "الماعون", "revelationType": "مكية"},
  {"surah": "108", "name": "الكوثر", "revelationType": "مكية"},
  {"surah": "109", "name": "الكافرون", "revelationType": "مكية"},
  {"surah": "110", "name": "النصر", "revelationType": "مدنية"},
  {"surah": "111", "name": "المسد", "revelationType": "مكية"},
  {"surah": "112", "name": "الإخلاص", "revelationType": "مكية"},
  {"surah": "113", "name": "الفلق", "revelationType": "مكية"},
  {"surah": "114", "name": "الناس", "revelationType": "مكية"}
];

List<int> noOfVerses = [
  7,
  286,
  200,
  176,
  120,
  165,
  206,
  75,
  129,
  109,
  123,
  111,
  43,
  52,
  99,
  128,
  111,
  110,
  98,
  135,
  112,
  78,
  118,
  64,
  77,
  227,
  93,
  88,
  69,
  60,
  34,
  30,
  73,
  54,
  45,
  83,
  182,
  88,
  75,
  85,
  54,
  53,
  89,
  59,
  37,
  35,
  38,
  29,
  18,
  45,
  60,
  49,
  62,
  55,
  78,
  96,
  29,
  22,
  24,
  13,
  14,
  11,
  11,
  18,
  12,
  12,
  30,
  52,
  52,
  44,
  28,
  28,
  20,
  56,
  40,
  31,
  50,
  40,
  46,
  42,
  29,
  19,
  36,
  25,
  22,
  17,
  19,
  26,
  30,
  20,
  15,
  21,
  11,
  8,
  8,
  19,
  5,
  8,
  8,
  11,
  11,
  8,
  3,
  9,
  5,
  4,
  7,
  3,
  6,
  3,
  5,
  4,
  5,
  6
];