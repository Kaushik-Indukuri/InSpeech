import 'package:flutter/material.dart';
import 'package:inspeech/constants/background-painter.dart';
import 'package:inspeech/constants/colors.dart';

class OCRModel extends StatefulWidget {
  @override
  _OCRModelState createState() => _OCRModelState();
}

class _OCRModelState extends State<OCRModel> {
  TextEditingController script = new TextEditingController();

  @override
  void initState() {
    super.initState();
    script = TextEditingController(
        text:
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
            "the Grand Canyon. The glaciers level the rammtains. Yet ftre the water may also create land: slow rivers, like Mississippi; create sediments in mots.");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightbackground,
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 7, bottom: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SafeArea(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SafeArea(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                              width: 1.5,
                              color: blueText,
                            )),
                        child: Center(
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'Okay',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: blueText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    //color: Colors.red,
                    image: DecorationImage(
                  image: AssetImage('assets/ocrappdemo.jpeg'),
                  fit: BoxFit.contain,
                )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Check Script',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: script,
                      //style: TextStyle(color: Colors.white),
                      cursorColor: Colors.black,
                      maxLines: 7,
                      decoration: InputDecoration(
                        hintText: "Script",
                        hintStyle: TextStyle(color: secondaryText),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: secondaryText, width: 2)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: secondaryText, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
