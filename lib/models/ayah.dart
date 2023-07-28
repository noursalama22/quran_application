class Ayah {
  late int id;
  late int jozz;
  late int sura_no;
  late String sura_name_en;
  late String sura_name_ar;
  late int page;
  late int line_start;
  late int line_end;
  late int aya_no;
  late String aya_text;
  late String aya_text_emlaey;

  Ayah.fromJson(Map<String,dynamic> json) {
    id = json['id'].toInt();
    jozz = json['jozz'].toInt();
    sura_no = json['sura_no'].toInt();
    sura_name_en = json['sura_name_en'];
    sura_name_ar = json['sura_name_ar'];
    page = json['page'];
    line_start = json['line_start'];
    line_end = json['line_end'];
    aya_no = json['aya_no'];
    aya_text = json['aya_text'];
    aya_text_emlaey = json['aya_text_emlaey'];
  }
}
