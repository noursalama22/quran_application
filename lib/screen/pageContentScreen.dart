import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quran_app/models/ayah.dart';
import 'package:quran_app/models/page.dart';

class PageContentScreen extends StatefulWidget {
  PageContentScreen({Key? key, required this.pageNumber, required this.pages})
      : super(key: key);
  final List<dynamic> pages;
  int pageNumber;
  @override
  State<PageContentScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<PageContentScreen> {
  @override
  String basmala = "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏";
  // List<Ayah> ayahs = widget.pages[widget.pageNumber].ayahs;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.pages == null
            ? const CircularProgressIndicator()
            : PageView.builder(
                itemCount: 604,
                onPageChanged: (value) {
                  setState(() {
                    if ((value + widget.pageNumber) > widget.pageNumber) {                   
                      widget.pageNumber = 1 + widget.pageNumber;
                     } 
                     else if ((value + widget.pageNumber) ==
                        widget.pageNumber) {
                           print('${widget.pageNumber} + $value');
                      widget.pageNumber = widget.pageNumber - 1;
                    }

                    // print(value);
                    // widget.pageNumber = widget.pageNumber + value;
                  });
                },
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Visibility(
                                visible: true,
                                child: Text(
                                  basmala,
                                  style: const TextStyle(
                                    fontFamily: 'HafsQuran',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      for (Ayah ayah in (widget
                                          .pages[widget.pageNumber - 1]
                                          .ayahs)) ...{
                                        TextSpan(
                                          text: ayah.aya_text,
                                          style: const TextStyle(
                                            fontFamily: 'HafsQuran',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      }
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text((widget.pageNumber).toString()),
                              //  for(i=0;i<widget.pages[widget.pageNumber - 1].ayahs.length ; i++){
                              //   Text(widget.pages[widget.pageNumber - 1].ayahs);
                              //  }
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
