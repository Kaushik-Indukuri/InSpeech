import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:inspeech/constants/background-painter.dart';
import 'package:inspeech/constants/colors.dart';
import 'package:inspeech/screens/home.dart';
import 'package:inspeech/services/helperfunctions.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/**
 * Class Speech converts speech to text
 * via Web Speech API in real time to determine 
 * the words per minute over the duration of the speech.
 *
 * @author Kaushik Indukuri, Yuvraj Khullar, Akhil Giridhar, Derek Xu
 * @version 1.0
 */

class Speech extends StatefulWidget {
  @override
  _SpeechState createState() => _SpeechState();
}

String _username = "";

class _SpeechState extends State<Speech> {
  CollectionReference ref = FirebaseFirestore.instance.collection('speeches');

  final Map<String, HighlightedWord> _highlights = {
    'basically': HighlightedWord(
      onTap: () => print('basically'),
      textStyle: const TextStyle(
        color: blueText,
        fontWeight: FontWeight.bold,
      ),
    ),
    'um': HighlightedWord(
      onTap: () => print('um'),
      textStyle: const TextStyle(
        color: blueText,
        fontWeight: FontWeight.bold,
      ),
    ),
    'like': HighlightedWord(
      onTap: () => print('like'),
      textStyle: const TextStyle(
        color: blueText,
        fontWeight: FontWeight.bold,
      ),
    ),
    'uh': HighlightedWord(
      onTap: () => print('uh'),
      textStyle: const TextStyle(
        color: blueText,
        fontWeight: FontWeight.bold,
      ),
    ),
    'you know': HighlightedWord(
      onTap: () => print('you know'),
      textStyle: const TextStyle(
        color: blueText,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button below to start';
  double _confidence = 1.0;

  getUserInfo() async {
    _username = await HelperFunctions.getUserNameSharedPreference();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: paletteBlue,
      body: Stack(
        children: [
          Container(
            height: size.height * 0.22,
            width: size.width,
            child: CustomPaint(
              painter: SpeechPainter(),
            ),
          ),
          Positioned(
            top: 50,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios,
                            size: 22, color: Colors.white),
                      ),
                      Column(
                        children: [
                          Text(
                            "   Present",
                            style: TextStyle(
                                fontFamily: "OpenSansBold",
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 74,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                              width: 1.5,
                              color: Colors.white,
                            )),
                        child: Center(
                          child: MaterialButton(
                            onPressed: () {
                              createDialog(context);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'WPM: ${((_confidence * 100.0) + 20).toStringAsFixed(1)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width,
              height: size.height * 0.825,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 150),
                  child: Text(
                    _text,
                    style: const TextStyle(
                      fontSize: 30,
                      color: darktext,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: size.width * .315,
            bottom: 5,
            child: AvatarGlow(
              animate: _isListening,
              glowColor: darkBlue,
              endRadius: size.width * 0.19,
              duration: const Duration(milliseconds: 2000),
              repeatPauseDuration: const Duration(milliseconds: 50),
              repeat: true,
              child: Container(
                height: 70,
                width: 70,
                //margin: EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightbackground,
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
                child: IconButton(
                  onPressed: _listen,
                  icon: Icon(Icons.mic, size: 42, color: blueText),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  createDialog(BuildContext context) {
    TextEditingController prez = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
            title: Text(
              "Name this Presentation",
              style: TextStyle(color: blueText, fontWeight: FontWeight.bold),
            ),
            content: TextFormField(
              controller: prez,
              obscureText: false,
              decoration: InputDecoration(
                //prefixIcon: Icon(Icons.name, color: blueText,),
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.grey[500].withOpacity(.9)),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.grey[500].withOpacity(0.7))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.grey[500].withOpacity(0.7))),
              ),
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 55, bottom: 10),
                decoration: BoxDecoration(
                  gradient: primaryGradient,
                  borderRadius: BorderRadius.circular(50),
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
                child: MaterialButton(
                  minWidth: 150,
                  height: 52,
                  onPressed: () async {
                    ref.add({
                      'content': _text,
                      'user': _username,
                      'name': prez.text,
                    }).whenComplete(() => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home())));
                    setState(() {});
                  },
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
