import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:inspeech/constants/colors.dart';
import 'package:inspeech/constants/price-prediction.dart';

/**
 * Class SpeechDetail mostly controls
 * the UI of the speech page. 
 *
 * @author Kaushik Indukuri, Yuvraj Khullar, Akhil Giridhar, Derek Xu
 * @version 1.0
 */

class SpeechDetail extends StatefulWidget {
  final String name;
  final String content;
  SpeechDetail(this.name, this.content);

  @override
  _SpeechDetailState createState() => _SpeechDetailState();
}

class _SpeechDetailState extends State<SpeechDetail> {
  final Map<String, HighlightedWord> _highlights = {
    'basically': HighlightedWord(
      onTap: () => print('basically'),
      textStyle: const TextStyle(
        fontSize: 16,
        color: blueText,
        fontWeight: FontWeight.bold,
      ),
    ),
    'yeah': HighlightedWord(
      onTap: () => print('um'),
      textStyle: const TextStyle(
        fontSize: 16,
        color: blueText,
        fontWeight: FontWeight.bold,
      ),
    ),
    'like': HighlightedWord(
      onTap: () => print('like'),
      textStyle: const TextStyle(
        fontSize: 16,
        color: blueText,
        fontWeight: FontWeight.bold,
      ),
    ),
    'okay': HighlightedWord(
      onTap: () => print('uh'),
      textStyle: const TextStyle(
        color: blueText,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    'right': HighlightedWord(
      onTap: () => print('you know'),
      textStyle: const TextStyle(
        fontSize: 16,
        color: blueText,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  Widget spectrum(
      String title, double dist, String left, String middle, String right) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: "OpenSans",
              decoration: TextDecoration.none,
              color: darktext.withOpacity(0.8),
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 13),
                margin: EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                  color: lightbackground,
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[500],
                        offset: Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 28,
                          height: 7,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                        ),
                        Container(
                          width: 28,
                          height: 7,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                          ),
                        ),
                        Container(
                          width: 28,
                          height: 7,
                          decoration: BoxDecoration(
                            color: Colors.amberAccent,
                          ),
                        ),
                        Container(
                          width: 28,
                          height: 7,
                          decoration: BoxDecoration(
                            color: Colors.lightGreen.withOpacity(0.8),
                          ),
                        ),
                        Container(
                          width: 28,
                          height: 7,
                          decoration: BoxDecoration(
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          width: 28,
                          height: 7,
                          decoration: BoxDecoration(
                            color: Colors.lightGreen.withOpacity(0.8),
                          ),
                        ),
                        Container(
                          width: 28,
                          height: 7,
                          decoration: BoxDecoration(
                            color: Colors.amberAccent,
                          ),
                        ),
                        Container(
                          width: 28,
                          height: 7,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                          ),
                        ),
                        Container(
                          width: 28,
                          height: 7,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: secondaryText,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            middle,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: secondaryText,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            right,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: secondaryText,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 12,
                left: dist,
                child: Container(
                  height: 22,
                  width: 5,
                  decoration: BoxDecoration(
                    color: darktext,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightbackground,
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * 0.24,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.lightBlue[800],
                        Colors.lightBlue[700],
                        Colors.lightBlue[600],
                        Colors.lightBlue[300],
                      ],
                      stops: [
                        0,
                        0.1,
                        0.3,
                        1
                      ]),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Icon(Icons.arrow_back_ios,
                                    size: 20, color: Colors.white),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "Speech Name:",
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Hero(
                                  tag: widget.name,
                                  child: Text(
                                    widget.name,
                                    style: TextStyle(
                                      fontFamily: "OpenSansBold",
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 22,
              child: Text(
                "Analytics",
                style: TextStyle(
                  fontFamily: "OpenSans",
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              top: 135,
              child: Container(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17)),
                      elevation: 5,
                      color: lightbackground,
                      child: Container(
                        height: 110,
                        width: 135,
                        padding: EdgeInsets.only(left: 17, top: 17, right: 17),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Duration",
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                decoration: TextDecoration.none,
                                color: darktext,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "0:22",
                              style: TextStyle(
                                fontFamily: "OpenSansBold",
                                decoration: TextDecoration.none,
                                color: blueText,
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "seconds",
                              style: TextStyle(
                                fontFamily: "OpenSansBold",
                                decoration: TextDecoration.none,
                                color: blueText,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17)),
                      elevation: 5,
                      color: lightbackground,
                      child: Container(
                        height: 110,
                        width: 135,
                        padding: EdgeInsets.all(17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tone",
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                decoration: TextDecoration.none,
                                color: darktext,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Neutral",
                              style: TextStyle(
                                fontFamily: "OpenSansBold",
                                decoration: TextDecoration.none,
                                color: blueText,
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.668,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22, bottom: 8),
                        child: Text(
                          "WPM During Speech",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            decoration: TextDecoration.none,
                            color: darktext.withOpacity(0.8),
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.only(left: 22, right: 22, bottom: 5),
                        color: Colors.grey[300],
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(17),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[500],
                                  offset: Offset(4.0, 4.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0),
                              BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-4.0, -4.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 9.0,
                              right: 30.0,
                              top: 24.0,
                              bottom: 8.0,
                            ),
                            child: LineChartSample4(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      spectrum("Volume", 210, "Quiet", "Sweet Zone", "Loud"),
                      SizedBox(
                        height: 16,
                      ),
                      spectrum("Pace", 106, "120 & below", "120-145 wpm",
                          "145 & up"),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 7),
                            child: Text(
                              "Filler Words",
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                decoration: TextDecoration.none,
                                color: darktext.withOpacity(0.8),
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 20, bottom: 13),
                                  margin: EdgeInsets.symmetric(horizontal: 22),
                                  decoration: BoxDecoration(
                                    color: lightbackground,
                                    borderRadius: BorderRadius.circular(17),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[500],
                                          offset: Offset(4.0, 4.0),
                                          blurRadius: 15.0,
                                          spreadRadius: 1.0),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-4.0, -4.0),
                                          blurRadius: 15.0,
                                          spreadRadius: 1.0),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: 50,
                                              height: 7,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                ),
                                                color: Colors.green,
                                              )),
                                          Container(
                                            width: 50,
                                            height: 7,
                                            decoration: BoxDecoration(
                                              color: Colors.lightGreen
                                                  .withOpacity(0.8),
                                            ),
                                          ),
                                          Container(
                                            width: 50,
                                            height: 7,
                                            decoration: BoxDecoration(
                                              color: Colors.amberAccent,
                                            ),
                                          ),
                                          Container(
                                            width: 50,
                                            height: 7,
                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                            ),
                                          ),
                                          Container(
                                            width: 50,
                                            height: 7,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 30, right: 30, top: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Sweet Zone",
                                              style: TextStyle(
                                                decoration: TextDecoration.none,
                                                color: secondaryText,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "Too Many",
                                              style: TextStyle(
                                                decoration: TextDecoration.none,
                                                color: secondaryText,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  left: 240,
                                  child: Container(
                                    height: 22,
                                    width: 5,
                                    decoration: BoxDecoration(
                                      color: darktext,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: Text(
                                "Transcript",
                                style: TextStyle(
                                  fontFamily: "OpenSans",
                                  decoration: TextDecoration.none,
                                  color: darktext.withOpacity(0.8),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            TextHighlight(
                              text: widget.content,
                              words: _highlights,
                              textStyle: const TextStyle(
                                fontFamily: "OpenSans",
                                decoration: TextDecoration.none,
                                color: darktext,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
