import 'dart:io';
import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inspeech/constants/colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../home.dart';
import 'ocrmodel.dart';

/**
 * The Practice class displays a script that the user can use to practice their talking speed.
 Based on speaking models, it scrolls the script at a speed that is recommended while talking and
 allows the user to push their limits and follow the script at the right pace.
 *
 * @author Kaushik Indukuri, Yuvraj Khullar, Akhil Giridhar, Derek Xu
 * @version 1.0
*/

class Practice extends StatefulWidget {
  @override
  _PracticeState createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  String _text =
      "Planet Earth, Each planet of the Solar system is unique in its own right, yet Earth has a whole set "
      "of really unique attires. First, it is fit only active planet the earthquakes and volcano eruptions constantly change is apparent. Second, "
      "it is the only planet that boasts vast resources of liquid water it's too hot or on Venus and too cold on Mars. The Earth's atmosphere is very"
      " unlike any other planet's gaseous shells. Earth neighbors' atmospheres consist mainly of carbon dioxide, while the Earth contains great amounts"
      "of oxygen and nitrogen, which form shield from the most dangerous components of solar radiation. The Earth's atmosphere also protects the planet from "
      "meteorites. More so, it is this unique combination of constantly changing land suite, oceans, and aerial shield that made it possible or another unique "
      "phenomenon -Life - to east on Earth. Seasons Every 24 hours the Earth completes a full revolution around its axis; which is inclined by 233° o the vertical."
      "This inclination is the reason thy seasons change on the Earth as it rotates around the Stn.,Structure The central part of Earth is a metal core; it's am; "
      "hot - some 4000°C, and it's rounded by a shell of liquid iron that creates de magnetic field of Earth. Outer layers form the mantle male up of rocky sttstarc "
      "es; over which are lighter substances that form the crust. The atmosphere is nude of nitrogen, oxygen, and a rnixnre of weer utpor am! othe gases. Magnetic bubble"
      " The rotation of Each arwnd its axis Frames forceful electrical rents in tenon core of the planet and this creates the magnetic field. This field forms a gins bubble "
      "in the near-Earth space called the magnetosphere. Magnetosphere proucts Each from the solar wind a flow of Charged particles emited 15. the Sun. These particles are "
      "tapped by the magnetic field in two loge rings - Van Allen's belts. V,ben spacecrafts travel through the Van Albn'sbeks; the electrical equip ram of the former may suffer"
      " malt= don caused 1:5. these particles. Clashing Continents The Each cost's made (romp: re called plates; utiCh float on its surface dricen by the flows in the liquid mantle."
      " The continents lie on than ;ate and so their location is subject to constant change. Soma 300 million years ago; all the cfty hod on Earth was a single contra r.t called "
      "Pangea by the scientists; which further split into the condnents we 3101V now. The lava rises by milkmen around the =train rids loosed on the ocean floor, and moves tha"
      " continent apart nben the continems chth; as they do around to shores of tha Pacific; the Earth's surface swelh up and moursain ridges rise up; if the ;taus go down into "
      "the mane, earthquakes and volcanic eriptions occur. This process; ailed plate tectonics; constandy changes the Earth's appearam e. Carved by water Many things on Each are "
      "carved by wirx1; yet even more - by water. The sea waves batde with thorn and ante high cliffs and steep slopes. The rivers ;gather beds and cut ccrolent valleys on Etch; like "
      "the Grand Canyon. The glaciers level the rammtains. Yet ftre the water may also create land: slow rivers, like Mississippi; create sediments in mots.";
  PickedFile _image;
  final picker = ImagePicker();
  bool showScript = false;
  bool scrollScript = false;
  ScrollController _scrollController = ScrollController();
  bool scroll = false;
  int speedFactor = 35;

  _scroll() {
    double maxExtent = _scrollController.position.maxScrollExtent;
    double distanceDifference = maxExtent - _scrollController.offset;
    double durationDouble = distanceDifference / speedFactor;

    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(seconds: durationDouble.toInt()),
        curve: Curves.linear);
  }

  _toggleScrolling() {
    setState(() {
      scroll = !scroll;
    });

    if (scroll) {
      _scroll();
    } else {
      _scrollController.animateTo(_scrollController.offset,
          duration: Duration(seconds: 1), curve: Curves.linear);
    }
  }

  createDialog(BuildContext context) {
    TextEditingController prez = TextEditingController();
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          int min = 0;
          int sec = 0;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
              ),
              content: Container(
                height: 146,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "$min minutes",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            decoration: TextDecoration.none,
                            color: darktext.withOpacity(0.8),
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "$sec seconds",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            decoration: TextDecoration.none,
                            color: darktext.withOpacity(0.8),
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: lightbackground.withOpacity(0.4),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Stack(
                                children: [
                                  Positioned(
                                    top: 6,
                                    left: 5,
                                    child: Icon(
                                      MdiIcons.minus,
                                      color: secondaryText.withOpacity(0.5),
                                      size: 27,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          min--;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 28,
                                width: 2,
                                decoration: BoxDecoration(
                                  color: secondaryText.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Stack(
                                children: [
                                  Positioned(
                                    top: 6,
                                    left: 5,
                                    child: Icon(
                                      MdiIcons.plus,
                                      color: secondaryText.withOpacity(0.5),
                                      size: 27,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          min++;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: lightbackground.withOpacity(0.4),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Stack(
                                children: [
                                  Positioned(
                                    top: 6,
                                    left: 5,
                                    child: Icon(
                                      MdiIcons.minus,
                                      color: secondaryText.withOpacity(0.5),
                                      size: 27,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          sec--;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 28,
                                width: 2,
                                decoration: BoxDecoration(
                                  color: secondaryText.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Stack(
                                children: [
                                  Positioned(
                                    top: 6,
                                    left: 5,
                                    child: Icon(
                                      MdiIcons.plus,
                                      color: secondaryText.withOpacity(0.5),
                                      size: 27,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          sec++;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 2,
                      width: 250,
                      decoration: BoxDecoration(
                        color: secondaryText.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Timed Scrolling",
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                decoration: TextDecoration.none,
                                color: darktext.withOpacity(0.8),
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          MaterialButton(
                              minWidth: 50,
                              height: 35,
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Icon(
                                Icons.check,
                                color: blueText,
                                size: 25,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightbackground,
      appBar: AppBar(
        toolbarHeight: size.height * 0.14,
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: lightbackground,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 2),
              child: Text(
                "Practice",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: darktext,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.lightBlue[600],
                          Colors.lightBlue[500],
                          Colors.lightBlue[400],
                          Colors.lightBlue[300],
                        ],
                        stops: [
                          0,
                          0.1,
                          0.3,
                          1
                        ]),
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: getImageFromGallery,
                    child: Row(
                      children: [
                        Text(
                          "Select Script",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 17,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.lightBlue[600],
                          Colors.lightBlue[500],
                          Colors.lightBlue[400],
                          Colors.lightBlue[300],
                        ],
                        stops: [
                          0,
                          0.1,
                          0.3,
                          1
                        ]),
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      createDialog(context);
                    },
                    child: Row(
                      children: [
                        Text(
                          "Time",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 17,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              bottom: 60,
              left: 55,
              child: Container(
                height: 40,
                width: size.width - 80,
                decoration: BoxDecoration(
                  color: lightbackground,
                  borderRadius: BorderRadius.circular(15),
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
              ),
            ),
            Positioned(
              bottom: 46,
              left: 310 / 2 + 15,
              child: Container(
                height: size.width - 310,
                width: size.width - 310,
                //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: scrollScript ? Color(0xffee6969) : blueText,
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {
                    setState(() {
                      scrollScript = !scrollScript;
                      _toggleScrolling();
                    });
                  },
                  child: Icon(
                    scrollScript
                        ? Icons.stop_outlined
                        : Icons.play_arrow_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              left: 340 / 5.5 + 15,
              child: SizedBox(
                width: 60,
                height: 40,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {
                    setState(() {
                      showScript = !showScript;
                    });
                  },
                  child: Icon(
                    Icons.refresh_outlined,
                    color: blueText,
                    size: 25,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              right: 340 / 5.5 - 15,
              child: SizedBox(
                width: 60,
                height: 40,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {
                    setState(() {
                      showScript = !showScript;
                    });
                  },
                  child: Icon(
                    MdiIcons.scanHelper,
                    color: blueText,
                    size: 19,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: NotificationListener(
        onNotification: (notif) {
          if (notif is ScrollEndNotification && scroll) {
            Timer(Duration(seconds: 1), () {
              _scroll();
            });
          }
          return true;
        },
        child: showScript
            ? Stack(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 80),
                      height: 80,
                      color: Colors.white.withOpacity(0.6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_right,
                            size: 30,
                          ),
                          Icon(
                            Icons.arrow_left,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    controller: _scrollController,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 25),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 225,
                          ),
                          Text(
                            _text,
                            style: TextStyle(fontSize: 27),
                            maxLines: 1000,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : selectScript(),
      ),
    );
  }

  File pickedImage;
  var imageFile;
  var result = '';
  bool isImageLoaded = false;

  getImageFromGallery() async {
    var tempStore = await ImagePicker().getImage(source: ImageSource.gallery);

    imageFile = await tempStore.readAsBytes();
    imageFile = await decodeImageFromList(imageFile);

    setState(() {
      pickedImage = File(tempStore.path);
      isImageLoaded = true;
      imageFile = imageFile;
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OCRModel()));
  }

  readTextfromanImage() async {
    result = '';
    FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(pickedImage);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(myImage);

    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          setState(() {
            result = result + ' ' + word.text;
          });
        }
      }
    }
  }

  Widget selectScript() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 170,
          ),
          Icon(
            MdiIcons.alertCircleOutline,
            color: secondaryText.withOpacity(0.7),
            size: 100,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Choose a Script",
            style: TextStyle(
              color: secondaryText.withOpacity(0.7),
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
