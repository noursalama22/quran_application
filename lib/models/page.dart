import 'package:quran_app/models/ayah.dart';

class QPage {
  late List<Ayah> ayahs;
  late int pageNum;
  late List<int> surahNum;
  late List<String> suraName;

  QPage(
      {required this.ayahs,
      required this.pageNum,
      required this.suraName,
      required this.surahNum});

 List<Ayah> getAyahs() {
    return ayahs;
  }
}
